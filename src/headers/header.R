library(tidyverse)
library(tidyquant)
library(readxl)
library(tidyfinance)
library(GetDFPData2)
library(future)
library(stringdist)
library(httr)
library(jsonlite)
library(zip)
library(readr)
library(doParallel)
library(rb3)
library(sidrar)
library(quadprog)
library(matrixcalc)
library(corpcor)
library(GetBCBData)
# install.packages(c('rvest', 'httr', 'tidyverse', 'tidyquant'))

resolve_name <- function(data = list(tibble(), tibble())){
  names(data) <- gsub("^[\r\n]+", "", names(data))
  return(data)
}

tranform_data <- function(data) {
  tmp = c()
  for(col_name in names(data)){
    if(col_name != "Ano"){
      for(i in data[col_name]){
        tmp <- append(tmp, i)
      }
    }
  }
  return(tmp)
}


#-------------------------- Manipulação de DFP ------------------------------------------

read_csv_from_zip <- function(zip_path) {
  # Extrair o arquivo ZIP para uma pasta temporária
  unzip(zip_path, exdir = tempdir())
  
  # Listar os arquivos extraídos
 
  files <- list.files(tempdir(), pattern = "(itr|dfp|fre)_cia_aberta_(BPP|BPA|capital)_(con|social)_(2017|2018|2019|2020|2021|2022|2023|2024).csv$", full.names = TRUE)
  print(files)
  # Ler todos os arquivos CSV e retorná-los como uma lista de dataframes
  csv_data <- map(files, ~read_delim(.x, delim = ";", show_col_types = FALSE))
  
  # Concatenar todos os CSVs em um único tibble
  csv_data <- bind_rows(csv_data[1], csv_data[2])
  
  return(csv_data)
}

process_files <- function(directory, map_tickers) {
  # Listar todos os arquivos ZIP no diretório
  zip_files <- list.files(directory, pattern = "*._cia_aberta_.*\\.zip", full.names = TRUE)
  # Processar cada arquivo ZIP
  all_data <- map(zip_files, function(zip_file) {
    unlink(file.path(tempdir(), "*"), recursive = TRUE)
    # Ler os CSVs dentro do arquivo ZIP
    data <- read_csv_from_zip(zip_file)
   
    if(directory == 'fre_data_cache'){
      filtered_data <- data %>%
        filter(CNPJ_Companhia  %in% map_tickers$CNPJ)
      return(filtered_data)
    }else {
      filtered_data <- data %>%
        filter(as.double(CD_CVM)  %in% as.double(map_tickers$CD_CVM))
      return(filtered_data)
    }
    
  })

  # Concatenar todos os resultados em um único tibble
  return(all_data)
}


#Codado Trimestral e anual como também o aspecto informacional para ambos
#IMPORTANTE: POR ALGUM MOTIVO A EMPRESA AZZA3 ESTÁ SEM OS DADOS DE FRE JUNTO A CVM NOS ANOS DE 2018, 2019 e 2020, logo ela fica sem B/M para esses anos
calc_market_value <- function(prices, stocks_quantity, ptr_liq, TRI = FALSE, INFO = FALSE) {
  if(INFO) {
    if(TRI){
      dates <- ptr_liq %>% mutate(
        refer = month(DT_REFER)+2, year_refer = year(DT_REFER)
      ) %>% distinct() %>% filter(refer != 14)
      
    }else {
      
      dates <- ptr_liq %>% mutate(refer = 4, year_refer = year(DT_REFER)+1)
    }
  }else {
    if(TRI){
      dates <- ptr_liq %>% mutate(
        refer = month(DT_REFER), year_refer = year(DT_REFER)
      ) %>% distinct() %>% filter(refer != 12)
    }else {
      dates <- ptr_liq %>% mutate(refer = 1, year_refer = year(DT_REFER)+1)
    }
  }
 
  valid_prices <- prices %>% 
    group_by(month = month(date), year = year(date), ticker) %>%
    filter((month(date) %in% dates$refer & day(date) >= 15 & year(date) %in% dates$year_refer)) %>%
    slice(1) %>%  ungroup()
  
  tmp <-  stocks_quantity %>%
    group_by( year = (year(Data_Referencia)-if_else(TRI, 0, 1)), ticker) %>%
    reframe(
      quantity = if_else(Quantidade_Acoes_Preferenciais != 0 & Quantidade_Acoes_Preferenciais > 1000, Quantidade_Acoes_Preferenciais, Quantidade_Acoes_Ordinarias),
    )%>%
    group_by(year, ticker) %>% slice_max(quantity, with_ties = FALSE)
  
  if(TRI){
    tmp <- tmp %>% mutate(year_offset = year) %>%
      inner_join(valid_prices, relationship = "many-to-many", by = c('ticker', 'year')) 
  }else {
    tmp <- tmp %>% mutate(year_offset = year + 1) %>%
      inner_join(valid_prices, by = c("ticker" = "ticker", "year_offset" = "year"))
  }
  
  market_value <- tmp %>%
    mutate(
      price = `adjusted price`,
      market_value = quantity * price
    )

  return(market_value)
}

