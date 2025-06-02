annual_B_H_median_return_data <- bind_rows(
  media_list$B_H_return %>% mutate(.source = "s /ponderação e s /bal"),
  media_list$B_H_return_info %>% mutate(.source = "s /ponderação e s /bal e c /aspecto info"),
  media_list$B_H_return_yearly_bal %>% mutate(.source = "s /ponderação e c /bal"),
  media_list$B_H_return_yearly_bal_info %>% mutate(.source = "s /ponderação e c /bal e c /aspecto info"),
  media_list$B_H_return_weighted %>% mutate(.source = "c /ponderação e s /bal"),
  media_list$B_H_return_weighted_info %>% mutate(.source = "c /ponderação e c /aspecto info"),
  media_list$B_H_return_weighted_yearly_bal %>% mutate(.source = "c /ponderação e c /bal e s /aspecto info"),
  media_list$B_H_return_weighted_yearly_bal_info %>% mutate(.source = "c /ponderação e c /bal e c /aspecto info"),
  
  media_list$B_H_return_markovitz %>% mutate(.source = "Markovitz s /bal e s /aspecto info"),
  media_list$B_H_return_markovitz_info %>% mutate(.source = "Markovitz s /bal e c /aspecto info"),
  media_list$B_H_return_markovitz_yearly_bal %>% mutate(.source = "Markovitz e c /bal e s /aspecto info"),
  media_list$B_H_return_markovitz_yearly_bal_info %>% mutate(.source = "Markovitz e c /bal e c /aspecto info"),
)

annual_B_l_median_return_data <- bind_rows( 
  media_list$B_l_return %>% mutate(.source = "s /ponderação e s /bal"),
  media_list$B_l_return_info %>% mutate(.source = "s /ponderação e s /bal e c /aspecto info"),
  media_list$B_l_return_yearly_bal %>% mutate(.source = "s /ponderação e c /bal"),
  media_list$B_l_return_yearly_bal_info  %>% mutate(.source = "s /ponderação e c /bal e c /aspecto info"),
  media_list$B_l_return_weighted %>% mutate(.source = "c /ponderação e s /bal"),
  media_list$B_l_return_weighted_info %>% mutate(.source = "c /ponderação e c /aspecto info"),
  media_list$B_l_return_weighted_yearly_bal %>% mutate(.source = "c /ponderação e c /bal e s /aspecto info"),
  media_list$B_l_return_weighted_yearly_bal_info %>% mutate(.source = "c /ponderação e c /bal e c /aspecto info"),
  
  media_list$B_l_return_markovitz %>% mutate(.source = "Markovitz s /bal e s /aspecto info"),
  media_list$B_l_return_markovitz_info %>% mutate(.source = "Markovitz s /bal e c /aspecto info"),
  media_list$B_l_return_markovitz_yearly_bal %>% mutate(.source = "Markovitz e c /bal e s /aspecto info"),
  media_list$B_l_return_markovitz_yearly_bal_info %>% mutate(.source = "Markovitz e c /bal e c /aspecto info"),
  
  )

annual_s_H_median_return_data  <- bind_rows(
  media_list$s_H_return %>% mutate(.source = "s /ponderação e s /bal"),
  media_list$s_H_return_info %>% mutate(.source = "s /ponderação e s /bal e c /aspecto info"),
  media_list$s_H_return_yearly_bal %>% mutate(.source = "s /ponderação e c /bal"),
  media_list$s_H_return_yearly_bal_info %>% mutate(.source = "s /ponderação e c /bal e c /aspecto info"),
  media_list$s_H_return_weighted %>% mutate(.source = "c /ponderação e s /bal"),
  media_list$s_H_return_weighted_info %>% mutate(.source = "c /ponderação e c /aspecto info"),
  media_list$s_H_return_weighted_yearly_bal %>% mutate(.source = "c /ponderação e c /bal e s /aspecto info"),
  media_list$s_H_return_weighted_yearly_bal_info %>% mutate(.source = "c /ponderação e c /bal e c /aspecto info"),
  
  media_list$s_H_return_markovitz %>% mutate(.source = "Markovitz s /bal e s /aspecto info"),
  media_list$s_H_return_markovitz_info %>% mutate(.source = "Markovitz s /bal e c /aspecto info"),
  media_list$s_H_return_markovitz_yearly_bal %>% mutate(.source = "Markovitz e c /bal e s /aspecto info"),
  media_list$s_H_return_markovitz_yearly_bal_info %>% mutate(.source = "Markovitz e c /bal e c /aspecto info"),
)

