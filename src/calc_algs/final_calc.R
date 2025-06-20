

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
  `info_retorno` = (all_returns_weighted_info$media_retorno + all_returns_yearly_bal_weighted_info$media_retorno) - (all_returns_weighted$media_retorno),
  `info_sharpe` = all_returns_weighted_info$media_sharpe_ratio - all_returns_weighted$media_sharpe_ratio,
  
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


w_groups_all_returns_markovitz <- daily_w_groups_return_markovitz_info$annual_returns %>%
  full_join(daily_w_groups_return_markovitz$annual_returns) %>%
  full_join(daily_w_groups_return_markovitz_yearly_bal_info$annual_returns) %>%
  full_join(daily_w_groups_return_markovitz_yearly_bal$annual_returns) %>%
  group_by(Ano) %>%
  reframe(
    media_retorno = mean(retorno_excedente),
    media_sharpe_ratio = mean(sharp_ratio)
  )
  
all_not_w_groups_markovitz <- all_returns_markovitz %>%
  full_join(all_returns_markovitz_info) %>%
  full_join(all_returns_markovitz_yearly_bal) %>%
  full_join(all_returns_markovitz_yearly_bal_info) %>%
  group_by(Ano) %>%
  reframe(
    media_retorno = mean(media_retorno),
    media_sharpe_ratio = mean(media_sharpe_ratio)
  )

all_returns_markovitz_difference <- tibble(
  Ano = daily_w_groups_return_markovitz_info$annual_returns$Ano,
  info = daily_w_groups_return_markovitz_info$annual_returns$retorno_excedente - daily_w_groups_return_markovitz$annual_returns$retorno_excedente,
  info_sharpe = daily_w_groups_return_markovitz_info$annual_returns$sharp_ratio - daily_w_groups_return_markovitz$annual_returns$sharp_ratio,
  
  info_bal = daily_w_groups_return_markovitz_yearly_bal_info$annual_returns$retorno_excedente - daily_w_groups_return_markovitz_yearly_bal$annual_returns$retorno_excedente,
  info_bal_sharpe = daily_w_groups_return_markovitz_yearly_bal_info$annual_returns$sharp_ratio - daily_w_groups_return_markovitz_yearly_bal$annual_returns$sharp_ratio,
  
  balanced = (daily_w_groups_return_markovitz_yearly_bal_info$annual_returns$retorno_excedente + daily_w_groups_return_markovitz_yearly_bal$annual_returns$retorno_excedente) 
    - (daily_w_groups_return_markovitz_info$annual_returns$retorno_excedente + daily_w_groups_return_markovitz$annual_returns$retorno_excedente),
  
  balanced_sharpe = (daily_w_groups_return_markovitz_yearly_bal_info$annual_returns$sharp_ratio + daily_w_groups_return_markovitz_yearly_bal$annual_returns$sharp_ratio) 
  - (daily_w_groups_return_markovitz_info$annual_returns$sharp_ratio + daily_w_groups_return_markovitz$annual_returns$sharp_ratio),
    

  w_groups_vs_groups_returns = w_groups_all_returns_markovitz$media_retorno - all_not_w_groups_markovitz$media_retorno,
  w_groups_vs_groups_sharpe = w_groups_all_returns_markovitz$media_sharpe_ratio - all_not_w_groups_markovitz$media_sharpe_ratio
)
  

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
    
    
  
  
  # Carregar a biblioteca necessária
  library(openxlsx)
  
  # Método 1: Criar duas arquivos Excel separados
  write.xlsx(diferenca_media_anual, "diferenca_media_anual.xlsx", rowNames = TRUE)
  write.xlsx(all_returns_markovitz_difference, "all_returns_markovitz_difference.xlsx", rowNames = TRUE)
  
  # Método 2: Criar um único arquivo Excel com duas abas
  wb <- createWorkbook()
  
  # Adicionar primeira aba
  addWorksheet(wb, "Diferenca_Media_Anual")
  writeData(wb, "Diferenca_Media_Anual", diferenca_media_anual, rowNames = TRUE)
  
  # Adicionar segunda aba
  addWorksheet(wb, "Returns_Markovitz_Diff")
  writeData(wb, "Returns_Markovitz_Diff", all_returns_markovitz_difference, rowNames = TRUE)
  
  # Salvar o arquivo
  saveWorkbook(wb, "analise_financeira.xlsx", overwrite = TRUE)
  
  print("Arquivos Excel criados com sucesso!")
  
 