calc_book_to_market <- function(ptr_liq, prices, stocks_quantity, TRI = FALSE, INFO = FALSE) {
 
  res <- ptr_liq %>% group_by(CNPJ_CIA) %>%
    reframe(
      dt_refer = DT_REFER,
      year = year(DT_REFER),
      ptr_liq = VL_CONTA*1000,
      nome = DENOM_CIA,
      ticker = ticker
    )
  if(INFO){
    if(TRI){
      res <- res %>% mutate(month = month(dt_refer) + 2)
    }else {
      res <- res %>% mutate(month = 4)
    }
  }else {
    if(TRI){
      res <- res %>% mutate(month = month(dt_refer))
    }else {
      res <- res %>% mutate(month = 1)
    }
  }
 
  res <- res %>%
    inner_join(
      calc_market_value(prices, stocks_quantity, ptr_liq, TRI, INFO),
      relationship = "many-to-many",
      by = c("ticker", "year", "month")
      ) %>%
    mutate(`B/M` = (ptr_liq)/market_value) %>% distinct()

  return(res)
}

book_to_market_index <- function(data, fre_val, TRI = FALSE, INFO = FALSE) {
  filtered_ptr_liq <- map(data, function(tibble) {
    tibble %>% filter(CD_CONTA == '2.03' & ORDEM_EXERC == '\xdaLTIMO')
  })
  
  
  filterde_fre_values <- map(fre_val, function(tibble){
    #tibble %>% filter(Tipo_Capital == "Capital Emitido") É necessário essa alteração pois a empresa SMTO3 entrega os demonstrativos em datas diferente
    #Ela entrega no mes 06, 09 e 12
    tibble %>% filter(Tipo_Capital == "Capital Emitido" | (CNPJ_Companhia == "51.466.860/0001-56" & Tipo_Capital == "Capital Integralizado"))
  })
  
  ptr_liq <- bind_rows(filtered_ptr_liq, .id = "source")
  stocks_quantity <- bind_rows(filterde_fre_values, .id = "source")
  
  ptr_liq <- ptr_liq %>% mutate(ticker = paste(stocks$Ticker[match(CNPJ_CIA, stocks$CNPJ)], "SA", sep = "."))
  stocks_quantity <- stocks_quantity %>% mutate(ticker = paste(stocks$Ticker[match(CNPJ_Companhia, stocks$CNPJ)], "SA", sep = ".")) 
  
  res <- calc_book_to_market(ptr_liq, stock_prices, stocks_quantity, TRI, INFO)
  #view(res)
  res <- res %>% mutate(
    trimestre = case_when(
      month %in% c(3, 8) ~ 2,
      month %in% c(6, 11) ~ 3,
      month %in% c(9) ~ 4,
      month %in% c(4, 5, 1) ~ 1,
      TRUE ~ `month`,
    )
  )

  return(res)
}

#--------------------------- Início das funções dos cálculos --------------------------------

