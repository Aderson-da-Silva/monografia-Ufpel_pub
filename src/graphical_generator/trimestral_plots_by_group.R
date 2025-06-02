tri_median_return_data <- bind_rows(
  media_list$B_H_return_tri_bal %>% mutate(.source = "B_H s /ponderação"),
  media_list$B_H_return_tri_bal_info %>% mutate(.source = "B_H s /ponderação c /aspecto info"),
  
  media_list$B_H_return_weighted_tri_bal %>% mutate(.source = "B_H c /ponderação s /aspecto info"),
  media_list$B_H_return_weighted_tri_bal_info %>% mutate(.source = "B_H c /ponderação c /aspecto info"),
  
  media_list$B_H_return_markovitz_tri_bal %>% mutate(.source = "B_H Markovitz s /aspecto info"),
  media_list$B_H_return_markovitz_tri_bal_info %>% mutate(.source = "B_H Markovitz c /aspecto info"),
 
  
  
  media_list$B_l_return_tri_bal %>% mutate(.source = "B_l s /ponderação"),
  media_list$B_l_return_tri_bal_info %>% mutate(.source = "B_l s /ponderação c /aspecto info"),
  
  media_list$B_l_return_weighted_tri_bal %>% mutate(.source = "B_l c /ponderação s /aspecto info"),
  media_list$B_l_return_weighted_tri_bal_info %>% mutate(.source = "B_l c /ponderação c /aspecto info"),
  
  media_list$B_l_return_markovitz_tri_bal %>% mutate(.source = "B_l Markovitz s /aspecto info"),
  media_list$B_l_return_markovitz_tri_bal_info %>% mutate(.source = "B_l Markovitz c /aspecto info"),
  
  
  media_list$s_H_return_tri_bal %>% mutate(.source = "s_H s /ponderação"),
  media_list$s_H_return_tri_bal_info %>% mutate(.source = "s_H s /ponderação c /aspecto info"),
  
  media_list$s_H_return_weighted_tri_bal %>% mutate(.source = "s_H c /ponderação s /aspecto info"),
  media_list$s_H_return_weighted_tri_bal_info %>% mutate(.source = "s_H c /ponderação c /aspecto info"),
  
  media_list$s_H_return_markovitz_tri_bal %>% mutate(.source = "s_H Markovitz s /aspecto info"),
  media_list$s_H_return_markovitz_tri_bal_info %>% mutate(.source = "s_H Markovitz c /aspecto info"),
  
  
  media_list$s_l_return_tri_bal %>% mutate(.source = "s_l s /ponderação"),
  media_list$s_l_return_tri_bal_info %>% mutate(.source = "s_l s /ponderação c /aspecto info"),
  
  media_list$s_l_return_weighted_tri_bal %>% mutate(.source = "s_l c /ponderação s /aspecto info"),
  media_list$s_l_return_weighted_tri_bal_info %>% mutate(.source = "s_l c /ponderação c /aspecto info"),
  
  media_list$s_l_return_markovitz_tri_bal %>% mutate(.source = "s_l Markovitz s /aspecto info"),
  media_list$s_l_return_markovitz_tri_bal_info %>% mutate(.source = "s_l Markovitz c /aspecto info"),
)



bar_plot_trimestral_median <- ggplot(tri_median_return_data, aes(x = reorder(.source, -retorno_medio), y = retorno_medio)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  theme_minimal() +
  labs(
    title = "Mediana de trimestral por Carteira",
    x = "Carteira",
    y = "Mediana de Retorno trimestral"
  ) +
  theme(axis.text.x = element_text(size = 14, angle = 75, hjust = 1)) +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1))










#-------------------------- Acmulado para gráfico em linha --------------------------------------------------------------------------

