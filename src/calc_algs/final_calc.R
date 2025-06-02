

all_returns_weighted <- daily_B_H_return_weighted$annual_returns %>%
  full_join(daily_B_l_return_weighted$annual_returns) %>%
  full_join(daily_s_H_return_weighted$annual_returns) %>%
  full_join(daily_s_l_return_weighted$annual_returns) %>%
  group_by(Ano) %>%
  reframe(
    media_retorno = mean(retorno_excedente),
    media_sharpe_ratio = mean(sharp_ratio))

all_returns_weighted_info <- daily_B_H_return_weighted_info$annual_returns %>%
  full_join(daily_B_l_return_weighted_info$annual_returns) %>%
  full_join(daily_s_H_return_weighted_info$annual_returns) %>%
  full_join(daily_s_l_return_weighted_info$annual_returns) %>%
  group_by(Ano) %>%
  reframe(
    media_retorno = mean(retorno_excedente),
    media_sharpe_ratio = mean(sharp_ratio))

diferenca_media_anual <- tibble(
  Ano = all_returns_weighted$Ano,
  `fama&french_info_retorno` = all_returns_weighted_info$media_retorno - all_returns_weighted$media_retorno,
  `fama&french_info_sharpe` = all_returns_weighted_info$media_sharpe_ratio - all_returns_weighted$media_sharpe_ratio,
  
  `fama&french_info_bal_retorno` = all_returns_yearly_bal_weighted_info$media_retorno - all_returns_yearly_bal_weighted$media_retorno,
  `fama&french_info_bal_sharpe` = all_returns_yearly_bal_weighted_info$media_sharpe_ratio - all_returns_yearly_bal_weighted$media_sharpe_ratio,
  
  `markovitz_info_retorno` = all_returns_markovitz_info$media_retorno - all_returns_markovitz$media_retorno,
  `markovitz_info_sharpe` = all_returns_markovitz_info$media_sharpe_ratio - all_returns_markovitz$media_sharpe_ratio,
  
  `markovitz_info_bal_retorno` = all_returns_markovitz_yearly_bal_info$media_retorno - all_returns_markovitz_yearly_bal$media_retorno,
  `markovitz_info_bal_sharpe` = all_returns_markovitz_yearly_bal_info$media_sharpe_ratio - all_returns_markovitz_yearly_bal$media_sharpe_ratio,
  
  `fama&french_bal_vs_n_bal_retorno` = (all_returns_weighted_info$media_retorno + all_returns_weighted$media_retorno) - (all_returns_yearly_bal_weighted_info$media_retorno + all_returns_yearly_bal_weighted$media_retorno),
  `fama&french_bal_vs_n_bal_sharpe` = (all_returns_weighted_info$media_sharpe_ratio + all_returns_weighted$media_sharpe_ratio) - (all_returns_yearly_bal_weighted_info$media_sharpe_ratio + all_returns_yearly_bal_weighted$media_sharpe_ratio),
  
  `markovitz_bal_vs_n_bal_retorno` = (all_returns_markovitz_info$media_retorno + all_returns_markovitz$media_retorno) - (all_returns_markovitz_yearly_bal_info$media_retorno + all_returns_markovitz_yearly_bal$media_retorno),
  `markovitz_bal_vs_n_bal_sharpe` = (all_returns_markovitz_info$media_sharpe_ratio + all_returns_markovitz$media_sharpe_ratio) - (all_returns_markovitz_yearly_bal_info$media_sharpe_ratio + all_returns_markovitz_yearly_bal$media_sharpe_ratio),
  
  `markovitz_vs_fama&french_retorno` =  
    (all_returns_markovitz_info$media_retorno + all_returns_markovitz$media_retorno) 
  - (all_returns_weighted_info$media_retorno + all_returns_weighted$media_retorno),
  
  `markovitz_vs_fama&french_sharpe` =
    (all_returns_markovitz_info$media_sharpe_ratio + all_returns_markovitz$media_sharpe_ratio) 
  - (all_returns_weighted_info$media_sharpe_ratio + all_returns_weighted$media_sharpe_ratio),
  
  
  `markovitz_vs_fama&french_bal_retorno` = 
    (all_returns_markovitz_yearly_bal_info$media_retorno + all_returns_markovitz_yearly_bal$media_retorno) 
  - (all_returns_yearly_bal_weighted_info$media_retorno + all_returns_yearly_bal_weighted$media_retorno),
  
  `markovitz_vs_fama&french_bal_sharpe` = 
    (all_returns_markovitz_yearly_bal_info$media_sharpe_ratio + all_returns_markovitz_yearly_bal$media_sharpe_ratio)
  - (all_returns_yearly_bal_weighted_info$media_sharpe_ratio + all_returns_yearly_bal_weighted$media_sharpe_ratio),
)

