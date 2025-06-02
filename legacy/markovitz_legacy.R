
#----------------- Em sequencia balanceamento anual -----------------------------

i = 0
for(i in 2018:2022) {
  local_ibov_returns_annual <- ibov_returns_anual %>% filter(Ano == i)
  local_ibov_returns_annual_info <- ibov_returns_anual_info %>% filter(Ano == i)
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
  
  most_efficient_B_H_annual_yearly_bal_portifolio <- frontier_B_H_annual_yearly_bal %>%
    mutate(simplified_sharp_ratio = return / risk) %>%
    filter(simplified_sharp_ratio == max(simplified_sharp_ratio))
  
  most_efficient_B_l_annual_yearly_bal_portifolio <- frontier_B_l_annual_yearly_bal %>%
    mutate(simplified_sharp_ratio = return / risk) %>%
    filter(simplified_sharp_ratio == max(simplified_sharp_ratio))
  
  most_efficient_s_H_annual_yearly_bal_portifolio <- frontier_s_H_annual_yearly_bal %>%
    mutate(simplified_sharp_ratio = return / risk) %>%
    filter(simplified_sharp_ratio == max(simplified_sharp_ratio))
  
  most_efficient_s_l_annual_yearly_bal_portifolio <- frontier_s_l_annual_yearly_bal %>%
    mutate(simplified_sharp_ratio = return / risk) %>%
    filter(simplified_sharp_ratio == max(simplified_sharp_ratio))
  
  most_efficient_B_H_annual_yearly_bal_portifolio_info <- frontier_B_H_annual_yearly_bal_info %>%
    mutate(simplified_sharp_ratio = return / risk) %>%
    filter(simplified_sharp_ratio == max(simplified_sharp_ratio))
  
  most_efficient_B_l_annual_yearly_bal_portifolio_info <- frontier_B_l_annual_yearly_bal_info %>%
    mutate(simplified_sharp_ratio = return / risk) %>%
    filter(simplified_sharp_ratio == max(simplified_sharp_ratio))
  
  most_efficient_s_H_annual_yearly_bal_portifolio_info <- frontier_s_H_annual_yearly_bal_info %>%
    mutate(simplified_sharp_ratio = return / risk) %>%
    filter(simplified_sharp_ratio == max(simplified_sharp_ratio))
  
  most_efficient_s_l_annual_yearly_bal_portifolio_info <- frontier_s_l_annual_yearly_bal_info %>%
    mutate(simplified_sharp_ratio = return / risk) %>%
    filter(simplified_sharp_ratio == max(simplified_sharp_ratio))
  
  
  B_H_return_markovitz_yearly_bal <- bind_rows(
    B_H_return_markovitz_yearly_bal,
    portifolio_annual_return_markovitz(most_efficient_B_H_annual_yearly_bal_portifolio, stock_prices_annual_return, stock_prices_B_H, i, local_ibov_returns_annual)
  )
  
  B_l_return_markovitz_yearly_bal <- bind_rows(
    B_l_return_markovitz_yearly_bal,
    portifolio_annual_return_markovitz(most_efficient_B_l_annual_yearly_bal_portifolio, stock_prices_annual_return, stock_prices_B_l, i, local_ibov_returns_annual)
  )
  
  s_H_return_markovitz_yearly_bal <- bind_rows(
    s_H_return_markovitz_yearly_bal,
    portifolio_annual_return_markovitz(most_efficient_s_H_annual_yearly_bal_portifolio, stock_prices_annual_return, stock_prices_s_H, i, local_ibov_returns_annual)
  )
  
  s_l_return_markovitz_yearly_bal <- bind_rows(
    s_l_return_markovitz_yearly_bal,
    portifolio_annual_return_markovitz(most_efficient_s_l_annual_yearly_bal_portifolio, stock_prices_annual_return, stock_prices_s_l, i, local_ibov_returns_annual)
  )
  
  
  B_H_return_markovitz_yearly_bal_info <- bind_rows(
    B_H_return_markovitz_yearly_bal_info,
    portifolio_annual_return_markovitz(most_efficient_B_H_annual_yearly_bal_portifolio_info, stock_prices_annual_return_info, stock_prices_B_H_info, i, local_ibov_returns_annual_info)
  )
  
  B_l_return_markovitz_yearly_bal_info <- bind_rows(
    B_l_return_markovitz_yearly_bal_info,
    portifolio_annual_return_markovitz(most_efficient_B_l_annual_yearly_bal_portifolio_info, stock_prices_annual_return_info, stock_prices_B_l_info, i, local_ibov_returns_annual_info)
  )
  
  s_H_return_markovitz_yearly_bal_info <- bind_rows(
    s_H_return_markovitz_yearly_bal_info,
    portifolio_annual_return_markovitz(most_efficient_s_H_annual_yearly_bal_portifolio_info, stock_prices_annual_return_info, stock_prices_s_H_info, i, local_ibov_returns_annual_info)
  )
  
  s_l_return_markovitz_yearly_bal_info <- bind_rows(
    s_l_return_markovitz_yearly_bal_info,
    portifolio_annual_return_markovitz(most_efficient_s_l_annual_yearly_bal_portifolio_info, stock_prices_annual_return_info, stock_prices_s_l_info, i, local_ibov_returns_annual_info)
  )
}