#CORRIGIR
form_groups <- function(data, ano = 2018, trimestre = 1, TRI = FALSE, ALL = FALSE){
  if(ALL) {
    if(TRI) {
      tmp <- data %>% filter(`year` == ano & `trimestre` == !!trimestre)
    }else {
      tmp <- data %>% filter(`year_offset` == ano)
    }
    return(list(
      year_offset = ano,
      trimestre = trimestre,
      carteira = tmp
    ))
  }else {
    if(TRI){
      B_H <- data %>% filter(`year` == ano & `trimestre` == !!trimestre) %>%
        filter( 
          market_value > median(market_value, na.rm = TRUE) & 
            `B/M` > median(`B/M`, na.rm = TRUE)
        )
      B_l <- data %>% filter(`year` == ano & `trimestre` == !!trimestre) %>%
        filter(
          market_value > median(market_value, na.rm = TRUE) &
            `B/M` <= median(`B/M`, na.rm = TRUE)
        )
      
      s_H <- data %>% filter(`year` == ano & `trimestre` == !!trimestre) %>%
        filter(
          market_value <= median(market_value, na.rm = TRUE) &
            `B/M` > median(`B/M`, na.rm = TRUE)
        )
      
      s_l <- data %>% filter(`year` == ano & `trimestre` == !!trimestre) %>%
        filter(
          market_value <= median(market_value, na.rm = TRUE) &
            `B/M` <= median(`B/M`, na.rm = TRUE)
        )
    }else {
      B_H <- data %>% filter(year_offset == ano) %>%
        filter( 
          market_value > median(market_value, na.rm = TRUE) & 
            `B/M` > median(`B/M`, na.rm = TRUE)
        )
      
      B_l <- data %>% filter( `year_offset` == ano) %>%
        filter(
          market_value > median(market_value, na.rm = TRUE) &
            `B/M` <= median(`B/M`, na.rm = TRUE)
        )
      
      s_H <- data %>% filter(`year_offset` == ano) %>%
        filter(
          market_value <= median(market_value, na.rm = TRUE) &
            `B/M` > median(`B/M`, na.rm = TRUE)
        )
      
      s_l <- data %>% filter(`year_offset` == ano) %>%
        filter(
          market_value <= median(market_value, na.rm = TRUE) &
            `B/M` <= median(`B/M`, na.rm = TRUE)
        )
    }
    return(
      list(
        year_offset = ano,
        trimestre = trimestre,
        data = list(B_H = B_H, B_l = B_l, s_H = s_H, s_l = s_l)
      )
    )
  }
}

#Mede o risco sem o índice de sharp, CONSERTE PARA GENERALIZAR PARA MARKOVITZ
risk <- function(returns, portifolio, index = 2018, TRI = FALSE, WEIGHTED = FALSE, MARKOVITZ = FALSE){
  
  if(TRI){
    retornos_largos <- returns  %>% ungroup() %>% 
      filter (`trimestre` == index) %>% select(date, ticker, return) %>%
      pivot_wider(names_from = ticker, values_from = return)
  }else {
    retornos_largos <- returns  %>% ungroup() %>% 
      filter (`Ano` == index) %>% select(date, ticker, return) %>%
      pivot_wider(names_from = ticker, values_from = return)
  }
  
  
  matriz_cov <- retornos_largos %>%  
    select(-date) %>% 
    cov(use = "pairwise.complete.obs")
  

  # matriz_corr <- retornos_largos %>%  
  #   select(-date) %>% 
  #   cor(use = "pairwise.complete.obs")
  ativos <- tibble(
    ticker = colnames(matriz_cov)
  ) %>% arrange(ticker)
  
  portifolio <- portifolio %>% arrange(ticker)
  if(WEIGHTED){
    ativos <- ativos %>% filter(ticker %in% portifolio$ticker) %>% 
      mutate(stock_weight = portifolio$market_value/sum(portifolio$market_value)) %>%
      mutate(stock_weight = as.numeric(stock_weight))
  }else if(MARKOVITZ) {
    
    ativos <- ativos %>% filter(ticker %in% portifolio$ticker) %>% 
      mutate(stock_weight =  as.double(portifolio$weight))
    
  }
  else {
    ativos <- ativos %>% filter(ticker %in% portifolio$ticker) %>% 
      mutate(stock_weight = 1 / nrow(portifolio))
    
  }

  volatility <- sqrt(t(ativos$stock_weight) %*% matriz_cov %*% ativos$stock_weight)*(length(unique(returns$date))**0.5)

  return(volatility)
}



