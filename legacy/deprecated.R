#Foi otimizado para ser feito em paralelo
#Com paralelismo melhrou de 17 segundos para 7.5 segundos
stime <- system.time({ 
  for(i in 2018:2022){
    print(i)
    #Não leva em conta o aspecto informacional
    B_H_return <- add_row(B_H_return, portifolio_anual_return(stocks_anual_return, groups_anual[[1]]$data$B_H, stock_prices_B_H, i))
    B_l_return <- add_row(B_l_return, portifolio_anual_return(stocks_anual_return, groups_anual[[1]]$data$B_l, stock_prices_B_l, i))
    s_H_return <- add_row(s_H_return, portifolio_anual_return(stocks_anual_return, groups_anual[[1]]$data$s_H, stock_prices_s_H, i))
    s_l_return <- add_row(s_l_return, portifolio_anual_return(stocks_anual_return, groups_anual[[1]]$data$s_l, stock_prices_s_l, i))
    
    #Leva em conta o aspecto informacional
    B_H_return_info <- add_row(B_H_return_info, portifolio_anual_return(stocks_anual_return_info, groups_anual_info[[1]]$data$B_H, stock_prices_B_H_info, i))
    B_l_return_info <- add_row(B_l_return_info, portifolio_anual_return(stocks_anual_return_info, groups_anual_info[[1]]$data$B_l, stock_prices_B_l_info, i))
    s_H_return_info <- add_row(s_H_return_info, portifolio_anual_return(stocks_anual_return_info, groups_anual_info[[1]]$data$s_H, stock_prices_s_H_info, i))
    s_l_return_info <- add_row(s_l_return_info, portifolio_anual_return(stocks_anual_return_info, groups_anual_info[[1]]$data$s_l, stock_prices_s_l_info, i))
  }})


#Com paralelismo melhrou de 28 segundos para 12 segundos
stime <- system.time({ 
for(i in 2018:2022){
  y = i - 2017
  
  #Não leva em conta o aspecto informacional para o cálculo do retorno diário
  stock_prices_B_H <- daily_return(stock_prices, groups_anual[[y]]$data$B_H)
  stock_prices_B_l <- daily_return(stock_prices, groups_anual[[y]]$data$B_l) 
  stock_prices_s_H <- daily_return(stock_prices, groups_anual[[y]]$data$s_H) 
  stock_prices_s_l <- daily_return(stock_prices, groups_anual[[y]]$data$s_l)
  
  #Leva em conta o aspecto informacional  para o cálculo do retorno diário
  stock_prices_B_H_info <- daily_return(stock_prices, groups_anual_info[[y]]$data$B_H, TRUE)
  stock_prices_B_l_info <- daily_return(stock_prices, groups_anual_info[[y]]$data$B_l, TRUE) 
  stock_prices_s_H_info <- daily_return(stock_prices, groups_anual_info[[y]]$data$s_H, TRUE) 
  stock_prices_s_l_info <- daily_return(stock_prices, groups_anual_info[[y]]$data$s_l, TRUE)
  
  
  stocks_anual_return <- bind_rows(anual_return(stock_prices_B_H),
                                   anual_return(stock_prices_B_l),
                                   anual_return(stock_prices_s_H),
                                   anual_return(stock_prices_s_l)) %>% distinct()
  
  stocks_anual_return_info <- bind_rows(anual_return(stock_prices_B_H_info, TRUE),
                                        anual_return(stock_prices_B_l_info, TRUE),
                                        anual_return(stock_prices_s_H_info, TRUE),
                                        anual_return(stock_prices_s_l_info, TRUE)) %>% distinct()
  
  B_H_return_yearly_bal <- add_row(B_H_return_yearly_bal, 
                                   portifolio_anual_return(stocks_anual_return, groups_anual[[y]]$data$B_H, stock_prices_B_H, i))
  
  B_l_return_yearly_bal <- add_row(B_l_return_yearly_bal, 
                                   portifolio_anual_return(stocks_anual_return, groups_anual[[y]]$data$B_l, stock_prices_B_l, i))
  
  s_H_return_yearly_bal <- add_row(s_H_return_yearly_bal, 
                                   portifolio_anual_return(stocks_anual_return, groups_anual[[y]]$data$s_H, stock_prices_s_H, i))
  
  s_l_return_yearly_bal <- add_row(s_l_return_yearly_bal, 
                                   portifolio_anual_return(stocks_anual_return, groups_anual[[y]]$data$s_l, stock_prices_s_l, i))
  
  B_H_return_yearly_bal_info <- add_row(B_H_return_yearly_bal_info, 
                                        portifolio_anual_return(stocks_anual_return_info, groups_anual_info[[y]]$data$B_H, stock_prices_B_H_info, i))
  B_l_return_yearly_bal_info <- add_row(B_l_return_yearly_bal_info, 
                                        portifolio_anual_return(stocks_anual_return_info, groups_anual_info[[y]]$data$B_l, stock_prices_B_l_info, i))
  s_H_return_yearly_bal_info <- add_row(s_H_return_yearly_bal_info, 
                                        portifolio_anual_return(stocks_anual_return_info, groups_anual_info[[y]]$data$s_H, stock_prices_s_H_info, i))
  s_l_return_yearly_bal_info <- add_row(s_l_return_yearly_bal_info, 
                                        portifolio_anual_return(stocks_anual_return_info, groups_anual_info[[y]]$data$s_l, stock_prices_s_l_info, i))
}})