annual_s_l_median_return_data  <- bind_rows(
  media_list$s_l_return %>% mutate(.source = "s /ponderação e s /bal"),
  media_list$s_l_return_info %>% mutate(.source = "s /ponderação e s /bal e c /aspecto info"),
  media_list$s_l_return_yearly_bal %>% mutate(.source = "s /ponderação e c /bal"),
  media_list$s_l_return_yearly_bal_info %>% mutate(.source = "s /ponderação e c /bal e c /aspecto info"),
  media_list$s_l_return_weighted %>% mutate(.source = "c /ponderação e s /bal"),
  media_list$s_l_return_weighted_info %>% mutate(.source = "c /ponderação e c /aspecto info"),
  media_list$s_l_return_weighted_yearly_bal %>% mutate(.source = "c /ponderação e c /bal e s /aspecto info"),
  media_list$s_l_return_weighted_yearly_bal_info %>% mutate(.source = "c /ponderação e c /bal e c /aspecto info"),
  
  media_list$s_l_return_markovitz %>% mutate(.source = "Markovitz s /bal e s /aspecto info"),
  media_list$s_l_return_markovitz_info %>% mutate(.source = "Markovitz s /bal e c /aspecto info"),
  media_list$s_l_return_markovitz_yearly_bal %>% mutate(.source = "Markovitz e c /bal e s /aspecto info"),
  media_list$s_l_return_markovitz_yearly_bal_info %>% mutate(.source = "Markovitz e c /bal e c /aspecto info"),
)


bar_plot_annual_B_H <- ggplot(annual_B_H_median_return_data, aes(x = reorder(.source, -retorno_medio), y = retorno_medio)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  theme_minimal() +
  labs(
    title = "Mediana de Retorno Anual por Carteira do grupo Big High",
    x = "Carteira",
    y = "Mediana de Retorno Anual"
  ) +
  theme(axis.text.x = element_text(size = 14, angle = 60, hjust = 1)) +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1))


bar_plot_annual_B_l <- ggplot(annual_B_l_median_return_data, aes(x = reorder(.source, -retorno_medio), y = retorno_medio)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  theme_minimal() +
  labs(
    title = "Mediana de Retorno Anual por Carteira  do grupo Big low",
    x = "Carteira",
    y = "Mediana de Retorno Anual"
  ) +
  theme(axis.text.x = element_text(size = 14, angle = 60, hjust = 1)) +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1))


bar_plot_annual_s_H <- ggplot(annual_s_H_median_return_data, aes(x = reorder(.source, -retorno_medio), y = retorno_medio)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  theme_minimal() +
  labs(
    title = "Mediana de Retorno Anual por Carteira do grupo small High",
    x = "Carteira",
    y = "Mediana de Retorno Anual"
  ) +
  theme(axis.text.x = element_text(size = 14, angle = 60, hjust = 1)) +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1))


bar_plot_annual_s_l <- ggplot(annual_s_l_median_return_data, aes(x = reorder(.source, -retorno_medio), y = retorno_medio)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  theme_minimal() +
  labs(
    title = "Mediana de Retorno Anual por Carteira  do grupo small low",
    x = "Carteira",
    y = "Mediana de Retorno Anual"
  ) +
  theme(axis.text.x = element_text(size = 14, angle = 60, hjust = 1)) +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1))




#-------------------------- Acmulado para gráfico em linha --------------------------------------------------------------------------