daily_return <- function(data, portifolio, ano = 2018, INFO = FALSE, TRI = FALSE, trimestre = 1, START_YEAR = 2017) {
  tmp <- tibble()
  data <- data %>% mutate(Ano = year(date), mes = month(date)) %>% 
    mutate(date = ymd(date)) %>% filter(ticker %in% portifolio$ticker)
    if(TRI) {
      if(INFO){
        tmp <- data %>% mutate(
          trimestre = case_when(
            mes %in% c(6, 7, 8) ~ 1,
            mes %in% c(9, 10, 11) ~ 2,
            mes %in% c(12, 1, 2, 3, 4, 5) ~ 3,
          )
        ) %>% filter((mes >= 6 & Ano == ano) | (mes < 6 & Ano == ano+1)) %>%
          filter(`trimestre` == !!trimestre & (`Ano` == !!ano | `Ano` == !!ano+1)) %>% 
          group_by(ticker) %>% mutate(
            return = ((`adjusted price`-lag(`adjusted price`))/lag(`adjusted price`)), Ano_fiscal = !!ano
          )
      }else {
        tmp <- data %>% mutate(
          trimestre = case_when(
            mes %in% c(1, 2, 3) ~ 1,
            mes %in% c(4, 5, 6) ~ 2,
            mes %in% c(7, 8, 9) ~ 3,
            mes %in% c(10, 11, 12) ~ 4,
          )
        ) %>% filter(`trimestre` == !!trimestre & `Ano` == !!ano) %>%
          group_by(ticker) %>% mutate(
            return = ((`adjusted price`-lag(`adjusted price`))/lag(`adjusted price`)), Ano_fiscal = !!ano
          )
      }
    }else {
      if(INFO){
        
        tmp <- data %>%
          filter(
            (mes >= 4 & Ano == ano) | (mes <= 3 & Ano == (ano+1))
          ) %>% 
          group_by(ticker) %>% mutate(Ano_fiscal = case_when(
            mes %in% c(4:12) ~ Ano,
            mes %in% c(1:3) & Ano != START_YEAR ~ (Ano-1)
          )) %>% filter(!is.na(Ano_fiscal)) %>%
          mutate(
            return = ((`adjusted price`-lag(`adjusted price`))/lag(`adjusted price`))
          ) %>% ungroup() %>% group_by(ticker, Ano)
        
      }else {
        tmp <- data %>% group_by(ticker, Ano) %>%
          mutate(return = ((`adjusted price`-lag(`adjusted price`))/lag(`adjusted price`)), Ano_fiscal = Ano)
      }
    }
    
  return(tmp)
}

anual_return <- function(data, info = FALSE, ano = 2018) {
  if(info == TRUE){
    tmp <- tibble()
    
    for(i in ano:2024){
     ano_fiscal <- data %>%
        filter((month(date) >= 4 & Ano == i) | (month(date) <= 3 & Ano == i+1)) %>% 
        group_by(ticker) %>%
        summarise(
          retorno =  prod(1 + return, na.rm = TRUE) - 1
        ) %>% mutate(Ano = i)
     
      tmp <- bind_rows(tmp, ano_fiscal)
    }
  }else {
    tmp <- data %>%
      group_by(Ano, ticker) %>% 
      summarise( 
        retorno =  prod(1 + return, na.rm = TRUE) - 1
      )
  }
  return(tmp)
}


daily_anual_return <- function(data, info = FALSE, ano = 2018) {
  if(info == TRUE){
    tmp <- tibble()
    

      ano_fiscal <- data %>%
        filter((month(date) >= 4 & Ano == !!ano) | (Ano > !!ano)) %>% 
        mutate(across(everything(), ~tidyr::replace_na(.x, 0))) %>%
        group_by(ticker) %>%
        reframe(
          date = date,
          accumulated_daily_return =  cumprod(1 + return) - 1
        ) %>% mutate(Ano = i)
      
      tmp <- bind_rows(tmp, ano_fiscal)
  }else {
    tmp <- data %>%
      group_by(ticker) %>% 
      filter(Ano > 2017) %>%
      mutate(across(everything(), ~tidyr::replace_na(.x, 0))) %>%
      reframe( 
        date = date,
        accumulated_daily_return =  cumprod(1 + return) - 1
      )
  }
  return(tmp)
}

portfolio_daily_return <- function(data) {
  tmp <- data %>% group_by(date) %>% summarise(m_return = mean(return))
}

#Calcula o índice de sharp
sharp_ratio_risk <- function(data, free_risk_asset, market_value = NULL, WEIGHTED = FALSE, MARKOVITZ = FALSE){
  
  if(MARKOVITZ == TRUE){
    mean_return <- data$return
    std_dev_return <- data$risk
  }else if(WEIGHTED == TRUE){
    mean_return <- data$retorno
    std_dev_return <- data$volatility
  }
  else {
    std_dev_return <- sd(data)
    mean_return <- mean(data)
  }
  
  
  sharp_ratio <- (mean_return - free_risk_asset) / std_dev_return
  return(sharp_ratio)
}