#Trimestral não ponderado



stime <- system.time({ 

for(i in 2018:2022) {
  #Reaproveita a stock_prices sem info
  
  for(y in 1:4) {
    
    index = (i-2018)*4+y
    
    if(index > 19){
      break # Os dados acaban aqui
    }
    
    
    stock_prices_B_H <- daily_return(stock_prices, groups_tri[[index]]$data$B_H, i, FALSE, TRUE, y)
    stock_prices_B_l <- daily_return(stock_prices, groups_tri[[index]]$data$B_l, i, FALSE, TRUE, y) 
    stock_prices_s_H <- daily_return(stock_prices, groups_tri[[index]]$data$s_H, i, FALSE, TRUE, y) 
    stock_prices_s_l <- daily_return(stock_prices, groups_tri[[index]]$data$s_l, i, FALSE, TRUE, y)
    
    B_H_return_tri_bal <- add_row(B_H_return_tri_bal, portifolio_trimestral_return(groups_tri[[index]]$data$B_H, stock_prices_B_H, y))
    B_l_return_tri_bal <- add_row(B_l_return_tri_bal, portifolio_trimestral_return(groups_tri[[index]]$data$B_l, stock_prices_B_l, y))
    s_H_return_tri_bal <- add_row(s_H_return_tri_bal, portifolio_trimestral_return(groups_tri[[index]]$data$s_H, stock_prices_s_H, y))
    s_l_return_tri_bal <- add_row(s_l_return_tri_bal, portifolio_trimestral_return(groups_tri[[index]]$data$s_l, stock_prices_s_l, y))
    
    if(y != 4){
      #print(index)
      #Deve controlar o trimestre numa função chamada portifolio_trimestral_return
      stock_prices_B_H_info <- daily_return(stock_prices, groups_tri_info[[index]]$data$B_H, i, TRUE, TRUE, y)
      stock_prices_B_l_info <- daily_return(stock_prices, groups_tri_info[[index]]$data$B_l, i, TRUE, TRUE, y) 
      stock_prices_s_H_info <- daily_return(stock_prices, groups_tri_info[[index]]$data$s_H, i, TRUE, TRUE, y) 
      stock_prices_s_l_info <- daily_return(stock_prices, groups_tri_info[[index]]$data$s_l, i, TRUE, TRUE, y)
      
      B_H_return_tri_bal_info <- add_row(B_H_return_tri_bal_info, portifolio_trimestral_return(groups_tri_info[[index]]$data$B_H, stock_prices_B_H_info, y))
      B_l_return_tri_bal_info <- add_row(B_l_return_tri_bal_info, portifolio_trimestral_return(groups_tri_info[[index]]$data$B_l, stock_prices_B_l_info, y))
      s_H_return_tri_bal_info <- add_row(s_H_return_tri_bal_info, portifolio_trimestral_return(groups_tri_info[[index]]$data$s_H, stock_prices_s_H_info, y))
      s_l_return_tri_bal_info <- add_row(s_l_return_tri_bal_info, portifolio_trimestral_return(groups_tri_info[[index]]$data$s_l, stock_prices_s_l_info, y))
    }
    
  }
}




})







#-----------  Usando ponderação por valor de mercado ----------------------------------------------------


#------------------------ Sem nenhum rebalanceamento ---------------------------

stock_prices_B_H <- daily_return(stock_prices, groups_anual[[1]]$data$B_H)
stock_prices_B_l <- daily_return(stock_prices, groups_anual[[1]]$data$B_l) 
stock_prices_s_H <- daily_return(stock_prices, groups_anual[[1]]$data$s_H) 
stock_prices_s_l <- daily_return(stock_prices,groups_anual[[1]]$data$s_l)



