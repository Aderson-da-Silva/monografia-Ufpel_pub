#--------------------------------- Inicializando variáveis -----------------------------------------------------


frontier_B_H_annual <- frontier_B_l_annual <- frontier_s_H_annual <- frontier_s_l_annual <- list()
frontier_B_H_annual_info <- frontier_B_l_annual_info <- frontier_s_H_annual_info <- frontier_s_l_annual_info <- list()
frontier_B_H_annual_yearly_bal <- frontier_B_l_annual_yearly_bal <- frontier_s_H_annual_yearly_bal <- frontier_s_l_annual_yearly_bal <- list()
frontier_B_H_annual_yearly_bal_info <- frontier_B_l_annual_yearly_bal_info <- frontier_s_H_annual_yearly_bal_info <- frontier_s_l_annual_yearly_bal_info <- list()
most_efficient_portifolio_yearly_bal <- most_efficient_portifolio_tri_bal <- tibble()


s_l_return_markovitz <- s_H_return_markovitz <- B_l_return_markovitz <- B_H_return_markovitz <- tibble()
s_l_return_markovitz_info <- s_H_return_markovitz_info <- B_l_return_markovitz_info <- B_H_return_markovitz_info <- tibble()
s_l_return_markovitz_yearly_bal <- s_H_return_markovitz_yearly_bal <- B_l_return_markovitz_yearly_bal <- B_H_return_markovitz_yearly_bal <- tibble()
s_l_return_markovitz_yearly_bal_info <- s_H_return_markovitz_yearly_bal_info <- B_l_return_markovitz_yearly_bal_info <- B_H_return_markovitz_yearly_bal_info <- tibble()

w_groups_return_markovitz <- w_groups_return_markovitz_info <- tibble()


#------------------ Variáveis da nova metodologia de cálculo -----------------------------------------------
daily_w_groups_return_markovitz <- daily_w_groups_return_markovitz_info <- daily_pattern

daily_B_H_return_markovitz <- daily_B_l_return_markovitz <- daily_s_H_return_markovitz <- daily_s_l_return_markovitz <- daily_pattern
daily_B_H_return_markovitz_info <- daily_B_l_return_markovitz_info <- daily_s_H_return_markovitz_info <- daily_s_l_return_markovitz_info <- daily_pattern


daily_B_H_return_markovitz_yearly_bal <- daily_B_l_return_markovitz_yearly_bal <- daily_s_H_return_markovitz_yearly_bal <- daily_s_l_return_markovitz_yearly_bal <- daily_pattern
daily_B_H_return_markovitz_yearly_bal_info <- daily_B_l_return_markovitz_yearly_bal_info <- daily_s_H_return_markovitz_yearly_bal_info <- daily_s_l_return_markovitz_yearly_bal_info <- daily_pattern

