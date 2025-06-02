
# Inicializar tibbles para armazenar resultados
w_groups_return_markovitz_quarterly_bal <- w_groups_return_markovitz <- w_groups_return_markovitz_info <- tibble()
w_groups_return_markovitz_quarterly_bal_info <- tibble()
most_efficient_portifolio_quarterly_bal <- tibble()

# Inicializar tibbles para armazenar resultados
daily_w_groups_return_markovitz_yearly_bal <- daily_w_groups_return_markovitz_yearly_bal_info <- daily_pattern 
daily_w_groups_return_markovitz <- daily_w_groups_return_markovitz_info <- daily_pattern


w_groups_most_efficient_portifolio_yearly_bal <- tibble()
w_groups_return_markovitz_yearly_bal <- w_groups_return_markovitz_yearly_bal_info <- tibble()

#---------------------- SEM BALANCEAMENTO ----------------------------------------

stock_prices_w_groups <- daily_return_markovitz(stock_prices_markovitz, w_groups_anual[[1]]$carteira, 2018, FALSE, FALSE, 1, 2013)
stock_prices_w_groups_info <- daily_return_markovitz(stock_prices_markovitz, w_groups_anual_info[[1]]$carteira, 2018, TRUE, FALSE, 1, 2013)
w_groups_pre_calc <- pre_calc_efficient_frontier(stock_prices_w_groups, w_groups_anual[[1]]$carteira, 2017)
w_groups_pre_calc_info <- pre_calc_efficient_frontier(stock_prices_w_groups_info, w_groups_anual_info[[1]]$carteira, 2017)


frontier_w_groups_annual <- efficient_frontier(
  w_groups_pre_calc[[2]], w_groups_pre_calc[[1]], colnames(w_groups_pre_calc[[2]]), length(w_groups_pre_calc[[1]]$return)
)
frontier_w_groups_annual_info <- efficient_frontier(
  w_groups_pre_calc_info[[2]], w_groups_pre_calc_info[[1]], colnames(w_groups_pre_calc_info[[2]]), length(w_groups_pre_calc_info[[1]]$return)
)

most_efficient_w_groups_annual_portifolio <- optimize(frontier_w_groups_annual)
most_efficient_w_groups_annual_portifolio_info <- optimize(frontier_w_groups_annual_info)

w_groups_stock_prices_annual_return <- w_groups_stock_prices_annual_return_info <- tibble()
stock_prices_annual_return <- bind_rows(anual_return(stock_prices_w_groups)) %>% distinct()
stock_prices_annual_return_info <- bind_rows(anual_return(stock_prices_w_groups_info, TRUE, 2013)) %>% distinct()

i = 0
for(i in 2018:2024) {
  local_ibov_returns_annual <- ibov_returns_anual %>% filter(Ano == i)
  local_ibov_returns_annual_info <- ibov_returns_anual_info %>% filter(Ano == i)
  
  selic_return_annual_yearly <- selic_return_annual %>% filter(fiscal_year == i)
  selic_return_annual_yearly_info <- selic_return_annual_info %>% filter(fiscal_year == i)
  
  w_groups_return_markovitz <- bind_rows(
    w_groups_return_markovitz, portifolio_annual_return_markovitz(most_efficient_w_groups_annual_portifolio, stock_prices_annual_return, stock_prices_w_groups, i, local_ibov_returns_annual)
  )
  
  w_groups_return_markovitz_info <- bind_rows(
    w_groups_return_markovitz_info, portifolio_annual_return_markovitz(most_efficient_w_groups_annual_portifolio_info, stock_prices_annual_return_info, stock_prices_w_groups_info, i, local_ibov_returns_annual_info)
  )
  
  #------------------ NOVA METODOLOGIA DE CÁLCULO --------------------------------------------------------------------------
  
  daily_w_groups_return_markovitz$daily_returns <- bind_rows(daily_w_groups_return_markovitz$daily_returns, portifolio_daily_return_markovitz(most_efficient_w_groups_annual_portifolio, stock_prices_w_groups, i))
  daily_w_groups_return_markovitz_info$daily_returns <- bind_rows(daily_w_groups_return_markovitz_info$daily_returns, portifolio_daily_return_markovitz(most_efficient_w_groups_annual_portifolio_info, stock_prices_w_groups_info, i))
  
  daily_w_groups_return_markovitz$annual_returns <- bind_rows(
    daily_w_groups_return_markovitz$annual_returns, portifolio_annual_return_markovitz_new(most_efficient_w_groups_annual_portifolio, daily_w_groups_return_markovitz$daily_returns, stock_prices_w_groups, i, local_ibov_returns_annual, selic_return_annual_yearly)
  )
  daily_w_groups_return_markovitz_info$annual_returns <- bind_rows(
    daily_w_groups_return_markovitz_info$annual_returns, portifolio_annual_return_markovitz_new(most_efficient_w_groups_annual_portifolio_info, daily_w_groups_return_markovitz_info$daily_returns, stock_prices_w_groups_info, i, local_ibov_returns_annual_info, selic_return_annual_yearly_info)
  )
}


#---------------------------- COM BALANCEAMENTO ANUAL (sequencial) -----------------------------------------------------------------