all_returns_yearly_bal_weighted <- daily_B_H_return_weighted_yearly_bal$annual_returns %>%
  full_join(daily_B_l_return_weighted_yearly_bal$annual_returns) %>%
  full_join(daily_s_H_return_weighted_yearly_bal$annual_returns) %>%
  full_join(daily_s_l_return_weighted_yearly_bal$annual_returns) %>%
  group_by(Ano) %>%
  reframe(
    media_retorno = mean(retorno_excedente),
    media_sharpe_ratio = mean(sharp_ratio))

all_returns_yearly_bal_weighted_info <- daily_B_H_return_weighted_yearly_bal_info$annual_returns %>%
  full_join(daily_B_l_return_weighted_yearly_bal_info$annual_returns) %>%
  full_join(daily_s_H_return_weighted_yearly_bal_info$annual_returns) %>%
  full_join(daily_s_l_return_weighted_yearly_bal_info$annual_returns) %>%
  group_by(Ano) %>%
  reframe(
    media_retorno = mean(retorno_excedente),
    media_sharpe_ratio = mean(sharp_ratio))

all_returns_markovitz <- daily_B_H_return_markovitz$annual_returns %>%
  full_join(daily_B_l_return_markovitz$annual_returns) %>%
  full_join(daily_s_H_return_markovitz$annual_returns) %>%
  full_join(daily_s_l_return_markovitz$annual_returns) %>%
  group_by(Ano) %>%
  reframe(
    media_retorno = mean(retorno_excedente),
    media_sharpe_ratio = mean(sharp_ratio))

all_returns_markovitz_info <- daily_B_H_return_markovitz_info$annual_returns %>%
  full_join(daily_B_l_return_markovitz_info$annual_returns) %>%
  full_join(daily_s_H_return_markovitz_info$annual_returns) %>%
  full_join(daily_s_l_return_markovitz_info$annual_returns) %>%
  group_by(Ano) %>%
  reframe(
    media_retorno = mean(retorno_excedente),
    media_sharpe_ratio = mean(sharp_ratio))

all_returns_markovitz_yearly_bal <- daily_B_H_return_markovitz_yearly_bal$annual_returns %>%
  full_join(daily_B_l_return_markovitz_yearly_bal$annual_returns) %>%
  full_join(daily_s_H_return_markovitz_yearly_bal$annual_returns) %>%
  full_join(daily_s_l_return_markovitz_yearly_bal$annual_returns) %>%
  group_by(Ano) %>%
  reframe(
    media_retorno = mean(retorno_excedente),
    media_sharpe_ratio = mean(sharp_ratio))

all_returns_markovitz_yearly_bal_info <- daily_B_H_return_markovitz_yearly_bal_info$annual_returns %>%
  full_join(daily_B_l_return_markovitz_yearly_bal_info$annual_returns) %>%
  full_join(daily_s_H_return_markovitz_yearly_bal_info$annual_returns) %>%
  full_join(daily_s_l_return_markovitz_yearly_bal_info$annual_returns) %>%
  group_by(Ano) %>%
  reframe(
    media_retorno = mean(retorno_excedente),
    media_sharpe_ratio = mean(sharp_ratio))