portifolio_anual_return <- function(data, portifolio, prices, year, free_risk_asset) {
  stocks <- data %>% filter(Ano == year) %>%
    filter(ticker %in% portifolio$ticker) %>% arrange(ticker)
  portifolio <- portifolio %>% arrange(ticker)
  
  
  free_risk_asset <- free_risk_asset %>% filter(Ano == year) %>% na.omit()
  
  tmp <- stocks %>% reframe(
    retorno = mean(retorno),
    retorno_excedente = mean(retorno)-(prod(unlist(free_risk_asset$retorno) + 1) - 1),
    retorno_ativo_livre_risco = prod(unlist(free_risk_asset$retorno) + 1) - 1,
    volatility = risk(prices, portifolio, year)
  ) %>%  mutate(retorno = format(retorno, scientific = FALSE)) %>%
    mutate(
      retorno = as.numeric(retorno),
      Ano = year,
      )
  
  sharp_ratio <- sharp_ratio_risk(stocks$retorno, free_risk_asset$retorno)
  tmp <- tmp %>% mutate(sharp_ratio = sharp_ratio)

  return(tmp)
}


portifolio_trimestral_return <- function(portifolio, prices, trimestre, free_risk_asset) {
  stocks_returns <- prices %>%
    group_by(ticker, trimestre) %>% 
    reframe(
      #Ano = Ano,
      retorno =  prod(1 + return, na.rm = TRUE) - 1
    )
 
 
  print(free_risk_asset)
  tmp <- stocks_returns %>% group_by(trimestre) %>%
    reframe(
      #Ano = Ano,
      retorno = mean(retorno),
      retorno_excedente = mean(retorno) - free_risk_asset$retorno,
      volatility = risk(prices, portifolio, trimestre, TRUE),
      retorno_ativo_livre_risco = free_risk_asset$retorno
  )
  
  sharp_ratio <- sharp_ratio_risk(stocks_returns$retorno, free_risk_asset$retorno)
  
  tmp <- tmp %>% mutate(sharp_ratio = sharp_ratio)
  return(tmp)
}

portifolio_anual_return_weighted <- function(data, portifolio, prices, year, free_risk_asset) {
  stocks <- data %>% filter(`Ano` == year) %>%
    filter(ticker %in% portifolio$ticker) %>% arrange(ticker)
  portifolio <- portifolio %>% arrange(ticker)
  
  free_risk_asset <- free_risk_asset %>% filter(Ano == year) %>% na.omit()
  
  
  tmp <- stocks %>% summarise(
      retorno = weighted.mean(retorno, portifolio$market_value),
      retorno_excedente = weighted.mean(retorno)-(prod(unlist(free_risk_asset$retorno) + 1) - 1),
      retorno_ativo_livre_risco = prod(unlist(free_risk_asset$retorno) + 1) - 1,
      volatility = risk(prices, portifolio, year, FALSE, TRUE),
      .groups = "drop"
    ) %>%  mutate(retorno = format(retorno, scientific = FALSE)) %>%
    mutate(
      retorno = as.numeric(retorno),
      Ano = year
      ) 
  
  sharp_ratio <- sharp_ratio_risk(stocks$retorno, free_risk_asset$retorno, portifolio$market_value, TRUE)
  tmp <- tmp %>% mutate(sharp_ratio = sharp_ratio)
  
  return(tmp)
}

portifolio_trimestral_return_weighted <- function(portifolio, prices, trimestre, free_risk_asset) {
  stocks_returns <- prices %>%
    group_by(ticker, trimestre) %>% 
    reframe(
      retorno =  prod(1 + return, na.rm = TRUE) - 1
    ) %>% ungroup()
  
  
  #print(stocks_returns)
  
  tmp <- stocks_returns %>% group_by(trimestre) %>%
    reframe(
      retorno = weighted.mean(retorno, portifolio$market_value),
      retorno_excedente = weighted.mean(retorno) - free_risk_asset$retorno,
      retorno_ativo_livre_risco = free_risk_asset$retorno,
      volatility = risk(prices, portifolio, trimestre, TRUE, TRUE),
    )
  
  
  sharp_ratio <- sharp_ratio_risk(stocks_returns$retorno, free_risk_asset$retorno, portifolio$market_value, TRUE)
  return(tmp)
  
}