# Processamento sequencial para cada ano
for(i in 2018:2024) {
  local_ibov_returns_annual <- ibov_returns_anual %>% filter(Ano == i)
  local_ibov_returns_annual_info <- ibov_returns_anual_info %>% filter(Ano == i)
  
  selic_return_annual_yearly <- selic_return_annual %>% filter(fiscal_year == i)
  selic_return_annual_yearly_info <- selic_return_annual_info %>% filter(fiscal_year == i)
  
  y = i-2017
  
  # Preparar dados para o ano atual
  stock_prices_w_groups <- daily_return_markovitz(stock_prices_markovitz, w_groups_anual[[y]]$carteira, i, FALSE, FALSE, 1, 2013)
  stock_prices_w_groups_info <- daily_return_markovitz(stock_prices_markovitz, w_groups_anual_info[[y]]$carteira, i, TRUE, FALSE, 1, 2013)
  
  # Calcular retornos anuais
  stock_prices_annual_return <- anual_return(stock_prices_w_groups) %>% distinct()
  stock_prices_annual_return_info <- anual_return(stock_prices_w_groups_info, TRUE, 2013) %>% distinct()
  
  # Pré-cálculos para fronteira eficiente
  w_groups_pre_calc <- pre_calc_efficient_frontier(stock_prices_w_groups, w_groups_anual[[y]]$carteira, (i-1))
  w_groups_pre_calc_info <- pre_calc_efficient_frontier(stock_prices_w_groups_info, w_groups_anual_info[[y]]$carteira, (i-1))
  
  # Calcular fronteira eficiente
  frontier_w_groups_annual <- efficient_frontier(
    w_groups_pre_calc[[2]], w_groups_pre_calc[[1]], colnames(w_groups_pre_calc[[2]]), length(w_groups_pre_calc[[1]]$return)
  )
  
  frontier_w_groups_annual_info <- efficient_frontier(
    w_groups_pre_calc_info[[2]], w_groups_pre_calc_info[[1]], colnames(w_groups_pre_calc_info[[2]]), length(w_groups_pre_calc_info[[1]]$return)
  )
  
  # Encontrar portfólio mais eficiente
  most_efficient_w_groups_annual_portifolio <- optimize(frontier_w_groups_annual)
  most_efficient_w_groups_annual_portifolio_info <- optimize(frontier_w_groups_annual_info)
  
  # Combinar portfólios eficientes
  w_groups_most_efficient_portifolio_yearly_bal <- bind_rows(
    w_groups_most_efficient_portifolio_yearly_bal,
    most_efficient_w_groups_annual_portifolio %>% mutate(.source = "w_groups", Ano = i),
    most_efficient_w_groups_annual_portifolio_info %>% mutate(.source = "w_groups info", Ano = i)
  )
  
  # Calcular retornos diários
  local_daily_w_groups_return_yearly_bal <- portifolio_daily_return_markovitz(most_efficient_w_groups_annual_portifolio, stock_prices_w_groups, i)
  local_daily_w_groups_return_yearly_bal_info <- portifolio_daily_return_markovitz(most_efficient_w_groups_annual_portifolio_info, stock_prices_w_groups_info, i)
  
  # Calcular retornos anuais (nova metodologia)
  local_daily_w_groups_return_markovitz_yearly_bal <- portifolio_annual_return_markovitz_new(most_efficient_w_groups_annual_portifolio, local_daily_w_groups_return_yearly_bal, stock_prices_w_groups, i, local_ibov_returns_annual, selic_return_annual_yearly)
  local_daily_w_groups_return_markovitz_yearly_bal_info <- portifolio_annual_return_markovitz_new(most_efficient_w_groups_annual_portifolio_info, local_daily_w_groups_return_yearly_bal_info, stock_prices_w_groups_info, i, local_ibov_returns_annual_info, selic_return_annual_yearly_info)
  
  # Calcular retornos anuais (método legado)
  local_w_groups_return_markovitz_yearly_bal_bal <- portifolio_annual_return_markovitz(most_efficient_w_groups_annual_portifolio, stock_prices_annual_return, stock_prices_w_groups, i, local_ibov_returns_annual)
  local_w_groups_return_markovitz_yearly_bal_bal_info <- portifolio_annual_return_markovitz(most_efficient_w_groups_annual_portifolio_info, stock_prices_annual_return_info, stock_prices_w_groups_info, i, local_ibov_returns_annual_info)
  
  # Acumular resultados
  w_groups_return_markovitz_yearly_bal <- bind_rows(w_groups_return_markovitz_yearly_bal, local_w_groups_return_markovitz_yearly_bal_bal)
  w_groups_return_markovitz_yearly_bal_info <- bind_rows(w_groups_return_markovitz_yearly_bal_info, local_w_groups_return_markovitz_yearly_bal_bal_info)
  
  daily_w_groups_return_markovitz_yearly_bal$daily_returns <- bind_rows(daily_w_groups_return_markovitz_yearly_bal$daily_returns, local_daily_w_groups_return_yearly_bal)
  daily_w_groups_return_markovitz_yearly_bal_info$daily_returns <- bind_rows(daily_w_groups_return_markovitz_yearly_bal_info$daily_returns, local_daily_w_groups_return_yearly_bal_info)
  
  daily_w_groups_return_markovitz_yearly_bal$annual_returns <- bind_rows(daily_w_groups_return_markovitz_yearly_bal$annual_returns, local_daily_w_groups_return_markovitz_yearly_bal)
  daily_w_groups_return_markovitz_yearly_bal_info$annual_returns <- bind_rows(daily_w_groups_return_markovitz_yearly_bal_info$annual_returns, local_daily_w_groups_return_markovitz_yearly_bal_info)
}