#-------------------- Balanceado trimestralmente ----------------------------------------
i = 0
for(i in 2018:2022) {
  y=0
  for(y in 1:4) {
    index = (i-2018)*4+y
    if(index > 19){
      break # Os dados acaban aqui
    }
    local_ibov_returns_tri <- ibov_returns_tri %>% filter(Ano == i, trimestre == y)
    
    stock_prices_B_H <- daily_return_markovitz(stock_prices_markovitz, groups_tri[[index]]$data$B_H, i, FALSE, TRUE, y, 2013)
    stock_prices_B_l <- daily_return_markovitz(stock_prices_markovitz, groups_tri[[index]]$data$B_l, i, FALSE, TRUE, y, 2013) 
    stock_prices_s_H <- daily_return_markovitz(stock_prices_markovitz, groups_tri[[index]]$data$s_H, i, FALSE, TRUE, y, 2013) 
    stock_prices_s_l <- daily_return_markovitz(stock_prices_markovitz, groups_tri[[index]]$data$s_l, i, FALSE, TRUE, y, 2013)
    
    stock_prices_tri_return <- tibble()
    stock_prices_tri_return <- bind_rows(individual_stock_tri_return(stock_prices_B_H, 2013, i, y),
                                         individual_stock_tri_return(stock_prices_B_l, 2013, i, y),
                                         individual_stock_tri_return(stock_prices_s_H, 2013, i, y),
                                         individual_stock_tri_return(stock_prices_s_l, 2013, i, y)) %>% distinct()
    
    B_H_pre_calc <- pre_calc_efficient_frontier(stock_prices_B_H, groups_anual[[y]]$data$B_H, i, TRUE, y)
    B_l_pre_calc <- pre_calc_efficient_frontier(stock_prices_B_l, groups_anual[[y]]$data$B_l, i, TRUE, y)
    s_H_pre_calc <- pre_calc_efficient_frontier(stock_prices_s_H, groups_anual[[y]]$data$s_H, i, TRUE, y)
    s_l_pre_calc <- pre_calc_efficient_frontier(stock_prices_s_l, groups_anual[[y]]$data$s_l, i, TRUE, y)
    
    
    
    frontier_B_H_tri_bal <- efficient_frontier(
      B_H_pre_calc[[2]], B_H_pre_calc[[1]], colnames(B_H_pre_calc[[2]]), length(B_H_pre_calc[[1]]$return)
    )
    
    frontier_B_l_tri_bal <- efficient_frontier(
      B_l_pre_calc[[2]], B_l_pre_calc[[1]], colnames(B_l_pre_calc[[2]]), length(B_l_pre_calc[[1]]$return)
    )
    frontier_s_H_tri_bal <- efficient_frontier(
      s_H_pre_calc[[2]], s_H_pre_calc[[1]], colnames(s_H_pre_calc[[2]]), length(s_H_pre_calc[[1]]$return)
    )
    frontier_s_l_tri_bal <- efficient_frontier(
      s_l_pre_calc[[2]], s_l_pre_calc[[1]], colnames(s_l_pre_calc[[2]]), length(s_l_pre_calc[[1]]$return)
    )
    
    most_efficient_B_H_tri_bal_portifolio <- frontier_B_H_tri_bal %>%
      mutate(simplified_sharp_ratio = return / risk) %>%
      filter(simplified_sharp_ratio == max(simplified_sharp_ratio))
    
    most_efficient_B_l_tri_bal_portifolio <- frontier_B_l_tri_bal %>%
      mutate(simplified_sharp_ratio = return / risk) %>%
      filter(simplified_sharp_ratio == max(simplified_sharp_ratio))
    
    most_efficient_s_H_tri_bal_portifolio <- frontier_s_H_tri_bal %>%
      mutate(simplified_sharp_ratio = return / risk) %>%
      filter(simplified_sharp_ratio == max(simplified_sharp_ratio))
    
    most_efficient_s_l_tri_bal_portifolio <- frontier_s_l_tri_bal %>%
      mutate(simplified_sharp_ratio = return / risk) %>%
      filter(simplified_sharp_ratio == max(simplified_sharp_ratio))
    
    
    B_H_return_markovitz_tri_bal <- bind_rows(
      B_H_return_markovitz_tri_bal,
      portifolio_tri_return_markovitz(most_efficient_B_H_tri_bal_portifolio, stock_prices_tri_return, stock_prices_B_H, i, y, local_ibov_returns_tri)
    )
    
    B_l_return_markovitz_tri_bal <- bind_rows(
      B_l_return_markovitz_tri_bal,
      portifolio_tri_return_markovitz(most_efficient_B_l_tri_bal_portifolio, stock_prices_tri_return, stock_prices_B_l, i, y, local_ibov_returns_tri)
    )
    
    s_H_return_markovitz_tri_bal <- bind_rows(
      s_H_return_markovitz_tri_bal,
      portifolio_tri_return_markovitz(most_efficient_s_H_tri_bal_portifolio, stock_prices_tri_return, stock_prices_s_H, i, y, local_ibov_returns_tri)
    )
    
    s_l_return_markovitz_tri_bal <- bind_rows(
      s_l_return_markovitz_tri_bal,
      portifolio_tri_return_markovitz(most_efficient_s_l_tri_bal_portifolio, stock_prices_tri_return, stock_prices_s_l, i, y, local_ibov_returns_tri)
    )
    
    
    if(y != 4){
      local_ibov_returns_tri_info <- ibov_returns_tri_info %>% filter(Ano == i, trimestre == y)
      
      stock_prices_B_H_info <- daily_return_markovitz(stock_prices_markovitz, groups_tri_info[[index]]$data$B_H, i, TRUE, TRUE, y, 2013)
      stock_prices_B_l_info <- daily_return_markovitz(stock_prices_markovitz, groups_tri_info[[index]]$data$B_l, i, TRUE, TRUE, y, 2013) 
      stock_prices_s_H_info <- daily_return_markovitz(stock_prices_markovitz, groups_tri_info[[index]]$data$s_H, i, TRUE, TRUE, y, 2013) 
      stock_prices_s_l_info <- daily_return_markovitz(stock_prices_markovitz, groups_tri_info[[index]]$data$s_l, i, TRUE, TRUE, y, 2013)
      
      stock_prices_tri_return_info <- tibble()
      stock_prices_tri_return_info <- bind_rows(individual_stock_tri_return(stock_prices_B_H_info, 2013, i, y),
                                                individual_stock_tri_return(stock_prices_B_l_info, 2013, i, y),
                                                individual_stock_tri_return(stock_prices_s_H_info, 2013, i, y),
                                                individual_stock_tri_return(stock_prices_s_l_info, 2013, i, y)) %>% distinct()
      
      B_H_pre_calc_info <- pre_calc_efficient_frontier(stock_prices_B_H_info, groups_anual_info[[y]]$data$B_H, i, TRUE, y)
      B_l_pre_calc_info <- pre_calc_efficient_frontier(stock_prices_B_l_info, groups_anual_info[[y]]$data$B_l, i, TRUE, y)
      s_H_pre_calc_info <- pre_calc_efficient_frontier(stock_prices_s_H_info, groups_anual_info[[y]]$data$s_H, i, TRUE, y)
      s_l_pre_calc_info <- pre_calc_efficient_frontier(stock_prices_s_l_info, groups_anual_info[[y]]$data$s_l, i, TRUE, y)
      
      
      
      frontier_B_H_tri_bal_info <- efficient_frontier(
        B_H_pre_calc_info[[2]], B_H_pre_calc_info[[1]], colnames(B_H_pre_calc_info[[2]]), length(B_H_pre_calc_info[[1]]$return)
      )
      frontier_B_l_tri_bal_info <- efficient_frontier(
        B_l_pre_calc_info[[2]], B_l_pre_calc_info[[1]], colnames(B_l_pre_calc_info[[2]]), length(B_l_pre_calc_info[[1]]$return)
      )
      frontier_s_H_tri_bal_info <- efficient_frontier(
        s_H_pre_calc_info[[2]], s_H_pre_calc_info[[1]], colnames(s_H_pre_calc_info[[2]]), length(s_H_pre_calc_info[[1]]$return)
      )
      frontier_s_l_tri_bal_info <- efficient_frontier(
        s_l_pre_calc_info[[2]], s_l_pre_calc_info[[1]], colnames(s_l_pre_calc_info[[2]]), length(s_l_pre_calc_info[[1]]$return)
      )
      
      
      most_efficient_B_H_tri_bal_portifolio_info <- frontier_B_H_tri_bal_info %>%
        mutate(simplified_sharp_ratio = return / risk) %>%
        filter(simplified_sharp_ratio == max(simplified_sharp_ratio))
      
      most_efficient_B_l_tri_bal_portifolio_info <- frontier_B_l_tri_bal_info %>%
        mutate(simplified_sharp_ratio = return / risk) %>%
        filter(simplified_sharp_ratio == max(simplified_sharp_ratio))
      
      most_efficient_s_H_tri_bal_portifolio_info <- frontier_s_H_tri_bal_info %>%
        mutate(simplified_sharp_ratio = return / risk) %>%
        filter(simplified_sharp_ratio == max(simplified_sharp_ratio))
      
      most_efficient_s_l_tri_bal_portifolio_info <- frontier_s_l_tri_bal_info %>%
        mutate(simplified_sharp_ratio = return / risk) %>%
        filter(simplified_sharp_ratio == max(simplified_sharp_ratio))
      
      B_H_return_markovitz_tri_bal_info <- bind_rows(
        B_H_return_markovitz_tri_bal_info,
        portifolio_tri_return_markovitz(most_efficient_B_H_tri_bal_portifolio_info, stock_prices_tri_return_info, stock_prices_B_H_info, i, y, local_ibov_returns_tri_info)
      )
      
      B_l_return_markovitz_tri_bal_info <- bind_rows(
        B_l_return_markovitz_tri_bal_info,
        portifolio_tri_return_markovitz(most_efficient_B_l_tri_bal_portifolio_info, stock_prices_tri_return_info, stock_prices_B_l_info, i, y, local_ibov_returns_tri_info)
      )
      
      s_H_return_markovitz_tri_bal_info <- bind_rows(
        s_H_return_markovitz_tri_bal_info,
        portifolio_tri_return_markovitz(most_efficient_s_H_tri_bal_portifolio_info, stock_prices_tri_return_info, stock_prices_s_H_info, i, y, local_ibov_returns_tri_info)
      )
      
      s_l_return_markovitz_tri_bal_info <- bind_rows(
        s_l_return_markovitz_tri_bal_info,
        portifolio_tri_return_markovitz(most_efficient_s_l_tri_bal_portifolio_info, stock_prices_tri_return_info, stock_prices_s_l_info, i, y, local_ibov_returns_tri_info)
      )
    }
  }
}