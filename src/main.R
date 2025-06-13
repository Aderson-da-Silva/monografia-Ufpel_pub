source("src/headers/header.R")
source("src/headers/markovitz_header.R")
source("src/headers/models.R")




#source("src/plot_data.R")
tidyverse_conflicts(only = NULL)

compiled_data <- market_value %>% arrange(`Ações`)
ptr_liquid <- ptr_liquid %>% select(sort(names(ptr_liquid)))
stock_quant <- stock_quant %>% select(sort(names(stock_quant)))

tmp <- tranform_data(ptr_liquid)
compiled_data <- compiled_data %>% mutate(`Ptr Liq` = tmp)

tmp <- tranform_data(stock_quant)
compiled_data <- compiled_data %>% mutate(`Qtde Stocks` = tmp)
compiled_data <- compiled_data %>% filter(!str_detect(`Ações`, "ALOS3")) #Retirada porque o yahoo finance enfrenta erros ao importar esses dados
compiled_data <- compiled_data %>% filter(!str_detect(`Ações`, "NTCO3"))
compiled_data <- compiled_data %>% filter(!str_detect(`Ações`, "SIMH3"))
#compiled_data <- compiled_data %>% filter(!str_detect(`Ações`, "BPAC11")) #Retirado, pois não entregou seus balanços consolidados nos anos de 2020 e 2021, posterioremente será tratado para que somente nesses anos ele não seja inclsuso na análise.
compiled_data <- compiled_data %>% filter(!str_detect(`Ações`, "CIEL3")) #Deixou de ser negociada na B3 em agosto
#compiled_data <- compiled_data %>% filter(!str_detect(`Ações`, "STBP3")) #Removida temporariamento pelo fato do yahoo finance estar com inconsistências no sistema

compiled_data <- compiled_data %>% 
  mutate(`Ações` = ifelse(`Ações` == "ARZZ3", "AZZA3", `Ações`)) # Mudou o nome e eu tive que mexer para usar o nome certo

compiled_data <- compiled_data %>% mutate(
  `B/M ratio` = round(`Ptr Liq`/`Valor de Mercado`, 4)
)

rm(tmp, stock_quant, ptr_liquid, market_value, arr)
 

tickers <- c()
d_interval_tickers <- as.array(compiled_data %>% pull(Ano) %>% min())
d_interval_tickers <- append(d_interval_tickers, compiled_data %>% pull(Ano) %>% max())

d_interval_tickers[1] <- paste0(d_interval_tickers[1], "-01-01")
d_interval_tickers[2] <- paste0('2024', "-12-31")
d_interval_tickers <- as.POSIXct(d_interval_tickers, tz = "UTC")

simplified_data <- compiled_data %>% distinct(`Ações`, .keep_all = TRUE)
all_tickers <- c()
all_tickers <- append(simplified_data$Ações, c("QUAL3", "TOTS3", "VIVT3", "LREN3", "UGPA3", "RAPT3", "KLBN11", "TIMS3",
                 "POSI3", "GMAT3", "LWSA3", "PETZ3", "CYRE3", "MULT3", "SCAR3", "CARD3",
                 "BRSR3", "POMO4", "TASA4", "WIZC3", "CASH3", "SOMA3", "BIDI11", "BRML3",
                 "MDNE3", "PORT3", "TUPY3", "RSUL4", "AZUL4", "GOLL4", "ISAE4", "CSUD3", "ALPA4", "BBDC4", "MULT3"))

all_tickers <- unique(all_tickers)
for(ticker in all_tickers){
  tickers <- append(tickers, paste(ticker, "SA", sep = "."))
} 



i = 0

stock_prices <- tq_get(tickers[1], from = d_interval_tickers[1], to = d_interval_tickers[2])
stock_prices_markovitz <- tq_get(tickers[1], from = d_interval_tickers[1] %m-% years(5), to = d_interval_tickers[2])
for(ticker in tickers){
  
  if(ticker != "ABEV3.SA"){
      stock_prices <- rbind(stock_prices, tq_get(ticker, from = d_interval_tickers[1], to = d_interval_tickers[2]))
     stock_prices_markovitz <- rbind(stock_prices_markovitz, tq_get(ticker, from = d_interval_tickers[1] %m-% years(5), to = d_interval_tickers[2]))
  }
  
  i = i+1
  print(paste(i, ticker, sep = "-"))
}