for(i in 2018:2022){
  
  stock_prices_B_H_info <- daily_return(stock_prices, groups_anual_info[[1]]$data$B_H, i, TRUE)
  stock_prices_B_l_info <- daily_return(stock_prices, groups_anual_info[[1]]$data$B_l, i, TRUE) 
  stock_prices_s_H_info <- daily_return(stock_prices, groups_anual_info[[1]]$data$s_H, i, TRUE) 
  stock_prices_s_l_info <- daily_return(stock_prices, groups_anual_info[[1]]$data$s_l, i, TRUE)
  
  
  
  stocks_anual_return <- bind_rows(anual_return(stock_prices_B_H),
                                   anual_return(stock_prices_B_l),
                                   anual_return(stock_prices_s_H),
                                   anual_return(stock_prices_s_l)) %>% distinct()
  
  stocks_anual_return_info <- bind_rows(anual_return(stock_prices_B_H_info, TRUE),
                                        anual_return(stock_prices_B_l_info, TRUE),
                                        anual_return(stock_prices_s_H_info, TRUE),
                                        anual_return(stock_prices_s_l_info, TRUE)) %>% distinct()
  
  
  B_H_return_weighted <- add_row(B_H_return_weighted, 
                                 portifolio_anual_return_weighted(stocks_anual_return, groups_anual[[1]]$data$B_H, stock_prices_B_H, i)) 
  
  B_l_return_weighted <- add_row(B_l_return_weighted,
                                 portifolio_anual_return_weighted(stocks_anual_return, groups_anual[[1]]$data$B_l, stock_prices_B_l, i))
  
  s_H_return_weighted <- add_row(s_H_return_weighted,
                                 portifolio_anual_return_weighted(stocks_anual_return, groups_anual[[1]]$data$s_H, stock_prices_s_H, i))
  
  s_l_return_weighted <- add_row(s_l_return_weighted,
                                 portifolio_anual_return_weighted(stocks_anual_return, groups_anual[[1]]$data$s_l, stock_prices_s_l, i))
  
  
  
  B_H_return_weighted_info <- add_row(B_H_return_weighted_info, 
                                      portifolio_anual_return_weighted(stocks_anual_return_info, groups_anual_info[[1]]$data$B_H, stock_prices_B_H_info, i)) 
  
  B_l_return_weighted_info <- add_row(B_l_return_weighted_info,
                                      portifolio_anual_return_weighted(stocks_anual_return_info, groups_anual_info[[1]]$data$B_l, stock_prices_B_l_info, i))
  
  s_H_return_weighted_info <- add_row(s_H_return_weighted_info,
                                      portifolio_anual_return_weighted(stocks_anual_return_info, groups_anual_info[[1]]$data$s_H, stock_prices_s_H_info, i))
  
  s_l_return_weighted_info <- add_row(s_l_return_weighted_info,
                                      portifolio_anual_return_weighted(stocks_anual_return_info, groups_anual_info[[1]]$data$s_l, stock_prices_s_l_info, i))
}















#Sempre zerar o stock_anual_return ao final de uma rotina de cálculo
stocks_anual_return <- stocks_anual_return_info <- tibble()

