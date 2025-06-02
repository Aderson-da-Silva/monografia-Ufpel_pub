
# teste <- daily_return_markovitz(stock_prices_markovitz, groups_tri[[1]]$data$B_H, 2018, TRUE, TRUE, 3, 2013)
# teste <- daily_return_markovitz(stock_prices_markovitz, groups_anual[[1]]$data$B_H, 2018, TRUE, FALSE, 1, 2013)

daily_return_markovitz <- function(data, portifolio, ano = 2018, INFO = FALSE, TRI = FALSE, trimestre = 1, START_YEAR = 2013) {
  
  tmp <- tibble()
  data <- data %>% mutate(Ano = year(date), mes = month(date)) %>% 
    mutate(date = ymd(date)) %>% filter(ticker %in% portifolio$ticker)
  
  
  if(TRI) {
    if(INFO) {
      tmp <- data %>% mutate(
        trimestre = case_when(
          mes %in% c(6, 7, 8) ~ 1,
          mes %in% c(9, 10, 11) ~ 2,
          mes %in% c(12) ~ 3,
          mes %in% c(1, 2, 3, 4, 5) & Ano != START_YEAR  ~ 3, #NÚMERO MÁGICO TOMAR CUIDADO
        ),
        Ano_fiscal = case_when(
          mes %in% c(6, 7, 8) ~ Ano,
          mes %in% c(9, 10, 11) ~ Ano,
          mes %in% c(12) ~ Ano,
          mes %in% c(1, 2, 3, 4, 5) & Ano != START_YEAR  ~ (Ano-1)
        )
      ) %>% filter(!is.na(trimestre))
      
      #Nesse caso o trimestre excede o tamanho do ano logo eu tenho que levar em consideração
      
      tmp <- tmp %>% filter(
        (`trimestre` <= !!trimestre & `Ano_fiscal` == !!ano) | (`Ano_fiscal` < !!ano) 
      )
      
      
       tmp <- tmp %>% 
        group_by(ticker, trimestre, Ano_fiscal) %>% mutate(
          return = ((`adjusted price`-lag(`adjusted price`))/lag(`adjusted price`))
        )
       
    } else {
      tmp <- data %>% mutate(
        trimestre = case_when(
          mes %in% c(1, 2, 3) ~ 1,
          mes %in% c(4, 5, 6) ~ 2,
          mes %in% c(7, 8, 9) ~ 3,
          mes %in% c(10, 11, 12) ~ 4,
        ),
        Ano_fiscal = Ano
      )  %>% filter(
        (`trimestre` <= !!trimestre & `Ano` == !!ano) | (`Ano` < !!ano)
        ) %>%
        group_by(ticker, trimestre, Ano) %>% mutate(
          return = ((`adjusted price`-lag(`adjusted price`))/lag(`adjusted price`))
        )
    }
  }else {
    if(INFO) {
      tmp <- data %>%
        mutate(Ano_fiscal = case_when(
          mes %in% c(4:12) ~ Ano,
          mes %in% c(1:3) & Ano != START_YEAR ~ (Ano-1)
        )) %>% filter(!is.na(Ano_fiscal)) %>%
        group_by(ticker, Ano_fiscal) %>% mutate(
          return = ((`adjusted price`-lag(`adjusted price`))/lag(`adjusted price`))
        )
    }else {
      tmp <- data %>% group_by(ticker, Ano) %>%
        mutate(
          return = ((`adjusted price`-lag(`adjusted price`))/lag(`adjusted price`)),
          Ano_fiscal = Ano
          )
    }
  }
  
  return(tmp)
}