#----------------------------------- Sem balanceamento de empresas no portifólio -----------------------


  stock_prices_B_H <- daily_return_markovitz(stock_prices_markovitz, groups_anual[[1]]$data$B_H, 2018, FALSE, FALSE, 1, 2013)
  stock_prices_B_l <- daily_return_markovitz(stock_prices_markovitz, groups_anual[[1]]$data$B_l, 2018, FALSE, FALSE, 1, 2013)
  stock_prices_s_H <- daily_return_markovitz(stock_prices_markovitz, groups_anual[[1]]$data$s_H, 2018, FALSE, FALSE, 1, 2013)
  stock_prices_s_l <- daily_return_markovitz(stock_prices_markovitz, groups_anual[[1]]$data$s_l, 2018, FALSE, FALSE, 1, 2013)
  
  stock_prices_B_H_info <- daily_return_markovitz(stock_prices_markovitz, groups_anual_info[[1]]$data$B_H, 2018, TRUE, FALSE, 1, 2013)
  stock_prices_B_l_info <- daily_return_markovitz(stock_prices_markovitz, groups_anual_info[[1]]$data$B_l, 2018, TRUE, FALSE, 1, 2013)
  stock_prices_s_H_info <- daily_return_markovitz(stock_prices_markovitz, groups_anual_info[[1]]$data$s_H, 2018, TRUE, FALSE, 1, 2013)
  stock_prices_s_l_info <- daily_return_markovitz(stock_prices_markovitz, groups_anual_info[[1]]$data$s_l, 2018, TRUE, FALSE, 1, 2013)
  
  
  B_H_pre_calc <- pre_calc_efficient_frontier(stock_prices_B_H, groups_anual[[1]]$data$B_H, 2017)
  B_l_pre_calc <- pre_calc_efficient_frontier(stock_prices_B_l, groups_anual[[1]]$data$B_l, 2017)
  s_H_pre_calc <- pre_calc_efficient_frontier(stock_prices_s_H, groups_anual[[1]]$data$s_H, 2017)
  s_l_pre_calc <- pre_calc_efficient_frontier(stock_prices_s_l, groups_anual[[1]]$data$s_l, 2017)
  
  B_H_pre_calc_info <- pre_calc_efficient_frontier(stock_prices_B_H_info, groups_anual_info[[1]]$data$B_H, 2017)
  B_l_pre_calc_info <- pre_calc_efficient_frontier(stock_prices_B_l_info, groups_anual_info[[1]]$data$B_l, 2017)
  s_H_pre_calc_info <- pre_calc_efficient_frontier(stock_prices_s_H_info, groups_anual_info[[1]]$data$s_H, 2017)
  s_l_pre_calc_info <- pre_calc_efficient_frontier(stock_prices_s_l_info, groups_anual_info[[1]]$data$s_l, 2017)
  
  
  
  frontier_B_H_annual <- efficient_frontier(
    B_H_pre_calc[[2]], B_H_pre_calc[[1]], colnames(B_H_pre_calc[[2]]), length(B_H_pre_calc[[1]]$return)
  )
  frontier_B_l_annual <- efficient_frontier(
    B_l_pre_calc[[2]], B_l_pre_calc[[1]], colnames(B_l_pre_calc[[2]]), length(B_l_pre_calc[[1]]$return)
  )
  frontier_s_H_annual <- efficient_frontier(
    s_H_pre_calc[[2]], s_H_pre_calc[[1]], colnames(s_H_pre_calc[[2]]), length(s_H_pre_calc[[1]]$return)
  )
  frontier_s_l_annual <- efficient_frontier(
    s_l_pre_calc[[2]], s_l_pre_calc[[1]], colnames(s_l_pre_calc[[2]]), length(s_l_pre_calc[[1]]$return)
  )
  
  frontier_B_H_annual_info <- efficient_frontier(
    B_H_pre_calc_info[[2]], B_H_pre_calc_info[[1]], colnames(B_H_pre_calc_info[[2]]), length(B_H_pre_calc_info[[1]]$return)
  )
  frontier_B_l_annual_info <- efficient_frontier(
    B_l_pre_calc_info[[2]], B_l_pre_calc_info[[1]], colnames(B_l_pre_calc_info[[2]]), length(B_l_pre_calc_info[[1]]$return)
  )
  frontier_s_H_annual_info <- efficient_frontier(
    s_H_pre_calc_info[[2]], s_H_pre_calc_info[[1]], colnames(s_H_pre_calc_info[[2]]), length(s_H_pre_calc_info[[1]]$return)
  )
  frontier_s_l_annual_info <- efficient_frontier(
    s_l_pre_calc_info[[2]], s_l_pre_calc_info[[1]], colnames(s_l_pre_calc_info[[2]]), length(s_l_pre_calc_info[[1]]$return)
  )
  
  
  most_efficient_B_H_annual_portifolio <- optimize(frontier_B_H_annual) 
  most_efficient_B_l_annual_portifolio <- optimize(frontier_B_l_annual) 
  most_efficient_s_H_annual_portifolio <- optimize(frontier_s_H_annual)
  most_efficient_s_l_annual_portifolio <- optimize(frontier_s_l_annual) 
  most_efficient_B_H_annual_portifolio_info <- optimize(frontier_B_H_annual_info)
  most_efficient_B_l_annual_portifolio_info <- optimize(frontier_B_l_annual_info)
  most_efficient_s_H_annual_portifolio_info <- optimize(frontier_s_H_annual_info)
  most_efficient_s_l_annual_portifolio_info <- optimize(frontier_s_l_annual_info) 
  
  
  stock_prices_annual_return <- tibble()
  stock_prices_annual_return_info <- tibble()
  
  stock_prices_annual_return <- bind_rows(anual_return(stock_prices_B_H),
                                          anual_return(stock_prices_B_l),
                                          anual_return(stock_prices_s_H),
                                          anual_return(stock_prices_s_l)) %>% distinct()
  
  stock_prices_annual_return_info <- bind_rows(anual_return(stock_prices_B_H_info, TRUE, 2013),
                                               anual_return(stock_prices_B_l_info, TRUE, 2013),
                                               anual_return(stock_prices_s_H_info, TRUE, 2013),
                                               anual_return(stock_prices_s_l_info, TRUE, 2013)) %>% distinct()
  
  
  
  i = 0
  for(i in 2018:2024) {
    local_ibov_returns_annual <- ibov_returns_anual %>% filter(Ano == i)
    local_ibov_returns_annual_info <- ibov_returns_anual_info %>% filter(Ano == i)
    
    selic_return_annual_yearly <- selic_return_annual %>% filter(fiscal_year == i)
    selic_return_annual_yearly_info <- selic_return_annual_info %>% filter(fiscal_year == i)
    
    B_H_return_markovitz <- bind_rows(
      B_H_return_markovitz, portifolio_annual_return_markovitz(most_efficient_B_H_annual_portifolio, stock_prices_annual_return, stock_prices_B_H, i, local_ibov_returns_annual)
    )
    
    B_l_return_markovitz <- bind_rows(
      B_l_return_markovitz, portifolio_annual_return_markovitz(most_efficient_B_l_annual_portifolio, stock_prices_annual_return, stock_prices_B_l, i, local_ibov_returns_annual)
    )
    
    s_H_return_markovitz <- bind_rows(
      s_H_return_markovitz, portifolio_annual_return_markovitz(most_efficient_s_H_annual_portifolio, stock_prices_annual_return, stock_prices_s_H, i, local_ibov_returns_annual)
    )
    
    s_l_return_markovitz <- bind_rows(
      s_l_return_markovitz, portifolio_annual_return_markovitz(most_efficient_s_l_annual_portifolio, stock_prices_annual_return, stock_prices_s_l, i, local_ibov_returns_annual)
    )
    
    
    B_H_return_markovitz_info <- bind_rows(
      B_H_return_markovitz_info, portifolio_annual_return_markovitz(most_efficient_B_H_annual_portifolio_info, stock_prices_annual_return_info, stock_prices_B_H_info, i, local_ibov_returns_annual_info)
    )
    
    B_l_return_markovitz_info <- bind_rows(
      B_l_return_markovitz_info, portifolio_annual_return_markovitz(most_efficient_B_l_annual_portifolio_info, stock_prices_annual_return_info, stock_prices_B_l_info, i, local_ibov_returns_annual_info)
    )
    
    s_H_return_markovitz_info <- bind_rows(
      s_H_return_markovitz_info, portifolio_annual_return_markovitz(most_efficient_s_H_annual_portifolio_info, stock_prices_annual_return_info, stock_prices_s_H_info, i, local_ibov_returns_annual_info)
    )
    
    s_l_return_markovitz_info <- bind_rows(
      s_l_return_markovitz_info, portifolio_annual_return_markovitz(most_efficient_s_l_annual_portifolio_info, stock_prices_annual_return_info, stock_prices_s_l_info, i, local_ibov_returns_annual_info)
    )
    
    
    
    
    #------------------ NOVA METODOLOGIA DE CÁLCULO --------------------------------------------------------------------------
    
    daily_B_H_return_markovitz$daily_returns <- bind_rows(daily_B_H_return_markovitz$daily_returns, portifolio_daily_return_markovitz(most_efficient_B_H_annual_portifolio, stock_prices_B_H, i))
    daily_B_l_return_markovitz$daily_returns <- bind_rows(daily_B_l_return_markovitz$daily_returns, portifolio_daily_return_markovitz(most_efficient_B_l_annual_portifolio, stock_prices_B_l, i))
    daily_s_H_return_markovitz$daily_returns <- bind_rows(daily_s_H_return_markovitz$daily_returns, portifolio_daily_return_markovitz(most_efficient_s_H_annual_portifolio, stock_prices_s_H, i))
    daily_s_l_return_markovitz$daily_returns <- bind_rows(daily_s_l_return_markovitz$daily_returns, portifolio_daily_return_markovitz(most_efficient_s_l_annual_portifolio, stock_prices_s_l, i))
    
    daily_B_H_return_markovitz_info$daily_returns <- bind_rows(daily_B_H_return_markovitz_info$daily_returns, portifolio_daily_return_markovitz(most_efficient_B_H_annual_portifolio_info, stock_prices_B_H_info, i))
    daily_B_l_return_markovitz_info$daily_returns <- bind_rows(daily_B_l_return_markovitz_info$daily_returns, portifolio_daily_return_markovitz(most_efficient_B_l_annual_portifolio_info, stock_prices_B_l_info, i))
    daily_s_H_return_markovitz_info$daily_returns <- bind_rows(daily_s_H_return_markovitz_info$daily_returns, portifolio_daily_return_markovitz(most_efficient_s_H_annual_portifolio_info, stock_prices_s_H_info, i))
    daily_s_l_return_markovitz_info$daily_returns <- bind_rows(daily_s_l_return_markovitz_info$daily_returns, portifolio_daily_return_markovitz(most_efficient_s_l_annual_portifolio_info, stock_prices_s_l_info, i))
    
    daily_B_H_return_markovitz$annual_returns <- bind_rows(
      daily_B_H_return_markovitz$annual_returns, portifolio_annual_return_markovitz_new(most_efficient_B_H_annual_portifolio, daily_B_H_return_markovitz$daily_returns, stock_prices_B_H, i, local_ibov_returns_annual, selic_return_annual_yearly)
    )
    
    daily_B_l_return_markovitz$annual_returns <- bind_rows(
      daily_B_l_return_markovitz$annual_returns, portifolio_annual_return_markovitz_new(most_efficient_B_l_annual_portifolio, daily_B_l_return_markovitz$daily_returns, stock_prices_B_l, i, local_ibov_returns_annual, selic_return_annual_yearly)
    )
    
    daily_s_H_return_markovitz$annual_returns <- bind_rows(
      daily_s_H_return_markovitz$annual_returns, portifolio_annual_return_markovitz_new(most_efficient_s_H_annual_portifolio, daily_s_H_return_markovitz$daily_returns, stock_prices_s_H, i, local_ibov_returns_annual, selic_return_annual_yearly)
    )
    
    daily_s_l_return_markovitz$annual_returns <- bind_rows(
      daily_s_l_return_markovitz$annual_returns, portifolio_annual_return_markovitz_new(most_efficient_s_l_annual_portifolio, daily_s_l_return_markovitz$daily_returns, stock_prices_s_l, i, local_ibov_returns_annual, selic_return_annual_yearly)
    )
    
    
    daily_B_H_return_markovitz_info$annual_returns <- bind_rows(
      daily_B_H_return_markovitz_info$annual_returns, portifolio_annual_return_markovitz_new(most_efficient_B_H_annual_portifolio_info, daily_B_H_return_markovitz_info$daily_returns, stock_prices_B_H_info, i, local_ibov_returns_annual_info, selic_return_annual_yearly_info)
    )
    
    daily_B_l_return_markovitz_info$annual_returns <- bind_rows(
      daily_B_l_return_markovitz_info$annual_returns, portifolio_annual_return_markovitz_new(most_efficient_B_l_annual_portifolio_info, daily_B_l_return_markovitz_info$daily_returns, stock_prices_B_l_info, i, local_ibov_returns_annual_info, selic_return_annual_yearly_info)
    )
    
    daily_s_H_return_markovitz_info$annual_returns <- bind_rows(
      daily_s_H_return_markovitz_info$annual_returns, portifolio_annual_return_markovitz_new(most_efficient_s_H_annual_portifolio_info, daily_s_H_return_markovitz_info$daily_returns, stock_prices_s_H_info, i, local_ibov_returns_annual_info, selic_return_annual_yearly_info)
    )
    
    daily_s_l_return_markovitz_info$annual_returns <- bind_rows(
      daily_s_l_return_markovitz_info$annual_returns, portifolio_annual_return_markovitz_new(most_efficient_s_l_annual_portifolio_info, daily_s_l_return_markovitz_info$daily_returns, stock_prices_s_l_info, i, local_ibov_returns_annual_info, selic_return_annual_yearly_info)
    )
    
  }

  