#----------------------------------------------------  PONDERADO PELO VALOR DE MERCADO ---------------------------------------------------------------------------------------
  
  
  

  
  daily_B_H_return_weighted$daily_returns <- final_calc_accumulated_daily_returns(daily_B_H_return_weighted$daily_returns)
  daily_B_l_return_weighted$daily_returns <- final_calc_accumulated_daily_returns(daily_B_l_return_weighted$daily_returns)
  daily_s_H_return_weighted$daily_returns <- final_calc_accumulated_daily_returns(daily_s_H_return_weighted$daily_returns)
  daily_s_l_return_weighted$daily_returns <- final_calc_accumulated_daily_returns(daily_s_l_return_weighted$daily_returns)
  daily_B_H_return_weighted_info$daily_returns <- final_calc_accumulated_daily_returns(daily_B_H_return_weighted_info$daily_returns)
  daily_B_l_return_weighted_info$daily_returns <- final_calc_accumulated_daily_returns(daily_B_l_return_weighted_info$daily_returns)
  daily_s_H_return_weighted_info$daily_returns <- final_calc_accumulated_daily_returns(daily_s_H_return_weighted_info$daily_returns)
  daily_s_l_return_weighted_info$daily_returns <- final_calc_accumulated_daily_returns(daily_s_l_return_weighted_info$daily_returns)
  
  daily_B_H_return_weighted$annual_returns <- daily_B_H_return_weighted$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+retorno )-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_ativo_livre_risco)-1, retorno = retorno ) 
  daily_B_l_return_weighted$annual_returns <- daily_B_l_return_weighted$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+retorno )-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_ativo_livre_risco)-1, retorno = retorno ) 
  daily_s_H_return_weighted$annual_returns <- daily_s_H_return_weighted$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+retorno )-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_ativo_livre_risco)-1, retorno = retorno ) 
  daily_s_l_return_weighted$annual_returns <- daily_s_l_return_weighted$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+retorno )-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_ativo_livre_risco)-1, retorno = retorno ) 
  daily_B_H_return_weighted_info$annual_returns <- daily_B_H_return_weighted_info$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+retorno )-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_ativo_livre_risco)-1, retorno = retorno ) 
  daily_B_l_return_weighted_info$annual_returns <- daily_B_l_return_weighted_info$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+retorno )-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_ativo_livre_risco)-1, retorno = retorno ) 
  daily_s_H_return_weighted_info$annual_returns <- daily_s_H_return_weighted_info$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+retorno )-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_ativo_livre_risco)-1, retorno = retorno ) 
  daily_s_l_return_weighted_info$annual_returns <- daily_s_l_return_weighted_info$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+retorno )-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_ativo_livre_risco)-1, retorno = retorno ) 
  
  
  daily_B_H_return_weighted_yearly_bal$daily_returns <- final_calc_accumulated_daily_returns(daily_B_H_return_weighted_yearly_bal$daily_returns)
  daily_B_l_return_weighted_yearly_bal$daily_returns <- final_calc_accumulated_daily_returns(daily_B_l_return_weighted_yearly_bal$daily_returns)
  daily_s_H_return_weighted_yearly_bal$daily_returns <- final_calc_accumulated_daily_returns(daily_s_H_return_weighted_yearly_bal$daily_returns)
  daily_s_l_return_weighted_yearly_bal$daily_returns <- final_calc_accumulated_daily_returns(daily_s_l_return_weighted_yearly_bal$daily_returns)
  daily_B_H_return_weighted_yearly_bal_info$daily_returns <- final_calc_accumulated_daily_returns(daily_B_H_return_weighted_yearly_bal_info$daily_returns)
  daily_B_l_return_weighted_yearly_bal_info$daily_returns <- final_calc_accumulated_daily_returns(daily_B_l_return_weighted_yearly_bal_info$daily_returns)
  daily_s_H_return_weighted_yearly_bal_info$daily_returns <- final_calc_accumulated_daily_returns(daily_s_H_return_weighted_yearly_bal_info$daily_returns)
  daily_s_l_return_weighted_yearly_bal_info$daily_returns <-final_calc_accumulated_daily_returns(daily_s_l_return_weighted_yearly_bal_info$daily_returns)
  
  daily_B_H_return_weighted_yearly_bal$annual_returns <- daily_B_H_return_weighted_yearly_bal$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+retorno )-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_ativo_livre_risco)-1, retorno = retorno ) 
  daily_B_l_return_weighted_yearly_bal$annual_returns <- daily_B_l_return_weighted_yearly_bal$annual_returns%>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+retorno )-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_ativo_livre_risco)-1, retorno = retorno ) 
  daily_s_H_return_weighted_yearly_bal$annual_returns <- daily_s_H_return_weighted_yearly_bal$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+retorno )-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_ativo_livre_risco)-1, retorno = retorno ) 
  daily_s_l_return_weighted_yearly_bal$annual_returns <- daily_s_l_return_weighted_yearly_bal$annual_returns%>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+retorno )-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_ativo_livre_risco)-1, retorno = retorno ) 
  daily_B_H_return_weighted_yearly_bal_info$annual_returns <- daily_B_H_return_weighted_yearly_bal_info$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+retorno )-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_ativo_livre_risco)-1, retorno = retorno ) 
  daily_B_l_return_weighted_yearly_bal_info$annual_returns <- daily_B_l_return_weighted_yearly_bal_info$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+retorno )-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_ativo_livre_risco)-1, retorno = retorno ) 
  daily_s_H_return_weighted_yearly_bal_info$annual_returns <- daily_s_H_return_weighted_yearly_bal_info$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+retorno )-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_ativo_livre_risco)-1, retorno = retorno ) 
  daily_s_l_return_weighted_yearly_bal_info$annual_returns <-daily_s_l_return_weighted_yearly_bal_info$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+retorno )-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_ativo_livre_risco)-1, retorno = retorno ) 
  
  #----------------------------------------------------  MARKOVITZ ---------------------------------------------------------------------------------------
  
  
  
  daily_B_H_return_markovitz$daily_returns <-  final_calc_accumulated_daily_returns(daily_B_H_return_markovitz$daily_returns)
  daily_B_l_return_markovitz$daily_returns <-  final_calc_accumulated_daily_returns(daily_B_l_return_markovitz$daily_returns) 
  daily_s_H_return_markovitz$daily_returns <-  final_calc_accumulated_daily_returns(daily_s_H_return_markovitz$daily_returns)
  daily_s_l_return_markovitz$daily_returns <-  final_calc_accumulated_daily_returns(daily_s_l_return_markovitz$daily_returns)
  
  daily_B_H_return_markovitz_info$daily_returns <-  final_calc_accumulated_daily_returns(daily_B_H_return_markovitz_info$daily_returns)
  daily_B_l_return_markovitz_info$daily_returns <-  final_calc_accumulated_daily_returns(daily_B_l_return_markovitz_info$daily_returns)
  daily_s_H_return_markovitz_info$daily_returns <-  final_calc_accumulated_daily_returns(daily_s_H_return_markovitz_info$daily_returns)
  daily_s_l_return_markovitz_info$daily_returns <-  final_calc_accumulated_daily_returns(daily_s_l_return_markovitz_info$daily_returns)
  
  
  daily_B_H_return_markovitz$annual_returns <- daily_B_H_return_markovitz$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado  = cumprod(1+retorno_IBOV)-1, retorno = return)
  daily_B_l_return_markovitz$annual_returns <- daily_B_l_return_markovitz$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado  = cumprod(1+retorno_IBOV)-1, retorno = return)
  daily_s_H_return_markovitz$annual_returns <- daily_s_H_return_markovitz$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado  = cumprod(1+retorno_IBOV)-1, retorno = return)
  daily_s_l_return_markovitz$annual_returns <- daily_s_l_return_markovitz$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado  = cumprod(1+retorno_IBOV)-1, retorno = return) 
  
  
  daily_B_H_return_markovitz_info$annual_returns <- daily_B_H_return_markovitz_info$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_IBOV)-1, retorno = return)
  daily_B_l_return_markovitz_info$annual_returns <- daily_B_l_return_markovitz_info$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_IBOV)-1, retorno = return)
  daily_s_H_return_markovitz_info$annual_returns <- daily_s_H_return_markovitz_info$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_IBOV)-1, retorno = return)
  daily_s_l_return_markovitz_info$annual_returns <- daily_s_l_return_markovitz_info$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_IBOV)-1, retorno = return)
  
  

  
  daily_B_H_return_markovitz_yearly_bal$daily_returns <-  final_calc_accumulated_daily_returns(daily_B_H_return_markovitz_yearly_bal$daily_returns)
  daily_B_l_return_markovitz_yearly_bal$daily_returns <-  final_calc_accumulated_daily_returns(daily_B_l_return_markovitz_yearly_bal$daily_returns) 
  daily_s_H_return_markovitz_yearly_bal$daily_returns <-  final_calc_accumulated_daily_returns(daily_s_H_return_markovitz_yearly_bal$daily_returns)
  daily_s_l_return_markovitz_yearly_bal$daily_returns <-  final_calc_accumulated_daily_returns(daily_s_l_return_markovitz_yearly_bal$daily_returns)
  
  daily_B_H_return_markovitz_yearly_bal_info$daily_returns <-  final_calc_accumulated_daily_returns(daily_B_H_return_markovitz_yearly_bal_info$daily_returns)
  daily_B_l_return_markovitz_yearly_bal_info$daily_returns <-  final_calc_accumulated_daily_returns(daily_B_l_return_markovitz_yearly_bal_info$daily_returns)
  daily_s_H_return_markovitz_yearly_bal_info$daily_returns <-  final_calc_accumulated_daily_returns(daily_s_H_return_markovitz_yearly_bal_info$daily_returns)
  daily_s_l_return_markovitz_yearly_bal_info$daily_returns <-  final_calc_accumulated_daily_returns(daily_s_l_return_markovitz_yearly_bal_info$daily_returns)
  
  
  daily_B_H_return_markovitz_yearly_bal$annual_returns <- daily_B_H_return_markovitz_yearly_bal$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_IBOV)-1, retorno = return)
  daily_B_l_return_markovitz_yearly_bal$annual_returns <- daily_B_l_return_markovitz_yearly_bal$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_IBOV)-1, retorno = return)
  daily_s_H_return_markovitz_yearly_bal$annual_returns <- daily_s_H_return_markovitz_yearly_bal$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_IBOV)-1, retorno = return)
  daily_s_l_return_markovitz_yearly_bal$annual_returns <- daily_s_l_return_markovitz_yearly_bal$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_IBOV)-1, retorno = return) 
  
  
  daily_B_H_return_markovitz_yearly_bal_info$annual_returns <- daily_B_H_return_markovitz_yearly_bal_info$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_IBOV)-1, retorno = return)
  daily_B_l_return_markovitz_yearly_bal_info$annual_returns <- daily_B_l_return_markovitz_yearly_bal_info$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_IBOV)-1, retorno = return)
  daily_s_H_return_markovitz_yearly_bal_info$annual_returns <- daily_s_H_return_markovitz_yearly_bal_info$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_IBOV)-1, retorno = return)
  daily_s_l_return_markovitz_yearly_bal_info$annual_returns <- daily_s_l_return_markovitz_yearly_bal_info$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_IBOV)-1, retorno = return)
  
  #---------------------------------------------------- MARKOVITZ COM TODAS AS EMPRESAS ----------------------------------------------------------------------------------------------------------
  
  
  # w_groups_return_markovitz <- w_groups_return_markovitz %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_ativo_livre_risco)-1, retorno = return) 
  # w_groups_return_markovitz_info <- w_groups_return_markovitz_info %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_ativo_livre_risco)-1, retorno = return) 
  #   
  daily_w_groups_return_markovitz$annual_returns <- daily_w_groups_return_markovitz$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_IBOV)-1, retorno = return)
  daily_w_groups_return_markovitz_info$annual_returns <-  daily_w_groups_return_markovitz_info$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_IBOV)-1, retorno = return)
  daily_w_groups_return_markovitz$daily_returns <- final_calc_accumulated_daily_returns(daily_w_groups_return_markovitz$daily_returns)
  daily_w_groups_return_markovitz_info$daily_returns <- final_calc_accumulated_daily_returns(daily_w_groups_return_markovitz_info$daily_returns)
  
  # 
  # w_groups_return_markovitz_yearly_bal <- w_groups_return_markovitz_yearly_bal %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_ativo_livre_risco)-1, retorno = return) 
  # w_groups_return_markovitz_yearly_bal_info <- w_groups_return_markovitz_yearly_bal_info %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_ativo_livre_risco)-1, retorno = return) 
  # 
  daily_w_groups_return_markovitz_yearly_bal$daily_returns <- final_calc_accumulated_daily_returns(daily_w_groups_return_markovitz_yearly_bal$daily_returns)
  daily_w_groups_return_markovitz_yearly_bal_info$daily_returns <- final_calc_accumulated_daily_returns(daily_w_groups_return_markovitz_yearly_bal_info$daily_returns)
  
  daily_w_groups_return_markovitz_yearly_bal$annual_returns <- daily_w_groups_return_markovitz_yearly_bal$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_IBOV)-1, retorno = return)
  daily_w_groups_return_markovitz_yearly_bal_info$annual_returns <- daily_w_groups_return_markovitz_yearly_bal_info$annual_returns %>% arrange(Ano) %>% mutate(retorno_acumulado = cumprod(1+return)-1, retorno_ativo_livre_risco_acumulado = cumprod(1+retorno_IBOV)-1, retorno = return)
    
    
 