pre_calc_efficient_frontier <- function(stock_prices, portifolio, ano, TRI = FALSE, trimestre = 1) {
  
  if(TRI) {
    stocks <- stock_prices %>% filter(
      (Ano_fiscal <= !!ano | (Ano_fiscal == !!ano & trimestre < !!trimestre)) & ticker %in% portifolio$ticker
    )
    
    stocks_returns <- stocks %>%
      filter(!is.na(return)) %>%
      group_by(ticker, Ano_fiscal, trimestre) %>%
      summarise(
        calc_return = prod(1 + return) - 1,
        sd_return = sd(return)
      ) %>% ungroup()
    
  } else {
    stocks <- stock_prices %>% filter(
      Ano <= !!ano & ticker %in% portifolio$ticker
    )
    
    stocks_returns <- stocks %>%
      filter(!is.na(return)) %>%
      group_by(ticker, Ano) %>%
      summarise(
        calc_return = prod(1 + return) - 1,
        sd_return = sd(return)
      ) %>% ungroup()
  }
  
  
  retornos_largos <- stocks %>% ungroup() %>% select(date, ticker, return) %>%
    pivot_wider(names_from = ticker, values_from = return) 
  
  retornos_largos <- retornos_largos %>% mutate(across(-date, ~ .x * 100)) %>%
    na.omit()
  
  returns_matrix <- as.matrix(retornos_largos[, -1])
  matriz_cov <- cov.shrink(returns_matrix, lambda = 0.35, verbose = FALSE)
  
  stocks_returns <- stocks_returns %>% group_by(ticker) %>%
    reframe(
      return = median(calc_return),
      sd_return = median(sd_return)
    ) %>% mutate(Ano = !!ano, trimestre = !!trimestre)
  
  # matriz_cov <- matriz_cov[-1, -1]
  return(list(stocks_returns, matriz_cov))
}

# Função para calcular a fronteira eficiente
efficient_frontier <- function(cov_matrix, stocks_returns, tickers_f, num_assets, num_portfolios = 100) {
  # Preparar os resultados
  results <- tibble(
    risk = numeric(),
    return = numeric(),
    weights = list()
  )
  #min_allocation <- 0.01 # Mínimo de 1%
  #max_allocation <- 0.50 # Máximo de 20%
  
  print(all(eigen(cov_matrix)$values > 0)) #Se der TRUE a matriz é positiva e definida se der FALSE quer dizer que não o que significa que ela precisa de correção
  if(!all(eigen(cov_matrix)$values > 0)) {
    eigen_decomp <- eigen(cov_matrix)
    eigen_values <- pmax(eigen_decomp$values, 1e-6) # Substitui valores negativos por 1e-6
    cov_matrix <- eigen_decomp$vectors %*% diag(eigen_values) %*% t(eigen_decomp$vectors)
    print(paste("Ajustando a matriz para ficar positiva definida", all(eigen(cov_matrix)$values > 0),sep =  ": "))
  }
 
  
  target_returns <- seq(min(stocks_returns$return), max(stocks_returns$return), length.out = num_portfolios)
  
  Dmat <- cov_matrix
  dvec <- rep(0, num_assets)
  Amat <- cbind(
    rep(1, num_assets),
    stocks_returns$return,
    diag(num_assets)
    )
  
  
  # Amat <- t(Amat)
  # Otimização para diferentes níveis de retorno esperado
  for (target_return in target_returns) {
    # Criar a matriz para otimização
    adjusted_target_return <- ifelse(
      target_return < 0,
      target_return + 0.01, # Relaxa para cima se for negativo
      target_return - 0.01  # Relaxa para baixo se for positivo
    )
    
    bvec <- c(
      1,  
      adjusted_target_return,
      rep(0, num_assets) # Pesos >= min_allocation
      ) #Relaxando o limitador do target_return para 1% abaixo do teto
    scale_factor <- max(abs(c(Dmat, Amat, bvec)))
   
    
    solution <- solve.QP(
      Dmat = Dmat / scale_factor,
      dvec = dvec / scale_factor,
      Amat = Amat / scale_factor,
      bvec = bvec / scale_factor,
      meq = 1
    )
    
    weights <-  pmax(solution$solution, 0)
    weights[weights < 0.01] = 0
    weights <- weights / sum(weights)
    port_risk <- sqrt(t(weights) %*% cov_matrix %*% weights)
    
    # Calcular o retorno esperado do portfólio
    weights_tibble <- tibble(
      ticker = tickers_f,
      weight = weights
    )
    
    merged_data <- left_join(weights_tibble, stocks_returns, by = "ticker") # Combinar pesos e retornos esperados
    port_return <- sum(merged_data$weight * merged_data$return)  
    
    weights_tibble <- weights_tibble %>%
      mutate(weight = format(weight, scientific = FALSE))   
    
    results <- results %>%
      add_row(
        risk = port_risk,
        return = port_return,
        weights = list(tibble(weights_tibble))
      )
  }
  
  return(results)
}