#---------------------------- Com balanceamento anual -----------------------------------------------------------------

  cl <- makeCluster(5)
  registerDoParallel(cl)
  
  results <- foreach(i = 2018:2024, .packages = c("tidyverse", "quadprog", "corpcor")) %dopar% {
    local_ibov_returns_annual <- ibov_returns_anual %>% filter(Ano == i)
    local_ibov_returns_annual_info <- ibov_returns_anual_info %>% filter(Ano == i)
    
    selic_return_annual_yearly <- selic_return_annual %>% filter(fiscal_year == i)
    selic_return_annual_yearly_info <- selic_return_annual_info %>% filter(fiscal_year == i)
    
    y = i-2017
    
    
    stock_prices_B_H <- daily_return_markovitz(stock_prices_markovitz, groups_anual[[y]]$data$B_H, i, FALSE, FALSE, 1, 2013)
    stock_prices_B_l <- daily_return_markovitz(stock_prices_markovitz, groups_anual[[y]]$data$B_l, i, FALSE, FALSE, 1, 2013)
    stock_prices_s_H <- daily_return_markovitz(stock_prices_markovitz, groups_anual[[y]]$data$s_H, i, FALSE, FALSE, 1, 2013)
    stock_prices_s_l <- daily_return_markovitz(stock_prices_markovitz, groups_anual[[y]]$data$s_l, i, FALSE, FALSE, 1, 2013)
    
    stock_prices_B_H_info <- daily_return_markovitz(stock_prices_markovitz, groups_anual_info[[y]]$data$B_H, i, TRUE, FALSE, 1, 2013)
    stock_prices_B_l_info <- daily_return_markovitz(stock_prices_markovitz, groups_anual_info[[y]]$data$B_l, i, TRUE, FALSE, 1, 2013)
    stock_prices_s_H_info <- daily_return_markovitz(stock_prices_markovitz, groups_anual_info[[y]]$data$s_H, i, TRUE, FALSE, 1, 2013)
    stock_prices_s_l_info <- daily_return_markovitz(stock_prices_markovitz, groups_anual_info[[y]]$data$s_l, i, TRUE, FALSE, 1, 2013)
    
    stock_prices_annual_return <- tibble()
    stock_prices_annual_return <- bind_rows(anual_return(stock_prices_B_H),
                                            anual_return(stock_prices_B_l),
                                            anual_return(stock_prices_s_H),
                                            anual_return(stock_prices_s_l)) %>% distinct()
    stock_prices_annual_return_info <- tibble()
    stock_prices_annual_return_info <- bind_rows(anual_return(stock_prices_B_H_info, TRUE, 2013),
                                                 anual_return(stock_prices_B_l_info, TRUE, 2013),
                                                 anual_return(stock_prices_s_H_info, TRUE, 2013),
                                                 anual_return(stock_prices_s_l_info, TRUE, 2013)) %>% distinct()
    
    B_H_pre_calc <- pre_calc_efficient_frontier(stock_prices_B_H, groups_anual[[y]]$data$B_H, (i-1))
    B_l_pre_calc <- pre_calc_efficient_frontier(stock_prices_B_l, groups_anual[[y]]$data$B_l, (i-1))
    s_H_pre_calc <- pre_calc_efficient_frontier(stock_prices_s_H, groups_anual[[y]]$data$s_H, (i-1))
    s_l_pre_calc <- pre_calc_efficient_frontier(stock_prices_s_l, groups_anual[[y]]$data$s_l, (i-1))
    
    B_H_pre_calc_info <- pre_calc_efficient_frontier(stock_prices_B_H_info, groups_anual_info[[y]]$data$B_H, (i-1))
    B_l_pre_calc_info <- pre_calc_efficient_frontier(stock_prices_B_l_info, groups_anual_info[[y]]$data$B_l, (i-1))
    s_H_pre_calc_info <- pre_calc_efficient_frontier(stock_prices_s_H_info, groups_anual_info[[y]]$data$s_H, (i-1))
    s_l_pre_calc_info <- pre_calc_efficient_frontier(stock_prices_s_l_info, groups_anual_info[[y]]$data$s_l, (i-1))
    
    
    frontier_B_H_annual_yearly_bal <- efficient_frontier(
      B_H_pre_calc[[2]], B_H_pre_calc[[1]], colnames(B_H_pre_calc[[2]]), length(B_H_pre_calc[[1]]$return)
    )
    
    frontier_B_l_annual_yearly_bal <- efficient_frontier(
      B_l_pre_calc[[2]], B_l_pre_calc[[1]], colnames(B_l_pre_calc[[2]]), length(B_l_pre_calc[[1]]$return)
    )
    frontier_s_H_annual_yearly_bal <- efficient_frontier(
      s_H_pre_calc[[2]], s_H_pre_calc[[1]], colnames(s_H_pre_calc[[2]]), length(s_H_pre_calc[[1]]$return)
    )
    frontier_s_l_annual_yearly_bal <- efficient_frontier(
      s_l_pre_calc[[2]], s_l_pre_calc[[1]], colnames(s_l_pre_calc[[2]]), length(s_l_pre_calc[[1]]$return)
    )
    
    frontier_B_H_annual_yearly_bal_info <- efficient_frontier(
      B_H_pre_calc_info[[2]], B_H_pre_calc_info[[1]], colnames(B_H_pre_calc_info[[2]]), length(B_H_pre_calc_info[[1]]$return)
    )
    frontier_B_l_annual_yearly_bal_info <- efficient_frontier(
      B_l_pre_calc_info[[2]], B_l_pre_calc_info[[1]], colnames(B_l_pre_calc_info[[2]]), length(B_l_pre_calc_info[[1]]$return)
    )
    frontier_s_H_annual_yearly_bal_info <- efficient_frontier(
      s_H_pre_calc_info[[2]], s_H_pre_calc_info[[1]], colnames(s_H_pre_calc_info[[2]]), length(s_H_pre_calc_info[[1]]$return)
    )
    frontier_s_l_annual_yearly_bal_info <- efficient_frontier(
      s_l_pre_calc_info[[2]], s_l_pre_calc_info[[1]], colnames(s_l_pre_calc_info[[2]]), length(s_l_pre_calc_info[[1]]$return)
    )
    
    most_efficient_B_H_annual_yearly_bal_portifolio <- optimize(frontier_B_H_annual_yearly_bal)
    most_efficient_B_l_annual_yearly_bal_portifolio <- optimize(frontier_B_l_annual_yearly_bal)
    most_efficient_s_H_annual_yearly_bal_portifolio <- optimize(frontier_s_H_annual_yearly_bal)
    most_efficient_s_l_annual_yearly_bal_portifolio <- optimize(frontier_s_l_annual_yearly_bal)
    most_efficient_B_H_annual_yearly_bal_portifolio_info <- optimize(frontier_B_H_annual_yearly_bal_info)
    most_efficient_B_l_annual_yearly_bal_portifolio_info <- optimize(frontier_B_l_annual_yearly_bal_info)
    most_efficient_s_H_annual_yearly_bal_portifolio_info <- optimize(frontier_s_H_annual_yearly_bal_info)
    most_efficient_s_l_annual_yearly_bal_portifolio_info <- optimize(frontier_s_l_annual_yearly_bal_info)
    
    most_efficient_portifolio <- bind_rows(
      most_efficient_B_H_annual_yearly_bal_portifolio %>% mutate(.source = "B_H", Ano = i),
      most_efficient_B_l_annual_yearly_bal_portifolio %>% mutate(.source = "B_l", Ano = i),
      most_efficient_s_H_annual_yearly_bal_portifolio %>% mutate(.source = "s_H", Ano = i),
      most_efficient_s_l_annual_yearly_bal_portifolio %>% mutate(.source = "s_l", Ano = i),
      most_efficient_B_H_annual_yearly_bal_portifolio_info %>% mutate(.source = "B_H info", Ano = i),
      most_efficient_B_l_annual_yearly_bal_portifolio_info %>% mutate(.source = "B_l info", Ano = i),
      most_efficient_s_H_annual_yearly_bal_portifolio_info %>% mutate(.source = "s_H info", Ano = i),
      most_efficient_s_l_annual_yearly_bal_portifolio_info %>% mutate(.source = "s_l info", Ano = i)
      )
    
    
    
    
    local_daily_B_H_return <-  portifolio_daily_return_markovitz(most_efficient_B_H_annual_yearly_bal_portifolio, stock_prices_B_H, i)
    local_daily_B_l_return <-  portifolio_daily_return_markovitz(most_efficient_B_l_annual_yearly_bal_portifolio, stock_prices_B_l, i)
    local_daily_s_H_return <-  portifolio_daily_return_markovitz(most_efficient_s_H_annual_yearly_bal_portifolio, stock_prices_s_H, i)
    local_daily_s_l_return <-  portifolio_daily_return_markovitz(most_efficient_s_l_annual_yearly_bal_portifolio, stock_prices_s_l, i)
    
    local_daily_B_H_return_info <-  portifolio_daily_return_markovitz(most_efficient_B_H_annual_yearly_bal_portifolio_info, stock_prices_B_H_info, i)
    local_daily_B_l_return_info <-  portifolio_daily_return_markovitz(most_efficient_B_l_annual_yearly_bal_portifolio_info, stock_prices_B_l_info, i)
    local_daily_s_H_return_info <-  portifolio_daily_return_markovitz(most_efficient_s_H_annual_yearly_bal_portifolio_info, stock_prices_s_H_info, i)
    local_daily_s_l_return_info <-  portifolio_daily_return_markovitz(most_efficient_s_l_annual_yearly_bal_portifolio_info, stock_prices_s_l_info, i)
    
    local_daily_B_H_return_markovitz_yearly_bal <- portifolio_annual_return_markovitz_new(most_efficient_B_H_annual_yearly_bal_portifolio, local_daily_B_H_return, stock_prices_B_H, i, local_ibov_returns_annual, selic_return_annual_yearly)
    local_daily_B_l_return_markovitz_yearly_bal <- portifolio_annual_return_markovitz_new(most_efficient_B_l_annual_yearly_bal_portifolio, local_daily_B_l_return, stock_prices_B_l, i, local_ibov_returns_annual, selic_return_annual_yearly)
    local_daily_s_H_return_markovitz_yearly_bal <- portifolio_annual_return_markovitz_new(most_efficient_s_H_annual_yearly_bal_portifolio, local_daily_s_H_return, stock_prices_s_H, i, local_ibov_returns_annual, selic_return_annual_yearly)
    local_daily_s_l_return_markovitz_yearly_bal <- portifolio_annual_return_markovitz_new(most_efficient_s_l_annual_yearly_bal_portifolio, local_daily_s_l_return, stock_prices_s_l, i, local_ibov_returns_annual, selic_return_annual_yearly)
    
    local_daily_B_H_return_markovitz_yearly_bal_info <- portifolio_annual_return_markovitz_new(most_efficient_B_H_annual_yearly_bal_portifolio_info, local_daily_B_H_return_info, stock_prices_B_H_info, i, local_ibov_returns_annual_info, selic_return_annual_yearly_info)
    local_daily_B_l_return_markovitz_yearly_bal_info <- portifolio_annual_return_markovitz_new(most_efficient_B_l_annual_yearly_bal_portifolio_info, local_daily_B_l_return_info, stock_prices_B_l_info, i, local_ibov_returns_annual_info, selic_return_annual_yearly_info)
    local_daily_s_H_return_markovitz_yearly_bal_info <- portifolio_annual_return_markovitz_new(most_efficient_s_H_annual_yearly_bal_portifolio_info, local_daily_s_H_return_info, stock_prices_s_H_info, i, local_ibov_returns_annual_info, selic_return_annual_yearly_info)
    local_daily_s_l_return_markovitz_yearly_bal_info <- portifolio_annual_return_markovitz_new(most_efficient_s_l_annual_yearly_bal_portifolio_info, local_daily_s_l_return_info, stock_prices_s_l_info, i, local_ibov_returns_annual_info, selic_return_annual_yearly_info)
    
    
    
    
    
    local_B_H_return_markovitz_yearly_bal <- portifolio_annual_return_markovitz(most_efficient_B_H_annual_yearly_bal_portifolio, stock_prices_annual_return, stock_prices_B_H, i, local_ibov_returns_annual)
    local_B_l_return_markovitz_yearly_bal <- portifolio_annual_return_markovitz(most_efficient_B_l_annual_yearly_bal_portifolio, stock_prices_annual_return, stock_prices_B_l, i, local_ibov_returns_annual)
    local_s_H_return_markovitz_yearly_bal <- portifolio_annual_return_markovitz(most_efficient_s_H_annual_yearly_bal_portifolio, stock_prices_annual_return, stock_prices_s_H, i, local_ibov_returns_annual)
    local_s_l_return_markovitz_yearly_bal <- portifolio_annual_return_markovitz(most_efficient_s_l_annual_yearly_bal_portifolio, stock_prices_annual_return, stock_prices_s_l, i, local_ibov_returns_annual)
    
    local_B_H_return_markovitz_yearly_bal_info <- portifolio_annual_return_markovitz(most_efficient_B_H_annual_yearly_bal_portifolio_info, stock_prices_annual_return_info, stock_prices_B_H_info, i, local_ibov_returns_annual_info)
    local_B_l_return_markovitz_yearly_bal_info <- portifolio_annual_return_markovitz(most_efficient_B_l_annual_yearly_bal_portifolio_info, stock_prices_annual_return_info, stock_prices_B_l_info, i, local_ibov_returns_annual_info)
    local_s_H_return_markovitz_yearly_bal_info <- portifolio_annual_return_markovitz(most_efficient_s_H_annual_yearly_bal_portifolio_info, stock_prices_annual_return_info, stock_prices_s_H_info, i, local_ibov_returns_annual_info)
    local_s_l_return_markovitz_yearly_bal_info <- portifolio_annual_return_markovitz(most_efficient_s_l_annual_yearly_bal_portifolio_info, stock_prices_annual_return_info, stock_prices_s_l_info, i, local_ibov_returns_annual_info)
    
    return(list(
      B_H_legacy = local_B_H_return_markovitz_yearly_bal,
      B_l_legacy = local_B_l_return_markovitz_yearly_bal,
      s_H_legacy = local_s_H_return_markovitz_yearly_bal,
      s_l_legacy = local_s_l_return_markovitz_yearly_bal,
      B_H_info_legacy = local_B_H_return_markovitz_yearly_bal_info,
      B_l_info_legacy = local_B_l_return_markovitz_yearly_bal_info,
      s_H_info_legacy = local_s_H_return_markovitz_yearly_bal_info,
      s_l_info_legacy = local_s_l_return_markovitz_yearly_bal_info,
      
      
      B_H_daily = local_daily_B_H_return,
      B_l_daily = local_daily_B_l_return,
      s_H_daily = local_daily_s_H_return,
      s_l_daily = local_daily_s_l_return,
      B_H_info_daily = local_daily_B_H_return_info,
      B_l_info_daily = local_daily_B_l_return_info,
      s_H_info_daily = local_daily_s_H_return_info,
      s_l_info_daily = local_daily_s_l_return_info,
      
      B_H_yearly = local_daily_B_H_return_markovitz_yearly_bal,
      B_l_yearly = local_daily_B_l_return_markovitz_yearly_bal,
      s_H_yearly = local_daily_s_H_return_markovitz_yearly_bal,
      s_l_yearly = local_daily_s_l_return_markovitz_yearly_bal,
      B_H_info_yearly = local_daily_B_H_return_markovitz_yearly_bal_info,
      B_l_info_yearly = local_daily_B_l_return_markovitz_yearly_bal_info,
      s_H_info_yearly = local_daily_s_H_return_markovitz_yearly_bal_info,
      s_l_info_yearly = local_daily_s_l_return_markovitz_yearly_bal_info,
      
      
      portifolios = most_efficient_portifolio
      
    ))
    
  }
  
  # Combine results from all iterations
  for (res in results) {
    B_H_return_markovitz_yearly_bal <- bind_rows(B_H_return_markovitz_yearly_bal, res$B_H_legacy)
    B_l_return_markovitz_yearly_bal <- bind_rows(B_l_return_markovitz_yearly_bal, res$B_l_legacy)
    s_H_return_markovitz_yearly_bal <- bind_rows(s_H_return_markovitz_yearly_bal, res$s_H_legacy)
    s_l_return_markovitz_yearly_bal <- bind_rows(s_l_return_markovitz_yearly_bal, res$s_l_legacy)
    
    B_H_return_markovitz_yearly_bal_info <- bind_rows(B_H_return_markovitz_yearly_bal_info, res$B_H_info_legacy)
    B_l_return_markovitz_yearly_bal_info <- bind_rows(B_l_return_markovitz_yearly_bal_info, res$B_l_info_legacy)
    s_H_return_markovitz_yearly_bal_info <- bind_rows(s_H_return_markovitz_yearly_bal_info, res$s_H_info_legacy)
    s_l_return_markovitz_yearly_bal_info <- bind_rows(s_l_return_markovitz_yearly_bal_info, res$s_l_info_legacy)
    
    daily_B_H_return_markovitz_yearly_bal$daily_returns <- bind_rows(daily_B_H_return_markovitz_yearly_bal$daily_returns, res$B_H_daily)
    daily_B_l_return_markovitz_yearly_bal$daily_returns <- bind_rows(daily_B_l_return_markovitz_yearly_bal$daily_returns, res$B_l_daily)
    daily_s_H_return_markovitz_yearly_bal$daily_returns <- bind_rows(daily_s_H_return_markovitz_yearly_bal$daily_returns, res$s_H_daily)
    daily_s_l_return_markovitz_yearly_bal$daily_returns <- bind_rows(daily_s_l_return_markovitz_yearly_bal$daily_returns, res$s_l_daily)
    
    daily_B_H_return_markovitz_yearly_bal_info$daily_returns <- bind_rows(daily_B_H_return_markovitz_yearly_bal_info$daily_returns, res$B_H_info_daily)
    daily_B_l_return_markovitz_yearly_bal_info$daily_returns <- bind_rows(daily_B_l_return_markovitz_yearly_bal_info$daily_returns, res$B_l_info_daily)
    daily_s_H_return_markovitz_yearly_bal_info$daily_returns <- bind_rows(daily_s_H_return_markovitz_yearly_bal_info$daily_returns, res$s_H_info_daily)
    daily_s_l_return_markovitz_yearly_bal_info$daily_returns <- bind_rows(daily_s_l_return_markovitz_yearly_bal_info$daily_returns, res$s_l_info_daily)
    
    
    daily_B_H_return_markovitz_yearly_bal$annual_returns <- bind_rows(daily_B_H_return_markovitz_yearly_bal$annual_returns, res$B_H_yearly)
    daily_B_l_return_markovitz_yearly_bal$annual_returns <- bind_rows(daily_B_l_return_markovitz_yearly_bal$annual_returns, res$B_l_yearly)
    daily_s_H_return_markovitz_yearly_bal$annual_returns <- bind_rows(daily_s_H_return_markovitz_yearly_bal$annual_returns, res$s_H_yearly)
    daily_s_l_return_markovitz_yearly_bal$annual_returns <- bind_rows(daily_s_l_return_markovitz_yearly_bal$annual_returns, res$s_l_yearly)
    
    daily_B_H_return_markovitz_yearly_bal_info$annual_returns <- bind_rows(daily_B_H_return_markovitz_yearly_bal_info$annual_returns, res$B_H_info_yearly)
    daily_B_l_return_markovitz_yearly_bal_info$annual_returns <- bind_rows(daily_B_l_return_markovitz_yearly_bal_info$annual_returns, res$B_l_info_yearly)
    daily_s_H_return_markovitz_yearly_bal_info$annual_returns <- bind_rows(daily_s_H_return_markovitz_yearly_bal_info$annual_returns, res$s_H_info_yearly)
    daily_s_l_return_markovitz_yearly_bal_info$annual_returns <- bind_rows(daily_s_l_return_markovitz_yearly_bal_info$annual_returns, res$s_l_info_yearly)
    
    
    most_efficient_portifolio_yearly_bal <- bind_rows(most_efficient_portifolio_yearly_bal, res$portifolios)
  }
  
  stopCluster(cl)
  rm(results) 