stock_prices <- stock_prices %>% select(symbol, date, adjusted) %>%
  rename(`ticker` = symbol) %>% rename(`adjusted price` = adjusted)


stock_prices_markovitz <- stock_prices_markovitz %>%  select(symbol, date, adjusted) %>% 
  rename(`ticker` = symbol) %>% rename(`adjusted price` = adjusted)
#stock_prices <- stock_prices %>% filter(!str_detect(ticker, "SIMH3.SA") & !str_detect(ticker, "NTCO3.SA"))




#-------------------------- Manipulação de DFP ------------------------------------------


# tickers[64] <- "ISAE4.SA" # Mudou o nome e eu tive que mexer para usar o nome certo só que o yahoo finance ainda usa o antigo (29/11/2024)
#Uma solução melhor para esse ticker será buscada no futuro

info_empresas <- get_info_companies() %>% filter(SIT_REG == "ATIVO") %>% filter(TP_MERC == "BOLSA")

company_listed <- read_csv("docs/acoes-listadas-b3.csv", show_col_types = FALSE)

stocks <- company_listed %>% filter(Ticker %in% gsub(".SA$", "", tickers))

map_tickers <- info_empresas %>% filter(CNPJ %in% stocks$CNPJ) %>%
  mutate(ticker = stocks$Ticker[match(CNPJ, stocks$CNPJ)])

dfp_values <- process_files(dfp_dir, map_tickers)
fre_values <- process_files(fre_dir, map_tickers)

B_M_anual_info <-  book_to_market_index(dfp_values, fre_values, FALSE, TRUE)
B_M_anual  <-  book_to_market_index(dfp_values, fre_values, FALSE, FALSE)


#----------- Parte onde inicia o cálculo dos portifólios e de seus retornos/riscos ------------

#rm(itr_values, dfp_values, fre_values)


#-----------  Início dos cálculos -----------------------------------------------------------------
#Formando grupos
for(i in 2018:2024){
  groups_anual <- c(groups_anual, list(form_groups(B_M_anual, i)))
  groups_anual_info <- c(groups_anual_info, list(form_groups(B_M_anual_info, i)))
  
  w_groups_anual <- c(w_groups_anual, list(form_groups(B_M_anual, i, 1, FALSE, TRUE)))
  w_groups_anual_info <- c(w_groups_anual_info, list(form_groups(B_M_anual_info, i,  1, FALSE, TRUE)))
}






#-----------  Sem ponderação e sem balanceamento --------------------------------------------------


#Calculo do retorno anual e trimestral do IBovespa com e sem aspecto informacional
start_date <- as.Date("2017-01-01")
end_date <- as.Date("2024-12-31")

# Obtendo os dados do Ibovespa
getSymbols("^BVSP", src = "yahoo", from = start_date, to = end_date, auto.assign = TRUE)
selic <- gbcbd_get_series(id = 1178, first.date = start_date, last.date = end_date)

ibov <- Cl(BVSP) 
ibov <- as_tibble(ibov, rownames = "date")

ibov_returns <- ibov %>% 
  mutate(Ano = year(as.Date(date))) %>% group_by(Ano) %>%
  mutate(return = ((`BVSP.Close`-lag(`BVSP.Close`))/lag(`BVSP.Close`))) %>%
  mutate(date = as.Date(date)) %>%
  select(date, return, Ano) %>% mutate(ticker = "IBOV")



selic <- selic %>% mutate(year = year(`ref.date`))
selic_return_annual <- selic %>% 
  group_by(fiscal_year =year(`ref.date`)) %>%
  reframe(
    return = median(value)/100
  )

