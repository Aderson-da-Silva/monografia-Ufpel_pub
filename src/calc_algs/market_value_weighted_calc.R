#------------------------ Inicializando Variáveis ---------------------------------------

B_H_return_weighted <- B_l_return_weighted <- s_H_return_weighted <- s_l_return_weighted <- pattern_yearly
B_l_return_weighted_info <- s_H_return_weighted_info <- s_l_return_weighted_info <- B_H_return_weighted_info <- pattern_yearly
B_H_return_weighted_yearly_bal <- B_l_return_weighted_yearly_bal <- s_H_return_weighted_yearly_bal <- s_l_return_weighted_yearly_bal <- pattern_yearly
B_H_return_weighted_yearly_bal_info <- B_l_return_weighted_yearly_bal_info <- s_H_return_weighted_yearly_bal_info <- s_l_return_weighted_yearly_bal_info <- pattern_yearly

daily_B_H_return_weighted <- daily_B_l_return_weighted <- daily_s_H_return_weighted <- daily_s_l_return_weighted <- daily_pattern <- list(
  daily_returns = tibble(),
  annual_returns = tibble()
)
daily_B_H_return_weighted_info <- daily_B_l_return_weighted_info <- daily_s_H_return_weighted_info <- daily_s_l_return_weighted_info <- daily_pattern

daily_B_H_return_weighted_yearly_bal <- daily_B_l_return_weighted_yearly_bal <- daily_s_H_return_weighted_yearly_bal <- daily_s_l_return_weighted_yearly_bal <- daily_pattern
daily_B_H_return_weighted_yearly_bal_info <- daily_B_l_return_weighted_yearly_bal_info <- daily_s_H_return_weighted_yearly_bal_info <- daily_s_l_return_weighted_yearly_bal_info <- daily_pattern