tri_acumulated_return_data <- bind_rows(
  data_list$B_H_return_tri_bal %>% mutate(.source = "B_H s /ponderação"),
  data_list$B_H_return_weighted_tri_bal %>% mutate(.source = "B_H c /ponderação s /aspecto info"),
  data_list$B_H_return_markovitz_tri_bal %>% mutate(.source = "B_H Markovitz s /aspecto info"),
  data_list$B_l_return_tri_bal %>% mutate(.source = "B_l s /ponderação"),
  data_list$B_l_return_weighted_tri_bal %>% mutate(.source = "B_l c /ponderação s /aspecto info"),
  data_list$B_l_return_markovitz_tri_bal %>% mutate(.source = "B_l Markovitz s /aspecto info"),
  data_list$s_H_return_tri_bal %>% mutate(.source = "s_H s /ponderação"),
  data_list$s_H_return_weighted_tri_bal %>% mutate(.source = "s_H c /ponderação s /aspecto info"),
  data_list$s_H_return_markovitz_tri_bal %>% mutate(.source = "s_H Markovitz s /aspecto info"),
  data_list$s_l_return_tri_bal %>% mutate(.source = "s_l s /ponderação"),
  data_list$s_l_return_weighted_tri_bal %>% mutate(.source = "s_l c /ponderação s /aspecto info"),
  data_list$s_l_return_markovitz_tri_bal %>% mutate(.source = "s_l Markovitz s /aspecto info"),
)



tri_acumulated_return_data_info <- bind_rows(
  data_list$B_H_return_tri_bal_info %>% mutate(.source = "B_H s /ponderação c /aspecto info"),
  data_list$B_H_return_weighted_tri_bal_info %>% mutate(.source = "B_H c /ponderação c /aspecto info"),
  data_list$B_H_return_markovitz_tri_bal_info %>% mutate(.source = "B_H Markovitz c /aspecto info"),
  data_list$B_l_return_tri_bal_info %>% mutate(.source = "B_l s /ponderação c /aspecto info"),
  data_list$B_l_return_weighted_tri_bal_info %>% mutate(.source = "B_l c /ponderação c /aspecto info"),
  data_list$B_l_return_markovitz_tri_bal_info %>% mutate(.source = "B_l Markovitz c /aspecto info"),
  data_list$s_H_return_tri_bal_info %>% mutate(.source = "s_H s /ponderação c /aspecto info"),
  data_list$s_H_return_weighted_tri_bal_info %>% mutate(.source = "s_H c /ponderação c /aspecto info"),
  data_list$s_H_return_markovitz_tri_bal_info %>% mutate(.source = "s_H Markovitz c /aspecto info"),
  data_list$s_l_return_tri_bal_info %>% mutate(.source = "s_l s /ponderação c /aspecto info"),
  data_list$s_l_return_weighted_tri_bal_info %>% mutate(.source = "s_l c /ponderação c /aspecto info"),
  data_list$s_l_return_markovitz_tri_bal_info %>% mutate(.source = "s_l Markovitz c /aspecto info"),
)


quarterly_data <- tri_acumulated_return_data %>% mutate(quarter_year = paste(Ano, paste0("Q", trimestre), sep = "-"))
quarterly_data_info <- tri_acumulated_return_data_info %>% mutate(quarter_year = paste(Ano, paste0("Q", trimestre), sep = "-"))

tri_plot_acumulated_return <- ggplot(quarterly_data, aes(x = quarter_year, y = retorno_acumulado, color = .source, group = .source)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  labs(
    title = "Desempenho das Carteiras - Retornos Trimestrais acumulado - Sem aspecto informacional",
    x = "Quarter",
    y = "Retorno Trimestral acumulado"
  ) +
  theme_minimal() +
  theme(
    legend.title = element_text(lineheight  = 14),
    legend.text = element_text(size = 14)
  )


tri_plot_acumulated_return_info <- ggplot(quarterly_data_info, aes(x = quarter_year, y = retorno_acumulado, color = .source, group = .source)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  labs(
    title = "Desempenho das Carteiras - Retornos Trimestrais acumulado - Com aspecto informacional",
    x = "Quarter",
    y = "Retorno Trimestral acumulado"
  ) +
  theme_minimal() +
  theme(
    legend.title = element_text(lineheight  = 14),
    legend.text = element_text(size = 14)
  )