selic_return_annual_info <- selic %>% mutate(fiscal_year = case_when(
  month(`ref.date`) >= 4 ~ year(`ref.date`),
  month(`ref.date`) < 4 ~ year(`ref.date`)-1
)) %>% filter(!is.na(fiscal_year)) %>%  
  group_by(fiscal_year) %>%
  reframe(
    return = median(value)/100
  )

selic_return_annual_info_acc <- selic_return_annual_info %>% 
  filter(fiscal_year > 2017) %>% 
  mutate(
    accumulated_daily_return = cumprod(1+return)-1,
    daily_return = (1 + return)^(1/238) - 1
  )

selic_return_annual_acc <- selic_return_annual %>% 
  filter(fiscal_year > 2017) %>% 
  mutate(
    accumulated_daily_return = cumprod(1+return)-1,
    daily_return = (1 + return)^(1/238) - 1
  )


ibov_returns_anual <- anual_return(ibov_returns, selic_data = selic_return_annual)
ibov_returns_anual_info <- anual_return(ibov_returns, selic_data = selic_return_annual_info, 
                                        info = TRUE, 
                                        ano = 2018)

daily_ibov_returns_anual <- daily_anual_return(ibov_returns) 
daily_ibov_returns_anual_info <- daily_anual_return(ibov_returns, TRUE)

#-----------  Usando ponderação por valor de mercado ----------------------------------------------------




source("src/calc_algs/market_value_weighted_calc.R")




#----------   Fim dos cálculos com ponderação -----------------------------------------------------------------------------------



#------------------------------------ Começando os cálculos de markovitz ---------------------------------------------------------------------------

source("src/calc_algs/markovitz_calc.R")

source("src/calc_algs/only_markovitz_calc.R")



#-------------------------------------- Calculando retorno acumulado de todas as carteiras ------------------------------------------------------
source("src/calc_algs/final_calc.R")

selic_return_annual_info_acc <- daily_B_H_return_markovitz_yearly_bal_info$daily_returns %>%
  select(Ano_fiscal, date) %>% 
  left_join(selic_return_annual_info_acc, join_by("Ano_fiscal" == "fiscal_year")) %>%
  select(-return) %>% 
  mutate(
    accumulated_daily_return = cumprod(1+daily_return)-1
  )


selic_return_annual_acc <-  daily_B_H_return_markovitz_yearly_bal$daily_returns  %>%
  select(Ano_fiscal, date) %>% 
  left_join(selic_return_annual_acc, join_by("Ano_fiscal" == "fiscal_year")) %>%
  select(-return) %>% 
  mutate(
    accumulated_daily_return = cumprod(1+daily_return)-1
  )


# Combinar os dados em formato longo
dados_combinados_retorno <- bind_rows(
  daily_B_H_return_weighted_yearly_bal_info$daily_returns %>% mutate(portifolio = "B_H"),
  daily_B_l_return_weighted_yearly_bal_info$daily_returns %>% mutate(portifolio = "B_l"),
  daily_s_H_return_weighted_yearly_bal_info$daily_returns %>% mutate(portifolio = "s_H"),
  daily_s_l_return_weighted_yearly_bal_info$daily_returns %>% mutate(portifolio = "s_l"),
  daily_ibov_returns_anual_info %>% mutate(portifolio = "IBOV"),
  selic_return_annual_info_acc %>% mutate(portifolio = "SELIC"),
  
)

