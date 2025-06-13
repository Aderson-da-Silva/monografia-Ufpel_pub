#Retorno acumulado de todas as B_H com ibovespa e com SELIC
# Combinar os dados em formato longo


dados_combinados_retorno_B_H <- bind_rows(
  daily_B_H_return_weighted$daily_returns %>% mutate(portifolio = "Fama&French sem balanceamento"),
  daily_B_H_return_weighted_yearly_bal$daily_returns %>% mutate(portifolio = "Fama&French com balanceamento"),
  
  
 daily_B_H_return_markovitz$daily_returns %>% mutate(portifolio = "Markowitz sem balanceamento"),
  daily_B_H_return_markovitz_yearly_bal$daily_returns %>% mutate(portifolio = "Markowitz com balanceamento"),
  
  daily_ibov_returns_anual %>% mutate(portifolio = "IBOV"),
  selic_return_annual_acc %>% mutate(portifolio = "SELIC")
)


dados_combinados_retorno_B_H_info <- bind_rows(
  daily_B_H_return_weighted_info$daily_returns %>% mutate(portifolio = "Fama&French sem balanceamento"),
  daily_B_H_return_weighted_yearly_bal_info$daily_returns %>% mutate(portifolio = "Fama&French com balanceamento"),
  
  daily_B_H_return_markovitz_info$daily_returns %>% mutate(portifolio = "Markowitz sem balanceamento"),
  daily_B_H_return_markovitz_yearly_bal_info$daily_returns %>% mutate(portifolio = "Markowitz com balanceamento"),
  
  
  daily_ibov_returns_anual_info %>% mutate(portifolio = "IBOV"),
  selic_return_annual_info_acc %>% mutate(portifolio = "SELIC"),
  
)



#Retorno acumulado de todas as B_l com ibovespa e com SELIC

dados_combinados_retorno_B_l <- bind_rows(
  daily_B_l_return_weighted$daily_returns %>% mutate(portifolio = "Fama&French Sem balanceamento"),
  daily_B_l_return_weighted_yearly_bal$daily_returns %>% mutate(portifolio = "Fama&French Com balanceamento"),
  
  
  daily_B_l_return_markovitz$daily_returns %>% mutate(portifolio = "Markowitz sem balanceamento"),
  daily_B_l_return_markovitz_yearly_bal$daily_returns %>% mutate(portifolio = "Markowitz com balanceamento"),
  
  daily_ibov_returns_anual %>% mutate(portifolio = "IBOV"),
  selic_return_annual_acc %>% mutate(portifolio = "SELIC")
)


dados_combinados_retorno_B_l_info <- bind_rows(
  daily_B_l_return_weighted_info$daily_returns %>% mutate(portifolio = "Fama&French sem balanceamento"),
  daily_B_l_return_weighted_yearly_bal_info$daily_returns %>% mutate(portifolio = "Fama&French com balanceamento"),
  
  daily_B_l_return_markovitz_info$daily_returns %>% mutate(portifolio = "Markowitz sem balanceamento"),
  daily_B_l_return_markovitz_yearly_bal_info$daily_returns %>% mutate(portifolio = "Markowitz com balanceamento"),
  
  
  daily_ibov_returns_anual_info %>% mutate(portifolio = "IBOV"),
  selic_return_annual_info_acc %>% mutate(portifolio = "SELIC"),
  
)

#Retorno acumulado de todas as s_H com ibovespa e com SELIC

dados_combinados_retorno_s_H <- bind_rows(
  daily_s_H_return_weighted$daily_returns %>% mutate(portifolio = "Fama&French Sem balanceamento"),
  daily_s_H_return_weighted_yearly_bal$daily_returns %>% mutate(portifolio = "Fama&French Com balanceamento"),
  
  
  daily_s_H_return_markovitz$daily_returns %>% mutate(portifolio = "Markowitz sem balanceamento"),
  daily_s_H_return_markovitz_yearly_bal$daily_returns %>% mutate(portifolio = "Markowitz com balanceamento"),
  
  daily_ibov_returns_anual %>% mutate(portifolio = "IBOV"),
  selic_return_annual_acc %>% mutate(portifolio = "SELIC")
)


