

data_list <- list(
  B_H_return = B_H_return,
  B_l_return = B_l_return,
  s_H_return = s_H_return,
  s_l_return = s_l_return,
  B_H_return_info = B_H_return_info,
  B_l_return_info = B_l_return_info,
  s_H_return_info = s_H_return_info,
  s_l_return_info = s_l_return_info,
  B_H_return_yearly_bal = B_H_return_yearly_bal,
  B_l_return_yearly_bal = B_l_return_yearly_bal,
  s_H_return_yearly_bal = s_H_return_yearly_bal,
  s_l_return_yearly_bal = s_l_return_yearly_bal,
  B_H_return_yearly_bal_info = B_H_return_yearly_bal_info,
  B_l_return_yearly_bal_info = B_l_return_yearly_bal_info,
  s_H_return_yearly_bal_info = s_H_return_yearly_bal_info,
  s_l_return_yearly_bal_info = s_l_return_yearly_bal_info,
  B_H_return_weighted = B_H_return_weighted,
  B_l_return_weighted = B_l_return_weighted,
  s_H_return_weighted = s_H_return_weighted,
  s_l_return_weighted = s_l_return_weighted,
  B_H_return_weighted_info = B_H_return_weighted_info,
  B_l_return_weighted_info = B_l_return_weighted_info,
  s_H_return_weighted_info = s_H_return_weighted_info,
  s_l_return_weighted_info = s_l_return_weighted_info,
  B_H_return_weighted_yearly_bal = B_H_return_weighted_yearly_bal,
  B_l_return_weighted_yearly_bal = B_l_return_weighted_yearly_bal,
  s_H_return_weighted_yearly_bal = s_H_return_weighted_yearly_bal,
  s_l_return_weighted_yearly_bal = s_l_return_weighted_yearly_bal,
  B_H_return_weighted_yearly_bal_info = B_H_return_weighted_yearly_bal_info,
  B_l_return_weighted_yearly_bal_info = B_l_return_weighted_yearly_bal_info,
  s_H_return_weighted_yearly_bal_info = s_H_return_weighted_yearly_bal_info,
  s_l_return_weighted_yearly_bal_info = s_l_return_weighted_yearly_bal_info,
  B_l_return_tri_bal = B_l_return_tri_bal,
  s_H_return_tri_bal = s_H_return_tri_bal,
  s_l_return_tri_bal = s_l_return_tri_bal,
  B_H_return_tri_bal = B_H_return_tri_bal,
  B_H_return_tri_bal_info = B_H_return_tri_bal_info,
  B_l_return_tri_bal_info = B_l_return_tri_bal_info,
  s_H_return_tri_bal_info = s_H_return_tri_bal_info,
  s_l_return_tri_bal_info = s_l_return_tri_bal_info,
  B_H_return_weighted_tri_bal = B_H_return_weighted_tri_bal,
  B_l_return_weighted_tri_bal = B_l_return_weighted_tri_bal,
  s_H_return_weighted_tri_bal = s_H_return_weighted_tri_bal,
  s_l_return_weighted_tri_bal = s_l_return_weighted_tri_bal,
  B_H_return_weighted_tri_bal_info = B_H_return_weighted_tri_bal_info,
  B_l_return_weighted_tri_bal_info = B_l_return_weighted_tri_bal_info,
  s_H_return_weighted_tri_bal_info = s_H_return_weighted_tri_bal_info,
  s_l_return_weighted_tri_bal_info = s_l_return_weighted_tri_bal_info,
  
  
  s_l_return_markovitz = s_l_return_markovitz,
  s_H_return_markovitz = s_H_return_markovitz,
  B_l_return_markovitz = B_l_return_markovitz,
  B_H_return_markovitz = B_H_return_markovitz,
  s_l_return_markovitz_info = s_l_return_markovitz_info,
  s_H_return_markovitz_info = s_H_return_markovitz_info,
  B_l_return_markovitz_info = B_l_return_markovitz_info,
  B_H_return_markovitz_info = B_H_return_markovitz_info,
  
  s_l_return_markovitz_yearly_bal = s_l_return_markovitz_yearly_bal,
  s_H_return_markovitz_yearly_bal = s_H_return_markovitz_yearly_bal,
  B_l_return_markovitz_yearly_bal = B_l_return_markovitz_yearly_bal,
  B_H_return_markovitz_yearly_bal = B_H_return_markovitz_yearly_bal,
  s_l_return_markovitz_yearly_bal_info = s_l_return_markovitz_yearly_bal_info,
  s_H_return_markovitz_yearly_bal_info = s_H_return_markovitz_yearly_bal_info,
  B_l_return_markovitz_yearly_bal_info = B_l_return_markovitz_yearly_bal_info,
  B_H_return_markovitz_yearly_bal_info = B_H_return_markovitz_yearly_bal_info,
  
  s_l_return_markovitz_tri_bal = s_l_return_markovitz_tri_bal,
  s_H_return_markovitz_tri_bal = s_H_return_markovitz_tri_bal,
  B_l_return_markovitz_tri_bal = B_l_return_markovitz_tri_bal,
  B_H_return_markovitz_tri_bal = B_H_return_markovitz_tri_bal,
  s_l_return_markovitz_tri_bal_info = s_l_return_markovitz_tri_bal_info,
  s_H_return_markovitz_tri_bal_info = s_H_return_markovitz_tri_bal_info,
  B_l_return_markovitz_tri_bal_info = B_l_return_markovitz_tri_bal_info,
  B_H_return_markovitz_tri_bal_info = B_H_return_markovitz_tri_bal_info
)