# Plotar todas as séries
ggplot(dados_combinados_retorno, aes(x = date, y = accumulated_daily_return, color = portifolio)) +
  geom_line(size = 0.8) +
  scale_color_manual(
    values = c("B_H" = "#1f77b4",SELIC = "#F564A9", "s_l" = "#ff7f0e", "B_l" = "#2ca02c", "s_H" = "#d62728", "IBOV" = "#3d2c7e"),
  ) +
  labs(
    title = "Comparação de Retornos Acumulados Diários",
    x = "Data",
    y = "Retorno Acumulado",
    color = "Portfólio"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")

dados_combinados_risco <- bind_rows(
  "B_H" = mean(daily_B_H_return_weighted_yearly_bal_info$annual_returns$volatility/daily_B_H_return_weighted_yearly_bal_info$annual_returns$retorno),
  "B_l" = mean(daily_B_l_return_weighted_yearly_bal_info$annual_returns$volatility/daily_B_l_return_weighted_yearly_bal_info$annual_returns$retorno),
  "s_H" = mean(daily_s_H_return_weighted_yearly_bal_info$annual_returns$volatility/daily_s_H_return_weighted_yearly_bal_info$annual_returns$retorno),
  "s_l" = mean(daily_s_l_return_weighted_yearly_bal_info$annual_returns$volatility/daily_s_l_return_weighted_yearly_bal_info$annual_returns$retorno),
  "B_H_markovitz" = mean(daily_B_H_return_markovitz_yearly_bal_info$annual_return$risk/daily_B_H_return_markovitz_yearly_bal_info$annual_return$return),
  "B_l_markovitz" = mean(daily_B_l_return_markovitz_yearly_bal_info$annual_return$risk/daily_B_l_return_markovitz_yearly_bal_info$annual_return$return),
  "s_H_markovitz" = mean(daily_s_H_return_markovitz_yearly_bal_info$annual_return$risk/daily_s_H_return_markovitz_yearly_bal_info$annual_return$return),
  "s_l_markovitz" = mean(daily_s_l_return_markovitz_yearly_bal_info$annual_return$risk/daily_s_l_return_markovitz_yearly_bal_info$annual_return$return),
  "Markovitz-sem-grupo" = mean(daily_w_groups_return_markovitz_yearly_bal_info$annual_return$risk/daily_w_groups_return_markovitz_yearly_bal_info$annual_return$return)
) %>% pivot_longer(cols = everything(), 
                  names_to = "Carteira", 
                  values_to = "Risco_Retorno") %>% 
  arrange(Risco_Retorno)




ggplot(dados_combinados_risco, aes(x = Carteira, y = Risco_Retorno)) +
  geom_bar(stat = "identity", fill = "#78c2e6") +
  theme_minimal() +
  labs(
    title = "Diferença de Risco entre Cada Carteira",
    y = "Risco (Volatilidade Anualizada)",
    x = "Carteira"
  ) +
  theme(
    panel.grid.major = element_line(color = "#f0f0f0"),
    panel.grid.minor = element_line(color = "#f0f0f0"),
    axis.text.x = element_text(angle = 45, hjust = 1)
  ) +
  scale_y_continuous(limits = c(0, max(dados_combinados_risco$Risco_Retorno) * 1.1))

selic_return_annual_info_acc <- daily_B_H_return_markovitz_yearly_bal_info$daily_returns %>%
  select(Ano_fiscal, date) %>% 
  left_join(selic_return_annual_info_acc, join_by("Ano_fiscal" == "fiscal_year")) %>%
  select(-return) %>% 
  mutate(
    accumulated_daily_return = cumprod(1+daily_return)-1
  )

# Combinar os dados em formato longo
dados_combinados <- dplyr::bind_rows(
  daily_B_H_return_markovitz_yearly_bal_info$daily_returns %>% mutate(portifolio = "B_H"),
  daily_s_l_return_markovitz_yearly_bal_info$daily_returns %>% mutate(portifolio = "s_l"),
  daily_B_l_return_markovitz_yearly_bal_info$daily_returns %>% mutate(portifolio = "B_l"),
  daily_s_H_return_markovitz_yearly_bal_info$daily_returns %>% mutate(portifolio = "s_H"),
  daily_w_groups_return_markovitz_yearly_bal_info$daily_returns %>% mutate(portifolio = "Markovitz-sem-grupo"),
  daily_ibov_returns_anual_info %>% mutate(portifolio = "IBOV"),
  selic_return_annual_info_acc %>% mutate(portifolio = "SELIC")
)

# Combinar os dados em formato longo
dados_combinados <- dplyr::bind_rows(
  daily_B_H_return_markovitz_yearly_bal$daily_returns %>% mutate(portifolio = "B_H"),
  daily_s_l_return_markovitz_yearly_bal$daily_returns %>% mutate(portifolio = "s_l"),
  daily_B_l_return_markovitz_yearly_bal$daily_returns %>% mutate(portifolio = "B_l"),
  daily_s_H_return_markovitz_yearly_bal$daily_returns %>% mutate(portifolio = "s_H"),
  daily_w_groups_return_markovitz_yearly_bal$daily_returns %>% mutate(portifolio = "Markovitz-sem-grupo"),
  daily_ibov_returns_anual %>% mutate(portifolio = "IBOV"),
  selic_return_annual_info_acc %>% mutate(portifolio = "SELIC")
)
  

# Plotar todas as séries
ggplot(dados_combinados, aes(x = date, y = accumulated_daily_return, color = portifolio)) +
  geom_line(size = 0.8) +
  scale_color_manual(
    values = c("B_H" = "#1f77b4", "SELIC" = "#F564A9", "s_l" = "#ff7f0e", "B_l" = "#2ca02c", "s_H" = "#d62728", "IBOV" = "#3d2c7e"),
  ) +
  labs(
    title = "Comparação de Retornos Acumulados Diários",
    x = "Data",
    y = "Retorno Acumulado",
    color = "Portfólio"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")


# Plotar todas as séries
ggplot(dados_combinados, aes(x = date, y = accumulated_daily_return, color = portifolio)) +
  geom_line(size = 0.8) +
  scale_color_manual(
    values = c("B_H" = "#1f77b4", "s_l" = "#ff7f0e", "B_l" = "#2ca02c", "s_H" = "#d62728", "Markovitz-sem-grupo" = "#7c4014", "IBOV" = "#3d2c7e")
    
  ) +
  labs(
    title = "Comparação de Retornos Acumulados Diários",
    x = "Data",
    y = "Retorno Acumulado",
    color = "Portfólio"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")

# Plotar a fronteira eficiente
ggplot(daily_s_H_return_markovitz_yearly_bal_info$daily_returns , aes(x = date, y = accumulated_daily_return)) +
  geom_line(color = "blue") +
  labs(
    title = "Retornos acumulados diários",
    x = "Datas",
    y = "Retorno acumulado"
  ) +
  theme_minimal()


# Plotar a fronteira eficiente
ggplot(daily_s_l_return_markovitz_yearly_bal_info$daily_returns  , aes(x = date, y = accumulated_daily_return)) +
  geom_line(color = "blue") +
  labs(
    title = "Retornos acumulados diários",
    x = "Datas",
    y = "Retorno acumulado"
  ) +
  theme_minimal()

# Plotar a fronteira eficiente
ggplot(daily_w_groups_return_markovitz_quarterly_bal$daily_returns  , aes(x = date, y = retorno_acumulado)) +
  geom_line(color = "blue") +
  labs(
    title = "Retornos acumulados diários",
    x = "Datas",
    y = "Retorno acumulado"
  ) +
  theme_minimal()

# Plotar a fronteira eficiente
ggplot(daily_s_H_return_markovitz_yearly_bal_info$daily_returns, aes(x = date, y = accumulated_daily_return)) +
  geom_line(color = "blue") +
  labs(
    title = "Retornos acumulados diários",
    x = "Datas",
    y = "Retorno acumulado"
  ) +
  theme_minimal()

# Plotar a fronteira eficiente
ggplot(daily_s_H_return_markovitz_tri_bal_info$daily_returns, aes(x = date, y = accumulated_daily_return)) +
  geom_line(color = "blue") +
  labs(
    title = "Retornos acumulados diários",
    x = "Datas",
    y = "Retorno acumulado"
  ) +
  theme_minimal()


# Plotar a fronteira eficiente
ggplot(daily_w_groups_return_markovitz_yearly_bal_info$daily_returns, aes(x = date, y = accumulated_daily_return)) +
  geom_line(color = "blue") +
  labs(
    title = "Retornos acumulados diários",
    x = "Datas",
    y = "Retorno acumulado"
  ) +
  theme_minimal()



# plots <- plot_graphs(data_list, media_list)
# print(plots[[1]])
# print(plots[[2]])
# print(plots[[3]])
# print(plots[[7]])
#convert_returnos()
#convert_all_data()