annual_B_H_acumulated_return_data <- bind_rows(
  data_list$B_H_return %>% mutate(.source = "s /ponderação e s /bal"),
  data_list$B_H_return_info %>% mutate(.source = "s /ponderação e s /bal e c /aspecto info"),
  data_list$B_H_return_yearly_bal %>% mutate(.source = "s /ponderação e c /bal"),
  data_list$B_H_return_yearly_bal_info %>% mutate(.source = "s /ponderação e c /bal e c /aspecto info"),
  data_list$B_H_return_weighted %>% mutate(.source = "c /ponderação e s /bal"),
  data_list$B_H_return_weighted_info %>% mutate(.source = "c /ponderação e c /aspecto info"),
  data_list$B_H_return_weighted_yearly_bal %>% mutate(.source = "c /ponderação e c /bal e s /aspecto info"),
  data_list$B_H_return_weighted_yearly_bal_info %>% mutate(.source = "c /ponderação e c /bal e c /aspecto info"),
  
  data_list$B_H_return_markovitz %>% mutate(.source = "Markovitz s /bal e s /aspecto info"),
  data_list$B_H_return_markovitz_info %>% mutate(.source = "Markovitz s /bal e c /aspecto info"),
  data_list$B_H_return_markovitz_yearly_bal %>% mutate(.source = "Markovitz e c /bal e s /aspecto info"),
  data_list$B_H_return_markovitz_yearly_bal_info %>% mutate(.source = "Markovitz e c /bal e c /aspecto info"),
)

annual_B_l_acumulated_return_data <- bind_rows( 
  data_list$B_l_return %>% mutate(.source = "s /ponderação e s /bal"),
  data_list$B_l_return_info %>% mutate(.source = "s /ponderação e s /bal e c /aspecto info"),
  data_list$B_l_return_yearly_bal %>% mutate(.source = "s /ponderação e c /bal"),
  data_list$B_l_return_yearly_bal_info  %>% mutate(.source = "s /ponderação e c /bal e c /aspecto info"),
  data_list$B_l_return_weighted %>% mutate(.source = "c /ponderação e s /bal"),
  data_list$B_l_return_weighted_info %>% mutate(.source = "c /ponderação e c /aspecto info"),
  data_list$B_l_return_weighted_yearly_bal %>% mutate(.source = "c /ponderação e c /bal e s /aspecto info"),
  data_list$B_l_return_weighted_yearly_bal_info %>% mutate(.source = "c /ponderação e c /bal e c /aspecto info"),
  
  data_list$B_l_return_markovitz %>% mutate(.source = "Markovitz s /bal e s /aspecto info"),
  data_list$B_l_return_markovitz_info %>% mutate(.source = "Markovitz s /bal e c /aspecto info"),
  data_list$B_l_return_markovitz_yearly_bal %>% mutate(.source = "Markovitz e c /bal e s /aspecto info"),
  data_list$B_l_return_markovitz_yearly_bal_info %>% mutate(.source = "Markovitz e c /bal e c /aspecto info"),
  
)

annual_s_H_acumulated_return_data  <- bind_rows(
  data_list$s_H_return %>% mutate(.source = "s /ponderação e s /bal"),
  data_list$s_H_return_info %>% mutate(.source = "s /ponderação e s /bal e c /aspecto info"),
  data_list$s_H_return_yearly_bal %>% mutate(.source = "s /ponderação e c /bal"),
  data_list$s_H_return_yearly_bal_info %>% mutate(.source = "s /ponderação e c /bal e c /aspecto info"),
  data_list$s_H_return_weighted %>% mutate(.source = "c /ponderação e s /bal"),
  data_list$s_H_return_weighted_info %>% mutate(.source = "c /ponderação e c /aspecto info"),
  data_list$s_H_return_weighted_yearly_bal %>% mutate(.source = "c /ponderação e c /bal e s /aspecto info"),
  data_list$s_H_return_weighted_yearly_bal_info %>% mutate(.source = "c /ponderação e c /bal e c /aspecto info"),
  
  data_list$s_H_return_markovitz %>% mutate(.source = "Markovitz s /bal e s /aspecto info"),
  data_list$s_H_return_markovitz_info %>% mutate(.source = "Markovitz s /bal e c /aspecto info"),
  data_list$s_H_return_markovitz_yearly_bal %>% mutate(.source = "Markovitz e c /bal e s /aspecto info"),
  data_list$s_H_return_markovitz_yearly_bal_info %>% mutate(.source = "Markovitz e c /bal e c /aspecto info"),
)