media_list <- list(
  B_H_return = tibble(retorno_medio = median(B_H_return$retorno)),
  B_l_return = tibble(retorno_medio = median(B_l_return$retorno)),
  s_H_return = tibble(retorno_medio = median(s_H_return$retorno)),
  s_l_return = tibble(retorno_medio = median(s_l_return$retorno)),
  B_H_return_info = tibble(retorno_medio = median(B_H_return_info$retorno)),
  B_l_return_info = tibble(retorno_medio = median(B_l_return_info$retorno)),
  s_H_return_info = tibble(retorno_medio = median(s_H_return_info$retorno)),
  s_l_return_info = tibble(retorno_medio = median(s_l_return_info$retorno)),
  B_H_return_yearly_bal = tibble(retorno_medio = median(B_H_return_yearly_bal$retorno)),
  B_l_return_yearly_bal = tibble(retorno_medio = median(B_l_return_yearly_bal$retorno)),
  s_H_return_yearly_bal = tibble(retorno_medio = median(s_H_return_yearly_bal$retorno)),
  s_l_return_yearly_bal = tibble(retorno_medio = median(s_l_return_yearly_bal$retorno)),
  B_H_return_yearly_bal_info = tibble(retorno_medio = median(B_H_return_yearly_bal_info$retorno)),
  B_l_return_yearly_bal_info = tibble(retorno_medio = median(B_l_return_yearly_bal_info$retorno)),
  s_H_return_yearly_bal_info = tibble(retorno_medio = median(s_H_return_yearly_bal_info$retorno)),
  s_l_return_yearly_bal_info = tibble(retorno_medio = median(s_l_return_yearly_bal_info$retorno)),
  B_H_return_weighted = tibble(retorno_medio = median(B_H_return_weighted$retorno)),
  B_l_return_weighted = tibble(retorno_medio = median(B_l_return_weighted$retorno)),
  s_H_return_weighted = tibble(retorno_medio = median(s_H_return_weighted$retorno)),
  s_l_return_weighted = tibble(retorno_medio = median(s_l_return_weighted$retorno)),
  B_H_return_weighted_info = tibble(retorno_medio = median(B_H_return_weighted_info$retorno)),
  B_l_return_weighted_info = tibble(retorno_medio = median(B_l_return_weighted_info$retorno)),
  s_H_return_weighted_info = tibble(retorno_medio = median(s_H_return_weighted_info$retorno)),
  s_l_return_weighted_info = tibble(retorno_medio = median(s_l_return_weighted_info$retorno)),
  B_H_return_weighted_yearly_bal = tibble(retorno_medio = median(B_H_return_weighted_yearly_bal$retorno)),
  B_l_return_weighted_yearly_bal = tibble(retorno_medio = median(B_l_return_weighted_yearly_bal$retorno)),
  s_H_return_weighted_yearly_bal = tibble(retorno_medio = median(s_H_return_weighted_yearly_bal$retorno)),
  s_l_return_weighted_yearly_bal = tibble(retorno_medio = median(s_l_return_weighted_yearly_bal$retorno)),
  B_H_return_weighted_yearly_bal_info = tibble(retorno_medio = median(B_H_return_weighted_yearly_bal_info$retorno)),
  B_l_return_weighted_yearly_bal_info = tibble(retorno_medio = median(B_l_return_weighted_yearly_bal_info$retorno)),
  s_H_return_weighted_yearly_bal_info = tibble(retorno_medio = median(s_H_return_weighted_yearly_bal_info$retorno)),
  s_l_return_weighted_yearly_bal_info = tibble(retorno_medio = median(s_l_return_weighted_yearly_bal_info$retorno)),
  B_l_return_tri_bal = tibble(retorno_medio = median(B_l_return_tri_bal$retorno)),
  s_H_return_tri_bal = tibble(retorno_medio = median(s_H_return_tri_bal$retorno)),
  s_l_return_tri_bal = tibble(retorno_medio = median(s_l_return_tri_bal$retorno)),
  B_H_return_tri_bal = tibble(retorno_medio = median(B_H_return_tri_bal$retorno)),
  B_H_return_tri_bal_info = tibble(retorno_medio = median(B_H_return_tri_bal_info$retorno)),
  B_l_return_tri_bal_info = tibble(retorno_medio = median(B_l_return_tri_bal_info$retorno)),
  s_H_return_tri_bal_info = tibble(retorno_medio = median(s_H_return_tri_bal_info$retorno)),
  s_l_return_tri_bal_info = tibble(retorno_medio = median(s_l_return_tri_bal_info$retorno)),
  B_H_return_weighted_tri_bal = tibble(retorno_medio = median(B_H_return_weighted_tri_bal$retorno)),
  B_l_return_weighted_tri_bal = tibble(retorno_medio = median(B_l_return_weighted_tri_bal$retorno)),
  s_H_return_weighted_tri_bal = tibble(retorno_medio = median(s_H_return_weighted_tri_bal$retorno)),
  s_l_return_weighted_tri_bal = tibble(retorno_medio = median(s_l_return_weighted_tri_bal$retorno)),
  B_H_return_weighted_tri_bal_info = tibble(retorno_medio = median(B_H_return_weighted_tri_bal_info$retorno)),
  B_l_return_weighted_tri_bal_info = tibble(retorno_medio = median(B_l_return_weighted_tri_bal_info$retorno)),
  s_H_return_weighted_tri_bal_info = tibble(retorno_medio = median(s_H_return_weighted_tri_bal_info$retorno)),
  s_l_return_weighted_tri_bal_info = tibble(retorno_medio = median(s_l_return_weighted_tri_bal_info$retorno)),
  
  
  
  s_l_return_markovitz = tibble(retorno_medio = median(s_l_return_markovitz$return)),
  s_H_return_markovitz = tibble(retorno_medio = median(s_H_return_markovitz$return)),
  B_l_return_markovitz = tibble(retorno_medio = median(B_l_return_markovitz$return)),
  B_H_return_markovitz = tibble(retorno_medio = median(B_H_return_markovitz$return)),
  s_l_return_markovitz_info = tibble(retorno_medio = median(s_l_return_markovitz_info$return)),
  s_H_return_markovitz_info = tibble(retorno_medio = median(s_H_return_markovitz_info$return)),
  B_l_return_markovitz_info = tibble(retorno_medio = median(B_l_return_markovitz_info$return)),
  B_H_return_markovitz_info = tibble(retorno_medio = median(B_H_return_markovitz_info$return)),
  
  s_l_return_markovitz_yearly_bal = tibble(retorno_medio = median(s_l_return_markovitz_yearly_bal$return)),
  s_H_return_markovitz_yearly_bal = tibble(retorno_medio = median(s_H_return_markovitz_yearly_bal$return)),
  B_l_return_markovitz_yearly_bal = tibble(retorno_medio = median(B_l_return_markovitz_yearly_bal$return)),
  B_H_return_markovitz_yearly_bal = tibble(retorno_medio = median(B_H_return_markovitz_yearly_bal$return)),
  s_l_return_markovitz_yearly_bal_info = tibble(retorno_medio = median(s_l_return_markovitz_yearly_bal_info$return)),
  s_H_return_markovitz_yearly_bal_info = tibble(retorno_medio = median(s_H_return_markovitz_yearly_bal_info$return)),
  B_l_return_markovitz_yearly_bal_info = tibble(retorno_medio = median(B_l_return_markovitz_yearly_bal_info$return)),
  B_H_return_markovitz_yearly_bal_info = tibble(retorno_medio = median(B_H_return_markovitz_yearly_bal_info$return)),
  
  s_l_return_markovitz_tri_bal = tibble(retorno_medio = median(s_l_return_markovitz_tri_bal$return)),
  s_H_return_markovitz_tri_bal = tibble(retorno_medio = median(s_H_return_markovitz_tri_bal$return)),
  B_l_return_markovitz_tri_bal = tibble(retorno_medio = median(B_l_return_markovitz_tri_bal$return)),
  B_H_return_markovitz_tri_bal = tibble(retorno_medio = median(B_H_return_markovitz_tri_bal$return)),
  s_l_return_markovitz_tri_bal_info = tibble(retorno_medio = median(s_l_return_markovitz_tri_bal_info$return)),
  s_H_return_markovitz_tri_bal_info = tibble(retorno_medio = median(s_H_return_markovitz_tri_bal_info$return)),
  B_l_return_markovitz_tri_bal_info = tibble(retorno_medio = median(B_l_return_markovitz_tri_bal_info$return)),
  B_H_return_markovitz_tri_bal_info = tibble(retorno_medio = median(B_H_return_markovitz_tri_bal_info$return))
)