#------------------------ Sem nenhum rebalanceamento ---------------------------

  
  stock_prices_B_H <- daily_return(stock_prices, groups_anual[[1]]$data$B_H)
  stock_prices_B_l <- daily_return(stock_prices, groups_anual[[1]]$data$B_l) 
  stock_prices_s_H <- daily_return(stock_prices, groups_anual[[1]]$data$s_H) 
  stock_prices_s_l <- daily_return(stock_prices,groups_anual[[1]]$data$s_l)
  
  cl <- makeCluster(5)
  registerDoParallel(cl)
  
  results <- foreach(i = 2018:2024, .packages = c("tidyverse")) %dopar% {
    local_stock_prices_B_H_info <- daily_return(stock_prices, groups_anual_info[[1]]$data$B_H, i, TRUE)
    local_stock_prices_B_l_info <- daily_return(stock_prices, groups_anual_info[[1]]$data$B_l, i, TRUE) 
    local_stock_prices_s_H_info <- daily_return(stock_prices, groups_anual_info[[1]]$data$s_H, i, TRUE) 
    local_stock_prices_s_l_info <- daily_return(stock_prices, groups_anual_info[[1]]$data$s_l, i, TRUE)
    
    
    
    local_stocks_anual_return <- bind_rows(anual_return(stock_prices_B_H),
                                           anual_return(stock_prices_B_l),
                                           anual_return(stock_prices_s_H),
                                           anual_return(stock_prices_s_l)) %>% distinct()
    
    local_stocks_anual_return_info <- bind_rows(anual_return(local_stock_prices_B_H_info, TRUE),
                                                anual_return(local_stock_prices_B_l_info, TRUE),
                                                anual_return(local_stock_prices_s_H_info, TRUE),
                                                anual_return(local_stock_prices_s_l_info, TRUE)) %>% distinct()
    
    
    #NOVA METODOLOGIA DE CÁLCULO
    local_daily_B_H_return_weighted <- portifolio_daily_return_general(groups_anual[[1]]$data$B_H, stock_prices_B_H, i, TRUE)
    local_daily_B_l_return_weighted <- portifolio_daily_return_general(groups_anual[[1]]$data$B_l, stock_prices_B_l, i, TRUE)
    local_daily_s_H_return_weighted <- portifolio_daily_return_general(groups_anual[[1]]$data$s_H, stock_prices_s_H, i, TRUE)
    local_daily_s_l_return_weighted <- portifolio_daily_return_general(groups_anual[[1]]$data$s_l, stock_prices_s_l, i, TRUE)
    
    local_daily_B_H_return_weighted_info <- portifolio_daily_return_general(groups_anual_info[[1]]$data$B_H, local_stock_prices_B_H_info, i, TRUE)
    local_daily_B_l_return_weighted_info <- portifolio_daily_return_general(groups_anual_info[[1]]$data$B_l, local_stock_prices_B_l_info, i, TRUE)
    local_daily_s_H_return_weighted_info <- portifolio_daily_return_general(groups_anual_info[[1]]$data$s_H, local_stock_prices_s_H_info, i, TRUE)
    local_daily_s_l_return_weighted_info <- portifolio_daily_return_general(groups_anual_info[[1]]$data$s_l, local_stock_prices_s_l_info, i, TRUE)
    
    local_daily_B_H_return_weighted_yearly <- portifolio_anual_return_new(local_daily_B_H_return_weighted, groups_anual[[1]]$data$B_H, stock_prices_B_H, i, ibov_returns_anual, selic_return_annual, TRUE)
    local_daily_B_l_return_weighted_yearly <- portifolio_anual_return_new(local_daily_B_l_return_weighted, groups_anual[[1]]$data$B_l, stock_prices_B_l, i, ibov_returns_anual, selic_return_annual, TRUE)
    local_daily_s_H_return_weighted_yearly <- portifolio_anual_return_new(local_daily_s_H_return_weighted, groups_anual[[1]]$data$s_H, stock_prices_s_H, i, ibov_returns_anual, selic_return_annual, TRUE)
    local_daily_s_l_return_weighted_yearly <- portifolio_anual_return_new(local_daily_s_l_return_weighted, groups_anual[[1]]$data$s_l, stock_prices_s_l, i, ibov_returns_anual, selic_return_annual, TRUE)
    
    local_daily_B_H_return_weighted_yearly_info <- portifolio_anual_return_new(local_daily_B_H_return_weighted_info, groups_anual_info[[1]]$data$B_H, local_stock_prices_B_H_info, i, ibov_returns_anual_info, selic_return_annual_info, TRUE)
    local_daily_B_l_return_weighted_yearly_info <- portifolio_anual_return_new(local_daily_B_l_return_weighted_info, groups_anual_info[[1]]$data$B_l, local_stock_prices_B_l_info, i, ibov_returns_anual_info, selic_return_annual_info, TRUE)
    local_daily_s_H_return_weighted_yearly_info <- portifolio_anual_return_new(local_daily_s_H_return_weighted_info, groups_anual_info[[1]]$data$s_H, local_stock_prices_s_H_info, i, ibov_returns_anual_info, selic_return_annual_info, TRUE)
    local_daily_s_l_return_weighted_yearly_info <- portifolio_anual_return_new(local_daily_s_l_return_weighted_info, groups_anual_info[[1]]$data$s_l, local_stock_prices_s_l_info, i, ibov_returns_anual_info, selic_return_annual_info, TRUE)
    
    
    return(list(
      
      B_H_daily = local_daily_B_H_return_weighted,
      B_l_daily = local_daily_B_l_return_weighted,
      s_H_daily = local_daily_s_H_return_weighted,
      s_l_daily = local_daily_s_l_return_weighted,
      B_H_daily_info = local_daily_B_H_return_weighted_info,
      B_l_daily_info = local_daily_B_l_return_weighted_info,
      s_H_daily_info = local_daily_s_H_return_weighted_info,
      s_l_daily_info = local_daily_s_l_return_weighted_info,
      
      B_H_yearly = local_daily_B_H_return_weighted_yearly,
      B_l_yearly = local_daily_B_l_return_weighted_yearly,
      s_H_yearly = local_daily_s_H_return_weighted_yearly,
      s_l_yearly = local_daily_s_l_return_weighted_yearly,
      B_H_yearly_info = local_daily_B_H_return_weighted_yearly_info,
      B_l_yearly_info = local_daily_B_l_return_weighted_yearly_info,
      s_H_yearly_info = local_daily_s_H_return_weighted_yearly_info,
      s_l_yearly_info = local_daily_s_l_return_weighted_yearly_info
    ))
  }
  
  
  # Combine results from all iterations
  for (res in results) {
    
    daily_B_H_return_weighted$daily_returns <- bind_rows(daily_B_H_return_weighted$daily_returns, res$B_H_daily)
    daily_B_l_return_weighted$daily_returns <- bind_rows(daily_B_l_return_weighted$daily_returns, res$B_l_daily)
    daily_s_H_return_weighted$daily_returns <- bind_rows(daily_s_H_return_weighted$daily_returns, res$s_H_daily)
    daily_s_l_return_weighted$daily_returns <- bind_rows(daily_s_l_return_weighted$daily_returns, res$s_l_daily)
    
    daily_B_H_return_weighted_info$daily_returns <- bind_rows(daily_B_H_return_weighted_info$daily_returns, res$B_H_daily_info)
    daily_B_l_return_weighted_info$daily_returns <- bind_rows(daily_B_l_return_weighted_info$daily_returns, res$B_l_daily_info)
    daily_s_H_return_weighted_info$daily_returns <- bind_rows(daily_s_H_return_weighted_info$daily_returns, res$s_H_daily_info)
    daily_s_l_return_weighted_info$daily_returns <- bind_rows(daily_s_l_return_weighted_info$daily_returns, res$s_l_daily_info)
    
    daily_B_H_return_weighted$annual_returns <- bind_rows(daily_B_H_return_weighted$annual_returns, res$B_H_yearly)
    daily_B_l_return_weighted$annual_returns <- bind_rows(daily_B_l_return_weighted$annual_returns, res$B_l_yearly)
    daily_s_H_return_weighted$annual_returns <- bind_rows(daily_s_H_return_weighted$annual_returns, res$s_H_yearly)
    daily_s_l_return_weighted$annual_returns <- bind_rows(daily_s_l_return_weighted$annual_returns, res$s_l_yearly)
    
    daily_B_H_return_weighted_info$annual_returns <- bind_rows(daily_B_H_return_weighted_info$annual_returns, res$B_H_yearly_info)
    daily_B_l_return_weighted_info$annual_returns <- bind_rows(daily_B_l_return_weighted_info$annual_returns, res$B_l_yearly_info)
    daily_s_H_return_weighted_info$annual_returns <- bind_rows(daily_s_H_return_weighted_info$annual_returns, res$s_H_yearly_info)
    daily_s_l_return_weighted_info$annual_returns <- bind_rows(daily_s_l_return_weighted_info$annual_returns, res$s_l_yearly_info)
  }
  
  stopCluster(cl)
  rm(results) 