dados_combinados_retorno_s_H_info <- bind_rows(
  daily_s_H_return_weighted_info$daily_returns %>% mutate(portifolio = "Fama&French sem balanceamento"),
  daily_s_H_return_weighted_yearly_bal_info$daily_returns %>% mutate(portifolio = "Fama&French com balanceamento"),
  
  daily_s_H_return_markovitz_info$daily_returns %>% mutate(portifolio = "Markowitz sem balanceamento"),
  daily_s_H_return_markovitz_yearly_bal_info$daily_returns %>% mutate(portifolio = "Markowitz com balanceamento"),
  
  
  daily_ibov_returns_anual_info %>% mutate(portifolio = "IBOV"),
  selic_return_annual_info_acc %>% mutate(portifolio = "SELIC"),
  
)


#Retorno acumulado de todas as s_l com ibovespa e com SELIC

dados_combinados_retorno_s_l <- bind_rows(
  daily_s_l_return_weighted$daily_returns %>% mutate(portifolio = "Fama&French Sem balanceamento"),
  daily_s_l_return_weighted_yearly_bal$daily_returns %>% mutate(portifolio = "Fama&French Com balanceamento"),
  
  
  daily_s_l_return_markovitz$daily_returns %>% mutate(portifolio = "Markowitz sem balanceamento"),
  daily_s_l_return_markovitz_yearly_bal$daily_returns %>% mutate(portifolio = "Markowitz com balanceamento"),
  
  daily_ibov_returns_anual %>% mutate(portifolio = "IBOV"),
  selic_return_annual_acc %>% mutate(portifolio = "SELIC")
)


dados_combinados_retorno_s_l_info <- bind_rows(
  daily_s_l_return_weighted_info$daily_returns %>% mutate(portifolio = "Fama&French sem balanceamento"),
  daily_s_l_return_weighted_yearly_bal_info$daily_returns %>% mutate(portifolio = "Fama&French com balanceamento"),
  
  daily_s_l_return_markovitz_info$daily_returns %>% mutate(portifolio = "Markowitz sem balanceamento"),
  daily_s_l_return_markovitz_yearly_bal_info$daily_returns %>% mutate(portifolio = "Markowitz com balanceamento"),
  
  
  daily_ibov_returns_anual_info %>% mutate(portifolio = "IBOV"),
  selic_return_annual_info_acc %>% mutate(portifolio = "SELIC"),
  
)

#Comparar markowitz sem grupos balanceado e não balanceado com ibovespa e com SELIC
dados_combinados_retorno_only_markowitz <- bind_rows(
  daily_w_groups_return_markovitz$daily_returns %>% mutate(portifolio = "Sem balanceamento e sem aspecto informacional"),
  daily_w_groups_return_markovitz_info$daily_returns %>% mutate(portifolio = "Sem balanceamento e com aspecto informacional"),
  daily_w_groups_return_markovitz_yearly_bal$daily_returns %>% mutate(portifolio = "Com balanceamento e sem aspecto informacional"),
  daily_w_groups_return_markovitz_yearly_bal_info$daily_returns %>% mutate(portifolio = "Com balanceamento e com aspecto informacional"),
  
  daily_ibov_returns_anual %>% mutate(portifolio = "IBOV"),
  selic_return_annual_acc %>% mutate(portifolio = "SELIC"),
  
)


# Função para extrair média do Sharpe ratio de uma carteira
extrair_sharpe_medio <- function(carteira_data, nome_portifolio, IBOV = FALSE) {
  if(IBOV) {
    sharpe_medio <- mean(carteira_data$sharpe_ratio, na.rm = TRUE)
  } else {
    if(is.null(carteira_data$annual_returns)) {
      return(NULL)
    }
    
    sharpe_medio <- mean(carteira_data$annual_returns$sharp_ratio, na.rm = TRUE)
  }
  
  
  return(tibble(
    portifolio = nome_portifolio,
    sharpe_medio = sharpe_medio
  ))
}