accumalated_list <- list(
  B_H_return = tibble(retorno_acumulado = B_H_return$retorno_acumulado[length(B_H_return$retorno_acumulado)]),
  B_l_return = tibble(retorno_acumulado = B_l_return$retorno_acumulado[length(B_l_return$retorno_acumulado)]),
  s_H_return = tibble(retorno_acumulado = s_H_return$retorno_acumulado[length(s_H_return$retorno_acumulado)]),
  s_l_return = tibble(retorno_acumulado = s_l_return$retorno_acumulado[length(s_l_return$retorno_acumulado)]),
  B_H_return_info = tibble(retorno_acumulado = B_H_return_info$retorno_acumulado[length(B_H_return_info$retorno_acumulado)]),
  B_l_return_info = tibble(retorno_acumulado = B_l_return_info$retorno_acumulado[length(B_l_return_info$retorno_acumulado)]),
  s_H_return_info = tibble(retorno_acumulado = s_H_return_info$retorno_acumulado[length(s_H_return_info$retorno_acumulado)]),
  s_l_return_info = tibble(retorno_acumulado = s_l_return_info$retorno_acumulado[length(s_l_return_info$retorno_acumulado)]),
  B_H_return_yearly_bal = tibble(retorno_acumulado = B_H_return_yearly_bal$retorno_acumulado[length(B_H_return_yearly_bal$retorno_acumulado)]),
  B_l_return_yearly_bal = tibble(retorno_acumulado = B_l_return_yearly_bal$retorno_acumulado[length(B_l_return_yearly_bal$retorno_acumulado)]),
  s_H_return_yearly_bal = tibble(retorno_acumulado = s_H_return_yearly_bal$retorno_acumulado[length(s_H_return_yearly_bal$retorno_acumulado)]),
  s_l_return_yearly_bal = tibble(retorno_acumulado = s_l_return_yearly_bal$retorno_acumulado[length(s_l_return_yearly_bal$retorno_acumulado)]),
  B_H_return_yearly_bal_info = tibble(retorno_acumulado = B_H_return_yearly_bal_info$retorno_acumulado[length(B_H_return_yearly_bal_info$retorno_acumulado)]),
  B_l_return_yearly_bal_info = tibble(retorno_acumulado = B_l_return_yearly_bal_info$retorno_acumulado[length(B_l_return_yearly_bal_info$retorno_acumulado)]),
  s_H_return_yearly_bal_info = tibble(retorno_acumulado = s_H_return_yearly_bal_info$retorno_acumulado[length(s_H_return_yearly_bal_info$retorno_acumulado)]),
  s_l_return_yearly_bal_info = tibble(retorno_acumulado = s_l_return_yearly_bal_info$retorno_acumulado[length(s_l_return_yearly_bal_info$retorno_acumulado)]),
  B_H_return_weighted = tibble(retorno_acumulado = B_H_return_weighted$retorno_acumulado[length(B_H_return_weighted$retorno_acumulado)]),
  B_l_return_weighted = tibble(retorno_acumulado = B_l_return_weighted$retorno_acumulado[length(B_l_return_weighted$retorno_acumulado)]),
  s_H_return_weighted = tibble(retorno_acumulado = s_H_return_weighted$retorno_acumulado[length(s_H_return_weighted$retorno_acumulado)]),
  s_l_return_weighted = tibble(retorno_acumulado = s_l_return_weighted$retorno_acumulado[length(s_l_return_weighted$retorno_acumulado)]),
  B_H_return_weighted_info = tibble(retorno_acumulado = B_H_return_weighted_info$retorno_acumulado[length(B_H_return_weighted_info$retorno_acumulado)]),
  B_l_return_weighted_info = tibble(retorno_acumulado = B_l_return_weighted_info$retorno_acumulado[length(B_l_return_weighted_info$retorno_acumulado)]),
  s_H_return_weighted_info = tibble(retorno_acumulado = s_H_return_weighted_info$retorno_acumulado[length(s_H_return_weighted_info$retorno_acumulado)]),
  s_l_return_weighted_info = tibble(retorno_acumulado = s_l_return_weighted_info$retorno_acumulado[length(s_l_return_weighted_info$retorno_acumulado)]),
  B_H_return_weighted_yearly_bal = tibble(retorno_acumulado = B_H_return_weighted_yearly_bal$retorno_acumulado[length(B_H_return_weighted_yearly_bal$retorno_acumulado)]),
  B_l_return_weighted_yearly_bal = tibble(retorno_acumulado = B_l_return_weighted_yearly_bal$retorno_acumulado[length(B_l_return_weighted_yearly_bal$retorno_acumulado)]),
  s_H_return_weighted_yearly_bal = tibble(retorno_acumulado = s_H_return_weighted_yearly_bal$retorno_acumulado[length(s_H_return_weighted_yearly_bal$retorno_acumulado)]),
  s_l_return_weighted_yearly_bal = tibble(retorno_acumulado = s_l_return_weighted_yearly_bal$retorno_acumulado[length(s_l_return_weighted_yearly_bal$retorno_acumulado)]),
  B_H_return_weighted_yearly_bal_info = tibble(retorno_acumulado = B_H_return_weighted_yearly_bal_info$retorno_acumulado[length(B_H_return_weighted_yearly_bal_info$retorno_acumulado)]),
  B_l_return_weighted_yearly_bal_info = tibble(retorno_acumulado = B_l_return_weighted_yearly_bal_info$retorno_acumulado[length(B_l_return_weighted_yearly_bal_info$retorno_acumulado)]),
  s_H_return_weighted_yearly_bal_info = tibble(retorno_acumulado = s_H_return_weighted_yearly_bal_info$retorno_acumulado[length(s_H_return_weighted_yearly_bal_info$retorno_acumulado)]),
  s_l_return_weighted_yearly_bal_info = tibble(retorno_acumulado = s_l_return_weighted_yearly_bal_info$retorno_acumulado[length(s_l_return_weighted_yearly_bal_info$retorno_acumulado)]),
  B_l_return_tri_bal = tibble(retorno_acumulado = B_l_return_tri_bal$retorno_acumulado[length(B_l_return_tri_bal$retorno_acumulado)]),
  s_H_return_tri_bal = tibble(retorno_acumulado = s_H_return_tri_bal$retorno_acumulado[length(s_H_return_tri_bal$retorno_acumulado)]),
  s_l_return_tri_bal = tibble(retorno_acumulado = s_l_return_tri_bal$retorno_acumulado[length(s_l_return_tri_bal$retorno_acumulado)]),
  B_H_return_tri_bal = tibble(retorno_acumulado = B_H_return_tri_bal$retorno_acumulado[length(B_H_return_tri_bal$retorno_acumulado)]),
  B_H_return_tri_bal_info = tibble(retorno_acumulado = B_H_return_tri_bal_info$retorno_acumulado[length(B_H_return_tri_bal_info$retorno_acumulado)]),
  B_l_return_tri_bal_info = tibble(retorno_acumulado = B_l_return_tri_bal_info$retorno_acumulado[length(B_l_return_tri_bal_info$retorno_acumulado)]),
  s_H_return_tri_bal_info = tibble(retorno_acumulado = s_H_return_tri_bal_info$retorno_acumulado[length(s_H_return_tri_bal_info$retorno_acumulado)]),
  s_l_return_tri_bal_info = tibble(retorno_acumulado = s_l_return_tri_bal_info$retorno_acumulado[length(s_l_return_tri_bal_info$retorno_acumulado)]),
  B_H_return_weighted_tri_bal = tibble(retorno_acumulado = B_H_return_weighted_tri_bal$retorno_acumulado[length(B_H_return_weighted_tri_bal$retorno_acumulado)]),
  B_l_return_weighted_tri_bal = tibble(retorno_acumulado = B_l_return_weighted_tri_bal$retorno_acumulado[length(B_l_return_weighted_tri_bal$retorno_acumulado)]),
  s_H_return_weighted_tri_bal = tibble(retorno_acumulado = s_H_return_weighted_tri_bal$retorno_acumulado[length(s_H_return_weighted_tri_bal$retorno_acumulado)]),
  s_l_return_weighted_tri_bal = tibble(retorno_acumulado = s_l_return_weighted_tri_bal$retorno_acumulado[length(s_l_return_weighted_tri_bal$retorno_acumulado)]),
  B_H_return_weighted_tri_bal_info = tibble(retorno_acumulado = B_H_return_weighted_tri_bal_info$retorno_acumulado[length(B_H_return_weighted_tri_bal_info$retorno_acumulado)]),
  B_l_return_weighted_tri_bal_info = tibble(retorno_acumulado = B_l_return_weighted_tri_bal_info$retorno_acumulado[length(B_l_return_weighted_tri_bal_info$retorno_acumulado)]),
  s_H_return_weighted_tri_bal_info = tibble(retorno_acumulado = s_H_return_weighted_tri_bal_info$retorno_acumulado[length(s_H_return_weighted_tri_bal_info$retorno_acumulado)]),
  s_l_return_weighted_tri_bal_info = tibble(retorno_acumulado = s_l_return_weighted_tri_bal_info$retorno_acumulado[length(s_l_return_weighted_tri_bal_info$retorno_acumulado)]),
  
  
  
  
  s_l_return_markovitz = tibble(retorno_acumulado = s_l_return_markovitz$retorno_acumulado[length(s_l_return_markovitz$retorno_acumulado)]),
  s_H_return_markovitz = tibble(retorno_acumulado = s_H_return_markovitz$retorno_acumulado[length(s_H_return_markovitz$retorno_acumulado)]),
  B_l_return_markovitz = tibble(retorno_acumulado = B_l_return_markovitz$retorno_acumulado[length(B_l_return_markovitz$retorno_acumulado)]),
  B_H_return_markovitz = tibble(retorno_acumulado = B_H_return_markovitz$retorno_acumulado[length(B_H_return_markovitz$retorno_acumulado)]),
  s_l_return_markovitz_info = tibble(retorno_acumulado = s_l_return_markovitz_info$retorno_acumulado[length(s_l_return_markovitz_info$retorno_acumulado)]),
  s_H_return_markovitz_info = tibble(retorno_acumulado = s_H_return_markovitz_info$retorno_acumulado[length(s_H_return_markovitz_info$retorno_acumulado)]),
  B_l_return_markovitz_info = tibble(retorno_acumulado = B_l_return_markovitz_info$retorno_acumulado[length(B_l_return_markovitz_info$retorno_acumulado)]),
  B_H_return_markovitz_info = tibble(retorno_acumulado = B_H_return_markovitz_info$retorno_acumulado[length(B_H_return_markovitz_info$retorno_acumulado)]),
  
  s_l_return_markovitz_yearly_bal = tibble(retorno_acumulado = s_l_return_markovitz_yearly_bal$retorno_acumulado[length(s_l_return_markovitz_yearly_bal$retorno_acumulado)]),
  s_H_return_markovitz_yearly_bal = tibble(retorno_acumulado = s_H_return_markovitz_yearly_bal$retorno_acumulado[length(s_H_return_markovitz_yearly_bal$retorno_acumulado)]),
  B_l_return_markovitz_yearly_bal = tibble(retorno_acumulado = B_l_return_markovitz_yearly_bal$retorno_acumulado[length(B_l_return_markovitz_yearly_bal$retorno_acumulado)]),
  B_H_return_markovitz_yearly_bal = tibble(retorno_acumulado = B_H_return_markovitz_yearly_bal$retorno_acumulado[length(B_H_return_markovitz_yearly_bal$retorno_acumulado)]),
  s_l_return_markovitz_yearly_bal_info = tibble(retorno_acumulado = s_l_return_markovitz_yearly_bal_info$retorno_acumulado[length(s_l_return_markovitz_yearly_bal_info$retorno_acumulado)]),
  s_H_return_markovitz_yearly_bal_info = tibble(retorno_acumulado = s_H_return_markovitz_yearly_bal_info$retorno_acumulado[length(s_H_return_markovitz_yearly_bal_info$retorno_acumulado)]),
  B_l_return_markovitz_yearly_bal_info = tibble(retorno_acumulado = B_l_return_markovitz_yearly_bal_info$retorno_acumulado[length(B_l_return_markovitz_yearly_bal_info$retorno_acumulado)]),
  B_H_return_markovitz_yearly_bal_info = tibble(retorno_acumulado = B_H_return_markovitz_yearly_bal_info$retorno_acumulado[length(B_H_return_markovitz_yearly_bal_info$retorno_acumulado)]),
  
  s_l_return_markovitz_tri_bal = tibble(retorno_acumulado = s_l_return_markovitz_tri_bal$retorno_acumulado[length(s_l_return_markovitz_tri_bal$retorno_acumulado)]),
  s_H_return_markovitz_tri_bal = tibble(retorno_acumulado = s_H_return_markovitz_tri_bal$retorno_acumulado[length(s_H_return_markovitz_tri_bal$retorno_acumulado)]),
  B_l_return_markovitz_tri_bal = tibble(retorno_acumulado = B_l_return_markovitz_tri_bal$retorno_acumulado[length(B_l_return_markovitz_tri_bal$retorno_acumulado)]),
  B_H_return_markovitz_tri_bal = tibble(retorno_acumulado = B_H_return_markovitz_tri_bal$retorno_acumulado[length(B_H_return_markovitz_tri_bal$retorno_acumulado)]),
  s_l_return_markovitz_tri_bal_info = tibble(retorno_acumulado = s_l_return_markovitz_tri_bal_info$retorno_acumulado[length(s_l_return_markovitz_tri_bal_info$retorno_acumulado)]),
  s_H_return_markovitz_tri_bal_info = tibble(retorno_acumulado = s_H_return_markovitz_tri_bal_info$retorno_acumulado[length(s_H_return_markovitz_tri_bal_info$retorno_acumulado)]),
  B_l_return_markovitz_tri_bal_info = tibble(retorno_acumulado = B_l_return_markovitz_tri_bal_info$retorno_acumulado[length(B_l_return_markovitz_tri_bal_info$retorno_acumulado)]),
  B_H_return_markovitz_tri_bal_info = tibble(retorno_acumulado = B_H_return_markovitz_tri_bal_info$retorno_acumulado[length(B_H_return_markovitz_tri_bal_info$retorno_acumulado)])
)