annual_s_l_acumulated_return_data  <- bind_rows(
  data_list$s_l_return %>% mutate(.source = "s /ponderação e s /bal"),
  data_list$s_l_return_info %>% mutate(.source = "s /ponderação e s /bal e c /aspecto info"),
  data_list$s_l_return_yearly_bal %>% mutate(.source = "s /ponderação e c /bal"),
  data_list$s_l_return_yearly_bal_info %>% mutate(.source = "s /ponderação e c /bal e c /aspecto info"),
  data_list$s_l_return_weighted %>% mutate(.source = "c /ponderação e s /bal"),
  data_list$s_l_return_weighted_info %>% mutate(.source = "c /ponderação e c /aspecto info"),
  data_list$s_l_return_weighted_yearly_bal %>% mutate(.source = "c /ponderação e c /bal e s /aspecto info"),
  data_list$s_l_return_weighted_yearly_bal_info %>% mutate(.source = "c /ponderação e c /bal e c /aspecto info"),
  
  data_list$s_l_return_markovitz %>% mutate(.source = "Markovitz s /bal e s /aspecto info"),
  data_list$s_l_return_markovitz_info %>% mutate(.source = "Markovitz s /bal e c /aspecto info"),
  data_list$s_l_return_markovitz_yearly_bal %>% mutate(.source = "Markovitz e c /bal e s /aspecto info"),
  data_list$s_l_return_markovitz_yearly_bal_info %>% mutate(.source = "Markovitz e c /bal e c /aspecto info"),
)

anual_plot_acumulated_B_H_return <- ggplot(annual_B_H_acumulated_return_data, aes(x = Ano, y = retorno_acumulado, color = .source)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  labs(
    title = "Desempenho das Carteiras - Retornos Anuais acumulado",
    x = "Ano",
    y = "Retorno Anual acumulado"
  ) +
  theme_minimal() +
  theme(
    legend.title = element_text(lineheight  = 14),
    legend.text = element_text(size = 14)
  )

anual_plot_acumulated_B_l_return <- ggplot(annual_B_l_acumulated_return_data, aes(x = Ano, y = retorno_acumulado, color = .source)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  labs(
    title = "Desempenho das Carteiras - Retornos Anuais acumulado",
    x = "Ano",
    y = "Retorno Anual acumulado"
  ) +
  theme_minimal() +
  theme(
    legend.title = element_text(lineheight  = 14),
    legend.text = element_text(size = 14)
  )


anual_plot_acumulated_s_H_return <- ggplot(annual_s_H_acumulated_return_data, aes(x = Ano, y = retorno_acumulado, color = .source)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  labs(
    title = "Desempenho das Carteiras - Retornos Anuais acumulado",
    x = "Ano",
    y = "Retorno Anual acumulado"
  ) +
  theme_minimal() +
  theme(
    legend.title = element_text(lineheight  = 14),
    legend.text = element_text(size = 14)
  )


anual_plot_acumulated_s_l_return <- ggplot(annual_s_l_acumulated_return_data, aes(x = Ano, y = retorno_acumulado, color = .source)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  labs(
    title = "Desempenho das Carteiras - Retornos Anuais acumulado",
    x = "Ano",
    y = "Retorno Anual acumulado"
  ) +
  theme_minimal() +
  theme(
    legend.title = element_text(lineheight  = 14),
    legend.text = element_text(size = 14)
  )