# Agregando carteiras COM aspecto informacional
carteiras_com_info <- bind_rows(
  extrair_sharpe_medio(daily_B_H_return_weighted_info, "Big High Fama&French sem balanceamento"),
  extrair_sharpe_medio(daily_B_H_return_weighted_yearly_bal_info, "Big High Fama&French com balanceamento"),
  extrair_sharpe_medio(daily_B_H_return_markovitz_info, "Big High Markowitz sem balanceamento"),
  extrair_sharpe_medio(daily_B_H_return_markovitz_yearly_bal_info, "Big High Markowitz com balanceamento"),
  
  extrair_sharpe_medio(daily_B_l_return_weighted_info, "Big Low Fama&French sem balanceamento"),
  extrair_sharpe_medio(daily_B_l_return_weighted_yearly_bal_info, "Big Low Fama&French com balanceamento"),
  extrair_sharpe_medio(daily_B_l_return_markovitz_info, "Big Low Markowitz sem balanceamento"),
  extrair_sharpe_medio(daily_B_l_return_markovitz_yearly_bal_info, "Big Low Markowitz com balanceamento"),
  
  extrair_sharpe_medio(daily_s_H_return_weighted_info, "Small High Fama&French sem balanceamento"),
  extrair_sharpe_medio(daily_s_H_return_weighted_yearly_bal_info, "Small High Fama&French com balanceamento"),
  extrair_sharpe_medio(daily_s_H_return_markovitz_info, "Small High Markowitz sem balanceamento"),
  extrair_sharpe_medio(daily_s_H_return_markovitz_yearly_bal_info, "Small High Markowitz com balanceamento"),
  
  extrair_sharpe_medio(daily_s_l_return_weighted_info, "Small Low Fama&French sem balanceamento"),
  extrair_sharpe_medio(daily_s_l_return_weighted_yearly_bal_info, "Small Low Fama&French com balanceamento"),
  extrair_sharpe_medio(daily_s_l_return_markovitz_info, "Small Low Markowitz sem balanceamento"),
  extrair_sharpe_medio(daily_s_l_return_markovitz_yearly_bal_info, "Small Low Markowitz com balanceamento"),
  
  extrair_sharpe_medio(daily_w_groups_return_markovitz_info, "Markowitz sem grupos"),
  extrair_sharpe_medio(daily_w_groups_return_markovitz_yearly_bal_info, "Markowitz sem grupos com balanceamento"),
  
  extrair_sharpe_medio(ibov_returns_anual_info, "IBOVESPA", TRUE)
) %>%
  filter(!is.na(sharpe_medio)) %>%
  mutate(categoria = "Com aspecto informacional")

# Agregando carteiras SEM aspecto informacional
carteiras_sem_info <- bind_rows(
  extrair_sharpe_medio(daily_B_H_return_weighted, "Big High Fama&French sem balanceamento"),
  extrair_sharpe_medio(daily_B_H_return_weighted_yearly_bal, "Big High Fama&French com balanceamento"),
  extrair_sharpe_medio(daily_B_H_return_markovitz, "Big High Markowitz sem balanceamento"),
  extrair_sharpe_medio(daily_B_H_return_markovitz_yearly_bal, "Big High Markowitz com balanceamento"),
  
  extrair_sharpe_medio(daily_B_l_return_weighted, "Big Low Fama&French sem balanceamento"),
  extrair_sharpe_medio(daily_B_l_return_weighted_yearly_bal, "Big Low Fama&French com balanceamento"),
  extrair_sharpe_medio(daily_B_l_return_markovitz, "Big Low Markowitz sem balanceamento"),
  extrair_sharpe_medio(daily_B_l_return_markovitz_yearly_bal, "Big Low Markowitz com balanceamento"),
  
  extrair_sharpe_medio(daily_s_H_return_weighted, "Small High Fama&French sem balanceamento"),
  extrair_sharpe_medio(daily_s_H_return_weighted_yearly_bal, "Small High Fama&French com balanceamento"),
  extrair_sharpe_medio(daily_s_H_return_markovitz, "Small High Markowitz sem balanceamento"),
  extrair_sharpe_medio(daily_s_H_return_markovitz_yearly_bal, "s_H Markowitz com balanceamento"),
  
  extrair_sharpe_medio(daily_s_l_return_weighted, "Small Low Fama&French sem balanceamento"),
  extrair_sharpe_medio(daily_s_l_return_weighted_yearly_bal, "Small Low Fama&French com balanceamento"),
  extrair_sharpe_medio(daily_s_l_return_markovitz, "Small Low Markowitz sem balanceamento"),
  extrair_sharpe_medio(daily_s_l_return_markovitz_yearly_bal, "Small Low Markowitz com balanceamento"),
  
  extrair_sharpe_medio(daily_w_groups_return_markovitz, "Markowitz sem grupos"),
  extrair_sharpe_medio(daily_w_groups_return_markovitz_yearly_bal, "Markowitz sem grupos com balanceamento"),
  
  extrair_sharpe_medio(ibov_returns_anual, "IBOVESPA", TRUE)
) %>%
  filter(!is.na(sharpe_medio)) %>%
  mutate(categoria = "Sem aspecto informacional")





