



#----------- Inicialização das variáveis ------------------------------------------------------

#Varíaveis relacionadas a parte inicial do projeto
market_value <- as_tibble(read_excel("docs/Fama French utilizável.xlsx", range = "Valor de Mercado Cias!A4:D78"))
ptr_liquid <- as_tibble(read_excel("docs/Fama French utilizável.xlsx", range = "Patrimônio Líquido!B4:BX9"))
stock_quant <- as_tibble(read_excel("docs/Fama French utilizável.xlsx", range = "Qtde Ações!B4:BX9"))

ptr_liquid <- resolve_name(ptr_liquid)
stock_quant <- resolve_name(stock_quant)

arr = c("F4:I78", "K4:N78", "P4:S78", "U4:X78")

for(i in arr){
  market_value <- bind_rows(
    market_value ,read_excel("docs/Fama French utilizável.xlsx", range = paste("Valor de Mercado Cias", i, sep = "!"))
  )
}


#Variáveis relacionadas ao DFP
itr_dir <- "dfp_data_cache_ITR"
dfp_dir <- "dfp_data_cache_DFP"
fre_dir <- "fre_data_cache"


#Variáveis relacionadas aos grupos de empresas
groups_anual <- groups_anual_info <- groups_tri <- groups_tri_info <- w_groups_anual <- w_groups_anual_info <- w_groups_tri <- w_groups_tri_info <- list()

stock_prices_B_H <- stock_prices_B_l <- stock_prices_s_H <- stock_prices_s_l <- tibble()
stock_prices_B_l_info <- stock_prices_s_l_info <- stock_prices_s_H_info <- stock_prices_B_H_info <- tibble()

#Variáveis relacionadas aos cálculos
stocks_anual_return <- stocks_anual_return_info <- tibble()
stock_prices_annual_return <- tibble()
stock_prices_annual_return_info <- tibble()

#Tibble padrão

pattern_yearly <- tibble(
  `Ano` = numeric(),
  `retorno` = numeric(),
  `retorno_acumulado` = numeric(),
  `volatility` = numeric()
)

daily_pattern <- list(
  daily_returns = tibble(),
  annual_returns = tibble()
)



#-----------  Fim da inicialização de variáveis ---------------------------------------------------  