#------------  Com rebalanceamento anual tanto para o conjunto de ativos quanto para o peso de cada um na carteira ---------------


  cl <- makeCluster(5)
  registerDoParallel(cl)
  
  results <- foreach(i = 2018:2024, .packages = c("tidyverse")) %dopar% {
    y = i - 2017
    
    stock_prices_B_H <- daily_return(stock_prices, groups_anual[[y]]$data$B_H)
    stock_prices_B_l <- daily_return(stock_prices, groups_anual[[y]]$data$B_l) 
    stock_prices_s_H <- daily_return(stock_prices, groups_anual[[y]]$data$s_H) 
    stock_prices_s_l <- daily_return(stock_prices,groups_anual[[y]]$data$s_l)
    
    local_stock_prices_B_H_info <- daily_return(stock_prices, groups_anual_info[[y]]$data$B_H, i, TRUE)
    local_stock_prices_B_l_info <- daily_return(stock_prices, groups_anual_info[[y]]$data$B_l, i, TRUE) 
    local_stock_prices_s_H_info <- daily_return(stock_prices, groups_anual_info[[y]]$data$s_H, i, TRUE) 
    local_stock_prices_s_l_info <- daily_return(stock_prices, groups_anual_info[[y]]$data$s_l, i, TRUE)
    
    
    
    local_stocks_anual_return <- bind_rows(anual_return(stock_prices_B_H),
                                           anual_return(stock_prices_B_l),
                                           anual_return(stock_prices_s_H),
                                           anual_return(stock_prices_s_l)) %>% distinct()
    
    local_stocks_anual_return_info <- bind_rows(anual_return(local_stock_prices_B_H_info, TRUE),
                                                anual_return(local_stock_prices_B_l_info, TRUE),
                                                anual_return(local_stock_prices_s_H_info, TRUE),
                                                anual_return(local_stock_prices_s_l_info, TRUE)) %>% distinct()
    
    #NOVA METODOLOGIA DE CÁLCULO
    local_daily_B_H_return_weighted_yearly_bal <- portifolio_daily_return_general(groups_anual[[y]]$data$B_H, stock_prices_B_H, i, TRUE)
    local_daily_B_l_return_weighted_yearly_bal <- portifolio_daily_return_general(groups_anual[[y]]$data$B_l, stock_prices_B_l, i, TRUE)
    local_daily_s_H_return_weighted_yearly_bal <- portifolio_daily_return_general(groups_anual[[y]]$data$s_H, stock_prices_s_H, i, TRUE)
    local_daily_s_l_return_weighted_yearly_bal <- portifolio_daily_return_general(groups_anual[[y]]$data$s_l, stock_prices_s_l, i, TRUE)
    
    local_daily_B_H_return_weighted_yearly_bal_info <- portifolio_daily_return_general(groups_anual_info[[y]]$data$B_H, local_stock_prices_B_H_info, i, TRUE)
    local_daily_B_l_return_weighted_yearly_bal_info <- portifolio_daily_return_general(groups_anual_info[[y]]$data$B_l, local_stock_prices_B_l_info, i, TRUE)
    local_daily_s_H_return_weighted_yearly_bal_info <- portifolio_daily_return_general(groups_anual_info[[y]]$data$s_H, local_stock_prices_s_H_info, i, TRUE)
    local_daily_s_l_return_weighted_yearly_bal_info <- portifolio_daily_return_general(groups_anual_info[[y]]$data$s_l, local_stock_prices_s_l_info, i, TRUE)
    
    local_daily_B_H_return_weighted_yearly_yearly_bal <- portifolio_anual_return_new(local_daily_B_H_return_weighted_yearly_bal, groups_anual[[y]]$data$B_H, stock_prices_B_H, i, ibov_returns_anual, selic_return_annual, TRUE)
    local_daily_B_l_return_weighted_yearly_yearly_bal <- portifolio_anual_return_new(local_daily_B_l_return_weighted_yearly_bal, groups_anual[[y]]$data$B_l, stock_prices_B_l, i, ibov_returns_anual, selic_return_annual, TRUE)
    local_daily_s_H_return_weighted_yearly_yearly_bal <- portifolio_anual_return_new(local_daily_s_H_return_weighted_yearly_bal, groups_anual[[y]]$data$s_H, stock_prices_s_H, i, ibov_returns_anual, selic_return_annual, TRUE)
    local_daily_s_l_return_weighted_yearly_yearly_bal <- portifolio_anual_return_new(local_daily_s_l_return_weighted_yearly_bal, groups_anual[[y]]$data$s_l, stock_prices_s_l, i, ibov_returns_anual, selic_return_annual, TRUE)
    
    local_daily_B_H_return_weighted_yearly_yearly_bal_info <- portifolio_anual_return_new(local_daily_B_H_return_weighted_yearly_bal_info, groups_anual_info[[y]]$data$B_H, local_stock_prices_B_H_info, i, ibov_returns_anual_info, selic_return_annual, TRUE)
    local_daily_B_l_return_weighted_yearly_yearly_bal_info <- portifolio_anual_return_new(local_daily_B_l_return_weighted_yearly_bal_info, groups_anual_info[[y]]$data$B_l, local_stock_prices_B_l_info, i, ibov_returns_anual_info, selic_return_annual, TRUE)
    local_daily_s_H_return_weighted_yearly_yearly_bal_info <- portifolio_anual_return_new(local_daily_s_H_return_weighted_yearly_bal_info, groups_anual_info[[y]]$data$s_H, local_stock_prices_s_H_info, i, ibov_returns_anual_info, selic_return_annual, TRUE)
    local_daily_s_l_return_weighted_yearly_yearly_bal_info <- portifolio_anual_return_new(local_daily_s_l_return_weighted_yearly_bal_info, groups_anual_info[[y]]$data$s_l, local_stock_prices_s_l_info, i, ibov_returns_anual_info, selic_return_annual, TRUE)
    
    
    return(list(
      
      B_H_daily = local_daily_B_H_return_weighted_yearly_bal,
      B_l_daily = local_daily_B_l_return_weighted_yearly_bal,
      s_H_daily = local_daily_s_H_return_weighted_yearly_bal,
      s_l_daily = local_daily_s_l_return_weighted_yearly_bal,
      B_H_daily_info = local_daily_B_H_return_weighted_yearly_bal_info,
      B_l_daily_info = local_daily_B_l_return_weighted_yearly_bal_info,
      s_H_daily_info = local_daily_s_H_return_weighted_yearly_bal_info,
      s_l_daily_info = local_daily_s_l_return_weighted_yearly_bal_info,
      
      B_H_yearly = local_daily_B_H_return_weighted_yearly_yearly_bal,
      B_l_yearly = local_daily_B_l_return_weighted_yearly_yearly_bal,
      s_H_yearly = local_daily_s_H_return_weighted_yearly_yearly_bal,
      s_l_yearly = local_daily_s_l_return_weighted_yearly_yearly_bal,
      B_H_yearly_info = local_daily_B_H_return_weighted_yearly_yearly_bal_info,
      B_l_yearly_info = local_daily_B_l_return_weighted_yearly_yearly_bal_info,
      s_H_yearly_info = local_daily_s_H_return_weighted_yearly_yearly_bal_info,
      s_l_yearly_info = local_daily_s_l_return_weighted_yearly_yearly_bal_info
    ))
  }
  
  # Combine results from all iterations
  for (res in results) {
    
    daily_B_H_return_weighted_yearly_bal$daily_returns <- bind_rows(daily_B_H_return_weighted_yearly_bal$daily_returns, res$B_H_daily)
    daily_B_l_return_weighted_yearly_bal$daily_returns <- bind_rows(daily_B_l_return_weighted_yearly_bal$daily_returns, res$B_l_daily)
    daily_s_H_return_weighted_yearly_bal$daily_returns <- bind_rows(daily_s_H_return_weighted_yearly_bal$daily_returns, res$s_H_daily)
    daily_s_l_return_weighted_yearly_bal$daily_returns <- bind_rows(daily_s_l_return_weighted_yearly_bal$daily_returns, res$s_l_daily)
    
    daily_B_H_return_weighted_yearly_bal_info$daily_returns <- bind_rows(daily_B_H_return_weighted_yearly_bal_info$daily_returns, res$B_H_daily_info)
    daily_B_l_return_weighted_yearly_bal_info$daily_returns <- bind_rows(daily_B_l_return_weighted_yearly_bal_info$daily_returns, res$B_l_daily_info)
    daily_s_H_return_weighted_yearly_bal_info$daily_returns <- bind_rows(daily_s_H_return_weighted_yearly_bal_info$daily_returns, res$s_H_daily_info)
    daily_s_l_return_weighted_yearly_bal_info$daily_returns <- bind_rows(daily_s_l_return_weighted_yearly_bal_info$daily_returns, res$s_l_daily_info)
    
    daily_B_H_return_weighted_yearly_bal$annual_returns <- bind_rows(daily_B_H_return_weighted_yearly_bal$annual_returns, res$B_H_yearly)
    daily_B_l_return_weighted_yearly_bal$annual_returns <- bind_rows(daily_B_l_return_weighted_yearly_bal$annual_returns, res$B_l_yearly)
    daily_s_H_return_weighted_yearly_bal$annual_returns <- bind_rows(daily_s_H_return_weighted_yearly_bal$annual_returns, res$s_H_yearly)
    daily_s_l_return_weighted_yearly_bal$annual_returns <- bind_rows(daily_s_l_return_weighted_yearly_bal$annual_returns, res$s_l_yearly)
    
    daily_B_H_return_weighted_yearly_bal_info$annual_returns <- bind_rows(daily_B_H_return_weighted_yearly_bal_info$annual_returns, res$B_H_yearly_info)
    daily_B_l_return_weighted_yearly_bal_info$annual_returns <- bind_rows(daily_B_l_return_weighted_yearly_bal_info$annual_returns, res$B_l_yearly_info)
    daily_s_H_return_weighted_yearly_bal_info$annual_returns <- bind_rows(daily_s_H_return_weighted_yearly_bal_info$annual_returns, res$s_H_yearly_info)
    daily_s_l_return_weighted_yearly_bal_info$annual_returns <- bind_rows(daily_s_l_return_weighted_yearly_bal_info$annual_returns, res$s_l_yearly_info)
    
  }
  
  stopCluster(cl)
  rm(results) 