##-----------  Com rebalanceamento anual tanto para o conjunto de ativos quanto para o peso de cada um na carteira ---------------
for(i in 2018:2022){
  #groups <- form_groups(compiled_data, i)
  y = i - 2017
  
  stock_prices_B_H <- daily_return(stock_prices, groups_anual[[y]]$data$B_H)
  stock_prices_B_l <- daily_return(stock_prices, groups_anual[[y]]$data$B_l) 
  stock_prices_s_H <- daily_return(stock_prices, groups_anual[[y]]$data$s_H) 
  stock_prices_s_l <- daily_return(stock_prices,groups_anual[[y]]$data$s_l)
  
  stock_prices_B_H_info <- daily_return(stock_prices, groups_anual_info[[y]]$data$B_H, i, TRUE)
  stock_prices_B_l_info <- daily_return(stock_prices, groups_anual_info[[y]]$data$B_l, i, TRUE) 
  stock_prices_s_H_info <- daily_return(stock_prices, groups_anual_info[[y]]$data$s_H, i, TRUE) 
  stock_prices_s_l_info <- daily_return(stock_prices, groups_anual_info[[y]]$data$s_l, i, TRUE)
  
  
  
  stocks_anual_return <- bind_rows(anual_return(stock_prices_B_H),
                                   anual_return(stock_prices_B_l),
                                   anual_return(stock_prices_s_H),
                                   anual_return(stock_prices_s_l)) %>% distinct()
  
  stocks_anual_return_info <- bind_rows(anual_return(stock_prices_B_H_info, TRUE),
                                        anual_return(stock_prices_B_l_info, TRUE),
                                        anual_return(stock_prices_s_H_info, TRUE),
                                        anual_return(stock_prices_s_l_info, TRUE)) %>% distinct()
  
  
  B_H_return_weighted_yearly_bal <- add_row(B_H_return_weighted_yearly_bal, 
                                            portifolio_anual_return_weighted(stocks_anual_return, groups_anual[[y]]$data$B_H, stock_prices_B_H, i)) 
  
  B_l_return_weighted_yearly_bal <- add_row(B_l_return_weighted_yearly_bal,
                                            portifolio_anual_return_weighted(stocks_anual_return, groups_anual[[y]]$data$B_l, stock_prices_B_l, i))
  
  s_H_return_weighted_yearly_bal <- add_row(s_H_return_weighted_yearly_bal,
                                            portifolio_anual_return_weighted(stocks_anual_return, groups_anual[[y]]$data$s_H, stock_prices_s_H, i))
  
  s_l_return_weighted_yearly_bal <- add_row(s_l_return_weighted_yearly_bal,
                                            portifolio_anual_return_weighted(stocks_anual_return, groups_anual[[y]]$data$s_l, stock_prices_s_l, i))
  
  
  
  B_H_return_weighted_yearly_bal_info <- add_row(B_H_return_weighted_yearly_bal_info, 
                                                 portifolio_anual_return_weighted(stocks_anual_return_info, groups_anual_info[[y]]$data$B_H, stock_prices_B_H_info, i)) 
  
  B_l_return_weighted_yearly_bal_info <- add_row(B_l_return_weighted_yearly_bal_info,
                                                 portifolio_anual_return_weighted(stocks_anual_return_info, groups_anual_info[[y]]$data$B_l, stock_prices_B_l_info, i))
  
  s_H_return_weighted_yearly_bal_info <- add_row(s_H_return_weighted_yearly_bal_info,
                                                 portifolio_anual_return_weighted(stocks_anual_return_info, groups_anual_info[[y]]$data$s_H, stock_prices_s_H_info, i))
  
  s_l_return_weighted_yearly_bal_info <- add_row(s_l_return_weighted_yearly_bal_info,
                                                 portifolio_anual_return_weighted(stocks_anual_return_info, groups_anual_info[[y]]$data$s_l, stock_prices_s_l_info, i))
}









for(i in 2018:2022) {
  #Reaproveita a stock_prices sem info
  
  for(y in 1:4) {
    
    index = (i-2018)*4+y
    
    if(index > 19){
      break # Os dados acaban aqui
    }
    
    
    stock_prices_B_H <- daily_return(stock_prices, groups_tri[[index]]$data$B_H, i, FALSE, TRUE, y)
    stock_prices_B_l <- daily_return(stock_prices, groups_tri[[index]]$data$B_l, i, FALSE, TRUE, y) 
    stock_prices_s_H <- daily_return(stock_prices, groups_tri[[index]]$data$s_H, i, FALSE, TRUE, y) 
    stock_prices_s_l <- daily_return(stock_prices, groups_tri[[index]]$data$s_l, i, FALSE, TRUE, y)
    
    B_H_return_weighted_tri_bal <- add_row(B_H_return_weighted_tri_bal, portifolio_trimestral_return_weighted(groups_tri[[index]]$data$B_H, stock_prices_B_H, y))
    B_l_return_weighted_tri_bal <- add_row(B_l_return_weighted_tri_bal, portifolio_trimestral_return_weighted(groups_tri[[index]]$data$B_l, stock_prices_B_l, y))
    s_H_return_weighted_tri_bal <- add_row(s_H_return_weighted_tri_bal, portifolio_trimestral_return_weighted(groups_tri[[index]]$data$s_H, stock_prices_s_H, y))
    s_l_return_weighted_tri_bal <- add_row(s_l_return_weighted_tri_bal, portifolio_trimestral_return_weighted(groups_tri[[index]]$data$s_l, stock_prices_s_l, y))
    
    if(y != 4){
      #print(index)
      #Deve controlar o trimestre numa função chamada portifolio_trimestral_return
      stock_prices_B_H_info <- daily_return(stock_prices, groups_tri_info[[index]]$data$B_H, i, TRUE, TRUE, y)
      stock_prices_B_l_info <- daily_return(stock_prices, groups_tri_info[[index]]$data$B_l, i, TRUE, TRUE, y) 
      stock_prices_s_H_info <- daily_return(stock_prices, groups_tri_info[[index]]$data$s_H, i, TRUE, TRUE, y) 
      stock_prices_s_l_info <- daily_return(stock_prices, groups_tri_info[[index]]$data$s_l, i, TRUE, TRUE, y)
      
      B_H_return_weighted_tri_bal_info <- add_row(B_H_return_weighted_tri_bal_info, portifolio_trimestral_return_weighted(groups_tri_info[[index]]$data$B_H, stock_prices_B_H_info, y))
      B_l_return_weighted_tri_bal_info <- add_row(B_l_return_weighted_tri_bal_info, portifolio_trimestral_return_weighted(groups_tri_info[[index]]$data$B_l, stock_prices_B_l_info, y))
      s_H_return_weighted_tri_bal_info <- add_row(s_H_return_weighted_tri_bal_info, portifolio_trimestral_return_weighted(groups_tri_info[[index]]$data$s_H, stock_prices_s_H_info, y))
      s_l_return_weighted_tri_bal_info <- add_row(s_l_return_weighted_tri_bal_info, portifolio_trimestral_return_weighted(groups_tri_info[[index]]$data$s_l, stock_prices_s_l_info, y))
    }
    
  }
}