# Função para gerar gráficos melhorados
plot_graphs <- function(data_list, media_list, accumalated_list) {
  
  media_anual <- bind_rows(
    media_list$B_H_return %>% mutate(.source = "B_H s /ponderação e s /bal"),
    media_list$B_l_return %>% mutate(.source = "B_l s /ponderação e s /bal"),
    media_list$s_H_return %>% mutate(.source = "s_H s /ponderação e s /bal"),
    media_list$s_l_return %>% mutate(.source = "s_l s /ponderação e s /bal"),
    media_list$B_H_return_info %>% mutate(.source = "B_H s /ponderação e s /bal e c /aspecto info"),
    media_list$B_l_return_info %>% mutate(.source = "B_s s /ponderação e s /bal e c /aspecto info"),
    media_list$s_H_return_info %>% mutate(.source = "s_H s /ponderação e s /bal e c /aspecto info"),
    media_list$s_l_return_info %>% mutate(.source = "s_l s /ponderação e s /bal e c /aspecto info"),
    media_list$B_H_return_yearly_bal %>% mutate(.source = "B_H s /ponderação e c /bal"),
    media_list$B_l_return_yearly_bal %>% mutate(.source = "B_l s /ponderação e c /bal"),
    media_list$s_H_return_yearly_bal %>% mutate(.source = "s_H s /ponderação e c /bal"),
    media_list$s_l_return_yearly_bal %>% mutate(.source = "s_l s /ponderação e c /bal"),
    media_list$B_H_return_yearly_bal_info %>% mutate(.source = "B_H s /ponderação e c /bal e c /aspecto info"),
    media_list$B_l_return_yearly_bal_info  %>% mutate(.source = "B_l s /ponderação e c /bal e c /aspecto info"),
    media_list$s_H_return_yearly_bal_info %>% mutate(.source = "s_H s /ponderação e c /bal e c /aspecto info"),
    media_list$s_l_return_yearly_bal_info %>% mutate(.source = "s_l s /ponderação e c /bal e c /aspecto info"),
    media_list$B_H_return_weighted %>% mutate(.source = "B_H c /ponderação e s /bal"),
    media_list$B_l_return_weighted %>% mutate(.source = "B_l c /ponderação e s /bal"),
    media_list$s_H_return_weighted %>% mutate(.source = "s_H c /ponderação e s /bal"),
    media_list$s_l_return_weighted %>% mutate(.source = "s_l c /ponderação e s /bal"),
    media_list$B_H_return_weighted_info %>% mutate(.source = "B_H c /ponderação e c /aspecto info"),
    media_list$B_l_return_weighted_info %>% mutate(.source = "B_l c /ponderação e c /aspecto info"),
    media_list$s_H_return_weighted_info %>% mutate(.source = "s_H c /ponderação e c /aspecto info"),
    media_list$s_l_return_weighted_info %>% mutate(.source = "s_l c /ponderação e c /aspecto info"),
    media_list$B_H_return_weighted_yearly_bal %>% mutate(.source = "B_H c /ponderação e c /bal e s /aspecto info"),
    media_list$B_l_return_weighted_yearly_bal %>% mutate(.source = "B_l c /ponderação e c /bal e s /aspecto info"),
    media_list$s_H_return_weighted_yearly_bal %>% mutate(.source = "s_H c /ponderação e c /bal e s /aspecto info"),
    media_list$s_l_return_weighted_yearly_bal %>% mutate(.source = "s_l c /ponderação e c /bal e s /aspecto info"),
    media_list$B_H_return_weighted_yearly_bal_info %>% mutate(.source = "B_H c /ponderação e c /bal e c /aspecto info"),
    media_list$B_l_return_weighted_yearly_bal_info %>% mutate(.source = "B_l c /ponderação e c /bal e c /aspecto info"),
    media_list$s_H_return_weighted_yearly_bal_info %>% mutate(.source = "s_H c /ponderação e c /bal e c /aspecto info"),
    media_list$s_l_return_weighted_yearly_bal_info %>% mutate(.source = "s_l c /ponderação e c /bal e c /aspecto info"),
  ) %>% group_by(.source)
  
  
  media_tri <- bind_rows(
    media_list$B_H_return_tri_bal %>% mutate(.source = "B_H s /ponderação e c /bal"),
    media_list$B_l_return_tri_bal %>% mutate(.source = "B_l s /ponderação e c /bal"),
    media_list$s_H_return_tri_bal %>% mutate(.source = "s_H s /ponderação e c /bal"),
    media_list$s_l_return_tri_bal %>% mutate(.source = "s_l s /ponderação e c /bal"),
    media_list$B_H_return_tri_bal_info %>% mutate(.source = "B_H s /ponderação e c /bal e c /aspecto info"),
    media_list$B_l_return_tri_bal_info  %>% mutate(.source = "B_l s /ponderação e c /bal e c /aspecto info"),
    media_list$s_H_return_tri_bal_info %>% mutate(.source = "s_H s /ponderação e c /bal e c /aspecto info"),
    media_list$s_l_return_tri_bal_info %>% mutate(.source = "s_l s /ponderação e c /bal e c /aspecto info"),
    media_list$B_H_return_weighted_tri_bal %>% mutate(.source = "B_H c /ponderação e c /bal e s /aspecto info"),
    media_list$B_l_return_weighted_tri_bal %>% mutate(.source = "B_l c /ponderação e c /bal e s /aspecto info"),
    media_list$s_H_return_weighted_tri_bal %>% mutate(.source = "s_H c /ponderação e c /bal e s /aspecto info"),
    media_list$s_l_return_weighted_tri_bal %>% mutate(.source = "s_l c /ponderação e c /bal e s /aspecto info"),
    media_list$B_H_return_weighted_tri_bal_info %>% mutate(.source = "B_H c /ponderação e c /bal e c /aspecto info"),
    media_list$B_l_return_weighted_tri_bal_info %>% mutate(.source = "B_l c /ponderação e c /bal e c /aspecto info"),
    media_list$s_H_return_weighted_tri_bal_info %>% mutate(.source = "s_H c /ponderação e c /bal e c /aspecto info"),
    media_list$s_l_return_weighted_tri_bal_info %>% mutate(.source = "s_l c /ponderação e c /bal e c /aspecto info"),
  )
  # Combinar todos os dados anuais
  anual_data_return <- bind_rows(
    
    data_list$B_H_return %>% mutate(source = "B_H s /ponderação e s /bal"),
    data_list$B_l_return %>% mutate(source = "B_l s /ponderação e s /bal"),
    data_list$s_H_return %>% mutate(source = "s_H s /ponderação e s /bal"),
    data_list$s_l_return %>% mutate(source = "s_l s /ponderação e s /bal"),
    data_list$B_H_return_yearly_bal %>% mutate(source = "B_H s /ponderação e c /bal"),
    data_list$B_l_return_yearly_bal %>% mutate(source = "B_l s /ponderação e c /bal"),
    data_list$s_H_return_yearly_bal %>% mutate(source = "s_H s /ponderação e c /bal"),
    data_list$s_l_return_yearly_bal %>% mutate(source = "s_l s /ponderação e c /bal"),
    data_list$B_H_return_info %>% mutate(source = "B_H s /ponderação e s /bal c /aspecto info"),
    data_list$B_l_return_info %>% mutate(source = "B_l s /ponderação e s /bal c /aspecto info"),
    data_list$s_H_return_info %>% mutate(source = "s_H s /ponderação e s /bal c /aspecto info"),
    data_list$s_l_return_info %>% mutate(source = "s_l s /ponderação e s /bal c /aspecto info"),
    data_list$B_H_return_yearly_bal_info %>% mutate(source = "B_H s /ponderação e c /bal c /aspecto info"),
    data_list$B_l_return_yearly_bal_info %>% mutate(source = "B_l s /ponderação e c /bal c /aspecto info"),
    data_list$s_H_return_yearly_bal_info %>% mutate(source = "s_H s /ponderação e c /bal c /aspecto info"),
    data_list$s_l_return_yearly_bal_info %>% mutate(source = "s_l s /ponderação e c /bal c /aspecto info"),
  )
  
  retorno_acumulado <- bind_rows(
    accumalated_list$B_H_return %>% mutate(.source = "B_H s /ponderação e s /bal"),
    accumalated_list$B_l_return %>% mutate(.source = "B_l s /ponderação e s /bal"),
    accumalated_list$s_H_return %>% mutate(.source = "s_H s /ponderação e s /bal"),
    accumalated_list$s_l_return %>% mutate(.source = "s_l s /ponderação e s /bal"),
    accumalated_list$B_H_return_info %>% mutate(.source = "B_H s /ponderação e s /bal e c /aspecto info"),
    accumalated_list$B_l_return_info %>% mutate(.source = "B_s s /ponderação e s /bal e c /aspecto info"),
    accumalated_list$s_H_return_info %>% mutate(.source = "s_H s /ponderação e s /bal e c /aspecto info"),
    accumalated_list$s_l_return_info %>% mutate(.source = "s_l s /ponderação e s /bal e c /aspecto info"),
    accumalated_list$B_H_return_yearly_bal %>% mutate(.source = "B_H s /ponderação e c /bal"),
    accumalated_list$B_l_return_yearly_bal %>% mutate(.source = "B_l s /ponderação e c /bal"),
    accumalated_list$s_H_return_yearly_bal %>% mutate(.source = "s_H s /ponderação e c /bal"),
    accumalated_list$s_l_return_yearly_bal %>% mutate(.source = "s_l s /ponderação e c /bal"),
    accumalated_list$B_H_return_yearly_bal_info %>% mutate(.source = "B_H s /ponderação e c /bal e c /aspecto info"),
    accumalated_list$B_l_return_yearly_bal_info  %>% mutate(.source = "B_l s /ponderação e c /bal e c /aspecto info"),
    accumalated_list$s_H_return_yearly_bal_info %>% mutate(.source = "s_H s /ponderação e c /bal e c /aspecto info"),
    accumalated_list$s_l_return_yearly_bal_info %>% mutate(.source = "s_l s /ponderação e c /bal e c /aspecto info"),
    accumalated_list$B_H_return_weighted %>% mutate(.source = "B_H c /ponderação e s /bal"),
    accumalated_list$B_l_return_weighted %>% mutate(.source = "B_l c /ponderação e s /bal"),
    accumalated_list$s_H_return_weighted %>% mutate(.source = "s_H c /ponderação e s /bal"),
    accumalated_list$s_l_return_weighted %>% mutate(.source = "s_l c /ponderação e s /bal"),
    accumalated_list$B_H_return_weighted_info %>% mutate(.source = "B_H c /ponderação e c /aspecto info"),
    accumalated_list$B_l_return_weighted_info %>% mutate(.source = "B_l c /ponderação e c /aspecto info"),
    accumalated_list$s_H_return_weighted_info %>% mutate(.source = "s_H c /ponderação e c /aspecto info"),
    accumalated_list$s_l_return_weighted_info %>% mutate(.source = "s_l c /ponderação e c /aspecto info"),
    accumalated_list$B_H_return_weighted_yearly_bal %>% mutate(.source = "B_H c /ponderação e c /bal e s /aspecto info"),
    accumalated_list$B_l_return_weighted_yearly_bal %>% mutate(.source = "B_l c /ponderação e c /bal e s /aspecto info"),
    accumalated_list$s_H_return_weighted_yearly_bal %>% mutate(.source = "s_H c /ponderação e c /bal e s /aspecto info"),
    accumalated_list$s_l_return_weighted_yearly_bal %>% mutate(.source = "s_l c /ponderação e c /bal e s /aspecto info"),
    accumalated_list$B_H_return_weighted_yearly_bal_info %>% mutate(.source = "B_H c /ponderação e c /bal e c /aspecto info"),
    accumalated_list$B_l_return_weighted_yearly_bal_info %>% mutate(.source = "B_l c /ponderação e c /bal e c /aspecto info"),
    accumalated_list$s_H_return_weighted_yearly_bal_info %>% mutate(.source = "s_H c /ponderação e c /bal e c /aspecto info"),
    accumalated_list$s_l_return_weighted_yearly_bal_info %>% mutate(.source = "s_l c /ponderação e c /bal e c /aspecto info"),
    accumalated_list$B_H_return_tri_bal %>% mutate(.source = "B_H s /ponderação e c /bal tri"),
    accumalated_list$B_l_return_tri_bal %>% mutate(.source = "B_l s /ponderação e c /bal tri"),
    accumalated_list$s_H_return_tri_bal %>% mutate(.source = "s_H s /ponderação e c /bal tri"),
    accumalated_list$s_l_return_tri_bal %>% mutate(.source = "s_l s /ponderação e c /bal tri"),
    accumalated_list$B_H_return_tri_bal_info %>% mutate(.source = "B_H s /ponderação e c /bal e c /aspecto info tri"),
    accumalated_list$B_l_return_tri_bal_info  %>% mutate(.source = "B_l s /ponderação e c /bal e c /aspecto info tri"),
    accumalated_list$s_H_return_tri_bal_info %>% mutate(.source = "s_H s /ponderação e c /bal e c /aspecto info tri"),
    accumalated_list$s_l_return_tri_bal_info %>% mutate(.source = "s_l s /ponderação e c /bal e c /aspecto info tri"),
    accumalated_list$B_H_return_weighted_tri_bal %>% mutate(.source = "B_H c /ponderação e c /bal e s /aspecto info tri"),
    accumalated_list$B_l_return_weighted_tri_bal %>% mutate(.source = "B_l c /ponderação e c /bal e s /aspecto info tri"),
    accumalated_list$s_H_return_weighted_tri_bal %>% mutate(.source = "s_H c /ponderação e c /bal e s /aspecto info tri"),
    accumalated_list$s_l_return_weighted_tri_bal %>% mutate(.source = "s_l c /ponderação e c /bal e s /aspecto info tri"),
    accumalated_list$B_H_return_weighted_tri_bal_info %>% mutate(.source = "B_H c /ponderação e c /bal e c /aspecto info tri"),
    accumalated_list$B_l_return_weighted_tri_bal_info %>% mutate(.source = "B_l c /ponderação e c /bal e c /aspecto info tri"),
    accumalated_list$s_H_return_weighted_tri_bal_info %>% mutate(.source = "s_H c /ponderação e c /bal e c /aspecto info tri"),
    accumalated_list$s_l_return_weighted_tri_bal_info %>% mutate(.source = "s_l c /ponderação e c /bal e c /aspecto info tri"),
  )
  
  anual_data_return_weighted <- bind_rows(
    data_list$B_H_return_weighted %>% mutate(source = "B_H c /ponderação e s /bal"),
    data_list$B_l_return_weighted %>% mutate(source = "B_l c /ponderação e s /bal"),
    data_list$s_H_return_weighted %>% mutate(source = "s_H c /ponderação e s /bal"),
    data_list$s_l_return_weighted %>% mutate(source = "s_l c /ponderação e s /bal"),
    
    data_list$B_H_return_weighted_yearly_bal %>% mutate(source = "B_H c /ponderação e c /bal"),
    data_list$B_l_return_weighted_yearly_bal %>% mutate(source = "B_l c /ponderação e c /bal"),
    data_list$s_H_return_weighted_yearly_bal %>% mutate(source = "s_H c /ponderação e c /bal"),
    data_list$s_l_return_weighted_yearly_bal %>% mutate(source = "s_l c /ponderação e c /bal"),
    
    data_list$B_H_return_weighted_info %>% mutate(source = "B_H c /ponderação e s /bal c /aspecto info"),
    data_list$B_l_return_weighted_info %>% mutate(source = "B_l c /ponderação e s /bal c /aspecto info"),
    data_list$s_H_return_weighted_info %>% mutate(source = "s_H c /ponderação e s /bal c /aspecto info"),
    data_list$s_l_return_weighted_info %>% mutate(source = "s_l c /ponderação e s /bal c /aspecto info"),
    
    data_list$B_H_return_weighted_yearly_bal_info %>% mutate(source = "B_H c /ponderação e c /bal c /aspecto info"),
    data_list$B_l_return_weighted_yearly_bal_info %>% mutate(source = "B_l c /ponderação e c /bal c /aspecto info"),
    data_list$s_H_return_weighted_yearly_bal_info %>% mutate(source = "s_H c /ponderação e c /bal c /aspecto info"),
    data_list$s_l_return_weighted_yearly_bal_info %>% mutate(source = "s_l c /ponderação e c /bal c /aspecto info")
  )
  
  # Combinar todos os dados trimestrais
  quarterly_data <- bind_rows(
    data_list$B_H_return_tri_bal %>% mutate(source = "B_H s /ponderação"),
    data_list$B_l_return_tri_bal %>% mutate(source = "B_l s /ponderação"),
    data_list$s_H_return_tri_bal %>% mutate(source = "s_H s /ponderação"),
    data_list$s_l_return_tri_bal %>% mutate(source = "s_l s /ponderação"),
    
    data_list$B_H_return_tri_bal_info %>% mutate(source = "B_H s /ponderação e c /aspecto info"),
    data_list$B_l_return_tri_bal_info %>% mutate(source = "B_l s /ponderação e c /aspecto info"),
    data_list$s_H_return_tri_bal_info %>% mutate(source = "s_H s /ponderação e c /aspecto info"),
    data_list$s_l_return_tri_bal_info %>% mutate(source = "s_l s /ponderação e c /aspecto info"),
    
    data_list$B_H_return_weighted_tri_bal %>% mutate(source = "B_H c /ponderação"),
    data_list$B_l_return_weighted_tri_bal %>% mutate(source = "B_l c /ponderação"),
    data_list$s_H_return_weighted_tri_bal %>% mutate(source = "s_H c /ponderação"),
    data_list$s_l_return_weighted_tri_bal %>% mutate(source = "s_l c /ponderação"),
    
    data_list$B_H_return_weighted_tri_bal_info %>% mutate(source = "B_H c /ponderação e c /aspecto info"),
    data_list$B_l_return_weighted_tri_bal_info %>% mutate(source = "B_l c /ponderação e c /aspecto info"),
    data_list$s_H_return_weighted_tri_bal_info %>% mutate(source = "s_H c /ponderação e c /aspecto info"),
    data_list$s_l_return_weighted_tri_bal_info %>% mutate(source = "s_l c /ponderação e c /aspecto info"),
  )
  
  quarterly_data <- quarterly_data %>% mutate(quarter_year = paste(Ano, paste0("Q", trimestre), sep = "-"))

  # Gráfico com todos os anuais
  anual_plot <- ggplot(anual_data_return, aes(x = Ano, y = retorno, color = source)) +
    geom_line(size = 1) +
    geom_point(size = 2) +
    labs(
      title = "Desempenho das Carteiras - Retornos Anuais",
      x = "Ano",
      y = "Retorno Anual"
    ) +
    theme_minimal() +
    theme(
      legend.title = element_text(size = 10),
      legend.text = element_text(size = 8)
    )

  anual_plot_return_weighted <- ggplot(
    anual_data_return_weighted, aes(x = Ano, y = retorno, color = source
                                    )) +
    geom_line(size = 1) +
    geom_point(size = 2) +
    labs(
      title = "Desempenho das Carteiras - Retornos Anuais",
      x = "Ano",
      y = "Retorno Anual"
    ) +
    theme_minimal() +
    theme(
      legend.title = element_text(size = 10),
      legend.text = element_text(size = 8)
    )

  # Criar o gráfico trimestral
  quarterly_plot <- ggplot(quarterly_data, aes(x = quarter_year, y = retorno, color = source)) +
    geom_line(size = 1) +
    geom_point(size = 2) +
    labs(
      title = "Desempenho das Carteiras - Retornos Trimestrais",
      x = "Ano-Trimestre",
      y = "Retorno Trimestral"
    ) +
    theme_minimal() +
    theme(
      axis.text.x = element_text(angle = 45, hjust = 1),
      legend.title = element_text(size = 10),
      legend.text = element_text(size = 8)
    )




  anual_plot_acumulated <- ggplot(anual_data_return, aes(x = Ano, y = retorno_acumulado, color = source)) +
    geom_line(size = 1) +
    geom_point(size = 2) +
    labs(
      title = "Desempenho das Carteiras - Retornos Anuais",
      x = "Ano",
      y = "Retorno Anual"
    ) +
    theme_minimal() +
    theme(
      legend.title = element_text(size = 10),
      legend.text = element_text(size = 8)
    )

  anual_plot_return_weighted_acumulated <- ggplot(
    anual_data_return_weighted, aes(x = Ano, y = retorno_acumulado, color = source
    )) +
    geom_line(size = 1) +
    geom_point(size = 2) +
    labs(
      title = "Desempenho das Carteiras - Retornos Anuais",
      x = "Ano",
      y = "Retorno Anual"
    ) +
    theme_minimal() +
    theme(
      legend.title = element_text(size = 10),
      legend.text = element_text(size = 8)
    )

  # Criar o gráfico trimestral
  quarterly_plot_acumulated <- ggplot(quarterly_data, aes(x = quarter_year, y = retorno_acumulado, color = source)) +
    geom_line(size = 1) +
    geom_point(size = 2) +
    labs(
      title = "Desempenho das Carteiras - Retornos Trimestrais",
      x = "Ano-Trimestre",
      y = "Retorno Trimestral"
    ) +
    theme_minimal() +
    theme(
      axis.text.x = element_text(angle = 45, hjust = 1),
      legend.title = element_text(size = 10),
      legend.text = element_text(size = 8)
    )


  media_bar_plot_annual <- ggplot(media_anual, aes(x = reorder(.source, -retorno_medio), y = retorno_medio)) +
    geom_bar(stat = "identity", fill = "skyblue", color = "black") +
    theme_minimal() +
    labs(
      title = "Mediana de Retorno Anual por Carteira",
      x = "Carteira",
      y = "Mediana de Retorno Anual"
    ) +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    scale_y_continuous(labels = scales::percent_format(accuracy = 1))


  media_bar_plot_tri <- ggplot(media_tri, aes(x = reorder(.source, -retorno_medio), y = retorno_medio)) +
    geom_bar(stat = "identity", fill = "skyblue", color = "black") +
    theme_minimal() +
    labs(
      title = "Mediana de Retorno Trimestral por Carteira",
      x = "Carteira",
      y = "Mediana de Retorno Trimestral"
    ) +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    scale_y_continuous(labels = scales::percent_format(accuracy = 1))
  
  acumulado_bar_plot <- ggplot(retorno_acumulado, aes(x = reorder(.source, -retorno_acumulado), y = retorno_acumulado)) +
    geom_bar(stat = "identity", fill = "skyblue", color = "black") +
    theme_minimal() +
    labs(
      title = "Retorno Acumulado por Carteira",
      x = "Carteira",
      y = "Retorno acumulado"
    ) +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    scale_y_continuous(labels = scales::percent_format(accuracy = 1))
  
  return(list(
    anual_plot_line = anual_plot, 
    anual_plot_line_return_weighted = anual_plot_return_weighted, 
    tri_plot = quarterly_plot, 
    anual_acumulado = anual_plot_acumulated, 
    anual_return_weighted_acumulado = anual_plot_return_weighted_acumulated, 
    tri_acumulado_bar = quarterly_plot_acumulated, 
    mediana_anual_bar = media_bar_plot_annual,
    mediana_tri_bar = media_bar_plot_tri,
    acumulado_geral_bar = acumulado_bar_plot
    ))
}

graphs <- plot_graphs(data_list, media_list,accumalated_list)