portifolio_annual_return_markovitz <- function (data, stock_prices, prices, ano = 2018, free_risk_asset) {
  stocks <- data$weights[[1]]
  risk <- data$risk
  
  return <- stock_prices %>% filter (`Ano` == ano & ticker %in% stocks$ticker) 
  prices <- prices %>% filter(`Ano` == ano & ticker %in% stocks$ticker)
  
  tmp <- stocks %>% summarise(
    return = weighted.mean(return$retorno, as.double(weight)),
    retorno_excedente = return-(prod(unlist(free_risk_asset$retorno) + 1) - 1),
    retorno_ativo_livre_risco = prod(unlist(free_risk_asset$retorno) + 1) - 1,
    risk = risk(prices, stocks, ano, FALSE, FALSE, TRUE),
    
    .groups = "drop"
  ) %>%  mutate(return = format(return, scientific = FALSE)) %>%
    mutate(
      return = as.numeric(return),
      Ano = ano
    ) 
  
  sharp_ratio <- sharp_ratio_risk(tmp, free_risk_asset$retorno, NULL, FALSE, TRUE)
  tmp <- tmp %>% mutate(sharp_ratio = sharp_ratio) %>% mutate(re = data$return)
  
  return(tmp)
}

optimize <- function (data) {
  
  data <- data %>% mutate(simplified_sharp_ratio = return / risk) %>%
    mutate(non_zero_weights = map_int(weights, ~{
      weights_numeric <- as.numeric(.x$weight)
      sum(weights_numeric > 0)
    })) 
  if(max(data$non_zero_weights) < 20) {
    if(length(data$weights[[1]]$weight) > 30) {
      minStocks = round(0.8*max(data$non_zero_weights))
    }else {
      minStocks = round(0.5*max(data$non_zero_weights))
    }
    
  } else {
    minStocks = 20
  }
  res <- data %>%
      filter(non_zero_weights >= minStocks) %>%
      filter(simplified_sharp_ratio == max(simplified_sharp_ratio))
  
  return(first(res))
}

#---------------------------------- Calculo diário de markovitz (NOVO MÉTODO - POSSIVELMENTE MAIS EFICIENTE) -------------------------------





portifolio_annual_return_markovitz_new <- function (data, stock_prices, prices, ano = 2018, IBOV, SELIC) {
  stocks <- data$weights[[1]]
  risk <- data$risk
  
  return <- stock_prices %>% filter (`Ano_fiscal` == ano) 
  prices <- prices %>% filter(`Ano_fiscal` == ano & ticker %in% stocks$ticker)
  
  
  tmp <- return %>% group_by(Ano_fiscal) %>% summarise(
    return = prod(1 + daily_return)-1,
    retorno_excedente = return-(prod(unlist(IBOV$retorno) + 1) - 1),
    retorno_IBOV = prod(unlist(IBOV$retorno) + 1) - 1,
    risk = risk(prices, stocks, ano, FALSE, FALSE, TRUE),
    
    .groups = "drop"
  ) %>%  mutate(return = format(return, scientific = FALSE)) %>%
    mutate(
      return = as.numeric(return),
      Ano = ano
    )
  
  sharp_ratio <- sharp_ratio_risk(tmp, SELIC$return, NULL, FALSE, TRUE)
  tmp <- tmp %>% mutate(sharp_ratio = sharp_ratio) %>% mutate(re = data$return)
  
  return(tmp)
}

portifolio_daily_return_markovitz <- function (data, stock_prices, ano = 2018, TRI = FALSE, trimestre = 1) {
  stocks <- data$weights[[1]]
  risk <- data$risk
  
  if(TRI) {
    stock_prices <- stock_prices %>% filter ((`Ano_fiscal` == ano & `trimestre` == !!trimestre) & ticker %in% stocks$ticker)
  } else {
    stock_prices <- stock_prices %>% filter (`Ano_fiscal` == ano & ticker %in% stocks$ticker)
  }
  
  prices <- stock_prices
  returns <- stock_prices %>% left_join(stocks, by = 'ticker') %>%
    mutate(
      return = as.numeric(return),
      weight = as.numeric(weight)
    )
  
  
  tmp <- returns %>% group_by(date) %>%
    reframe(
      Ano_fiscal = ano,
      daily_return = weighted.mean(return, weight, na.rm = TRUE),
    ) %>% mutate(daily_return = ifelse(is.nan(daily_return), 0, daily_return), trimestre = !!trimestre)
  
  return(tmp)
}