final_calc_accumulated_daily_returns <- function (data) {
  data <- data %>% ungroup() %>% mutate(
    daily_return = ifelse(is.nan(daily_return), 0, daily_return),
    accumulated_daily_return = cumprod(1+daily_return)-1
  )
  return(data)
}


portifolio_anual_return_new <- function(data, portifolio, prices, year, IBOV, SELIC, WEIGHTED = FALSE) {
  portifolio <- portifolio %>% arrange(ticker)
  stocks <- data %>% filter(Ano_fiscal == year)
  
  IBOV <- IBOV %>% filter(Ano == year) %>% na.omit()
  SELIC <- SELIC %>% filter(fiscal_year == year) %>% na.omit()
  
  tmp <- stocks %>% reframe(
    retorno = prod(1 + daily_return)-1,
    retorno_excedente = mean(retorno)-(prod(unlist(IBOV$retorno) + 1) - 1),
    retorno_ativo_livre_risco = prod(unlist(IBOV$retorno) + 1) - 1,
    volatility = risk(!!prices, portifolio, year, FALSE, WEIGHTED)
  ) %>%  mutate(retorno = format(retorno, scientific = FALSE)) %>%
    mutate(
      retorno = as.numeric(retorno),
      Ano = year,
    )
  
  sharp_ratio <- sharp_ratio_risk(tmp, SELIC$return, NULL, TRUE, FALSE)
  tmp <- tmp %>% mutate(sharp_ratio = sharp_ratio)
  
  return(tmp)
}

portifolio_tri_return_new <- function(data, portifolio, prices, year = 2018, trimestre = 1, free_risk_asset, WEIGHTED = FALSE) {
  portifolio <- portifolio %>% arrange(ticker)
  stocks <- data %>% filter(Ano_fiscal == year & `trimestre` == !!trimestre)
  
  free_risk_asset <- free_risk_asset %>% filter(Ano == year & `trimestre` == !!trimestre) %>% na.omit()
  
  tmp <- stocks %>% group_by(Ano_fiscal, trimestre) %>% reframe(
    retorno = prod(1 + daily_return)-1,
    retorno_excedente = mean(retorno)-(prod(unlist(free_risk_asset$retorno) + 1) - 1),
    retorno_ativo_livre_risco = prod(unlist(free_risk_asset$retorno) + 1) - 1,
    volatility = risk(prices, portifolio, trimestre, TRUE, WEIGHTED)
  ) %>%  mutate(retorno = format(retorno, scientific = FALSE)) %>%
    mutate(
      retorno = as.numeric(retorno),
      Ano = year,
      trimestre = trimestre
    )
  
  return(tmp)
}

portifolio_daily_return_general <- function (data, stock_prices, ano = 2018, WEIGHTED = FALSE, TRI = FALSE, trimestre = 1) {
  stocks <- data %>% select(ticker, year, year_offset, market_value)
  
  if(TRI) {
    stock_prices <- stock_prices %>% filter ((`Ano_fiscal` == ano & `trimestre` == !!trimestre) & ticker %in% stocks$ticker)
  }else {
    stock_prices <- stock_prices %>% filter (`Ano_fiscal` == ano & ticker %in% stocks$ticker)
  }
  
  prices <- stock_prices
  if(WEIGHTED) {
    print('entrou')
    returns <- stock_prices %>% left_join(stocks, by = 'ticker') %>%
      mutate(
        return = as.numeric(return),
      )
    
    
    tmp <- returns %>% group_by(date) %>%
      reframe(
        Ano_fiscal = ano,
        daily_return = weighted.mean(return, market_value, na.rm = TRUE),
      ) %>% mutate(daily_return = ifelse(is.nan(daily_return), 0, daily_return),  trimestre = !!trimestre)
    
    
  } else {
    returns <- stock_prices %>% left_join(stocks, by = 'ticker') %>%
      mutate(
        return = as.numeric(return)
      )
    
    tmp <- returns %>% group_by(date) %>%
      reframe(
        Ano_fiscal = ano,
        daily_return = mean(return, na.rm = TRUE),
      ) %>% mutate(daily_return = ifelse(is.nan(daily_return), 0, daily_return),  trimestre = !!trimestre)
  }
  
  
  return(tmp)
}


# Remover apenas as funções
#rm()