#Antiga função de formação de grupos
# form_groups_deprecated(data, year = 2018) {
#   B_H <- data %>% filter(
#     `Ptr Liq` > median(`Ptr Liq`, na.rm = TRUE) &
#       `B/M ratio` > median(`B/M ratio`, na.rm = TRUE) & `Ano` == year
#   )
#   
#   B_l <- data %>% filter(
#     `Ptr Liq` > median(`Ptr Liq`, na.rm = TRUE) &
#       `B/M ratio` <= median(`B/M ratio`, na.rm = TRUE) & `Ano` == year
#   )
#   
#   s_H <- data %>% filter(
#     `Ptr Liq` <= median(`Ptr Liq`, na.rm = TRUE) &
#       `B/M ratio` > median(`B/M ratio`, na.rm = TRUE) & `Ano` == year
#   )
#   
#   s_l <- data %>% filter(
#     `Ptr Liq` <= median(`Ptr Liq`, na.rm = TRUE) &
#       `B/M ratio` <= median(`B/M ratio`, na.rm = TRUE) & `Ano` == year
#   )
# }














library(parallel)
library(doParallel)

# Função para gerar combinações válidas iterativamente em paralelo
generate_valid_combinations_parallel <- function(num_assets, step, max_weight, target_sum) {
  # Valores possíveis para os pesos
  possible_weights <- seq(0, max_weight, by = step)
  
  # Dividir o trabalho inicial entre os núcleos
  initial_weights <- possible_weights
  
  # Função recursiva para construir combinações válidas
  recursive_combinations <- function(current_combination, remaining_assets) {
    if (remaining_assets == 0) {
      # Se não restam mais ações, verificar se a soma é válida
      if (sum(current_combination) <= target_sum) {
        return(list(current_combination))
      } else {
        return(NULL)
      }
    }
    
    # Gerar combinações adicionando cada peso possível
    valid_combinations <- list()
    for (weight in possible_weights) {
      new_combination <- c(current_combination, weight)
      if (sum(new_combination) <= target_sum) {
        valid_combinations <- c(valid_combinations,
                                recursive_combinations(new_combination, remaining_assets - 1))
      }
    }
    return(valid_combinations)
  }
  
  # Configurar o paralelismo
  num_cores <- detectCores() - 1
  cl <- makeCluster(num_cores)
  registerDoParallel(cl)
  
  # Executar em paralelo para cada peso inicial
  valid_combinations <- foreach(weight = initial_weights, .combine = rbind, .packages = "base") %dopar% {
    recursive_combinations(c(weight), num_assets - 1)
  }
  
  # Fechar o cluster
  stopCluster(cl)
  
  # Converter lista para matriz ou data frame
  valid_combinations <- do.call(rbind, valid_combinations)
  
  return(valid_combinations)
}

# Parâmetros
num_assets <- 25       # Número de ações
step <- 0.1           # Incremento dos pesos (2,5%)
max_weight <- 0.20     # Peso máximo por ação (25%)
target_sum <- 1        # Soma total dos pesos (100%)

# Gerar combinações válidas em paralelo
system.time({
  valid_combinations <- generate_valid_combinations_parallel(num_assets, step, max_weight, target_sum)
})

# Número total de combinações válidas
print(paste("Número total de combinações válidas:", nrow(valid_combinations)))

