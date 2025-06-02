
B_H_acumulated_return <- bind_rows(
  accumalated_list$B_H_return %>% mutate(.source = "B_H s /ponderação e s /bal"),
  accumalated_list$B_H_return_info %>% mutate(.source = "B_H s /ponderação e s /bal e c /aspecto info"),
  accumalated_list$B_H_return_yearly_bal %>% mutate(.source = "B_H s /ponderação e c /bal"),
  accumalated_list$B_H_return_yearly_bal_info %>% mutate(.source = "B_H s /ponderação e c /bal e c /aspecto info"),
  accumalated_list$B_H_return_weighted %>% mutate(.source = "B_H c /ponderação e s /bal"),
  accumalated_list$B_H_return_weighted_info %>% mutate(.source = "B_H c /ponderação e c /aspecto info"),
  accumalated_list$B_H_return_weighted_yearly_bal %>% mutate(.source = "B_H c /ponderação e c /bal e s /aspecto info"),
  accumalated_list$B_H_return_weighted_yearly_bal_info %>% mutate(.source = "B_H c /ponderação e c /bal e c /aspecto info"),
  
  
  accumalated_list$B_H_return_tri_bal %>% mutate(.source = "B_H s /ponderação e c /bal TRI"),
  accumalated_list$B_H_return_tri_bal_info %>% mutate(.source = "B_H s /ponderação e c /bal e c /aspecto info TRI"),
  accumalated_list$B_H_return_weighted_tri_bal %>% mutate(.source = "B_H c /ponderação e c /bal e s /aspecto info TRI"),
  accumalated_list$B_H_return_weighted_tri_bal_info %>% mutate(.source = "B_H c /ponderação e c /bal e c /aspecto info TRI"),
  
  accumalated_list$B_H_return_markovitz %>% mutate(.source = "B_H markovitz e s /bal"),
  accumalated_list$B_H_return_markovitz_info %>% mutate(.source = "B_H markovitz e c /aspecto info"),
  accumalated_list$B_H_return_markovitz_yearly_bal %>% mutate(.source = "B_H markovitz e c /bal e s /aspecto info"),
  accumalated_list$B_H_return_markovitz_yearly_bal_info %>% mutate(.source = "B_H markovitz c /bal e c /aspecto info"),
  
  accumalated_list$B_H_return_markovitz_tri_bal %>% mutate(.source = "B_H markovitz c /bal TRI"),
  accumalated_list$B_H_return_markovitz_tri_bal_info %>% mutate(.source = "B_H markovitz c /bal e /aspecto info TRI")
  
)

B_l_acumulated_return <- bind_rows(
  accumalated_list$B_l_return %>% mutate(.source = "B_l s /ponderação e s /bal"),
  accumalated_list$B_l_return_info %>% mutate(.source = "B_s s /ponderação e s /bal e c /aspecto info"),
  accumalated_list$B_l_return_yearly_bal %>% mutate(.source = "B_l s /ponderação e c /bal"),
  accumalated_list$B_l_return_yearly_bal_info  %>% mutate(.source = "B_l s /ponderação e c /bal e c /aspecto info"),
  accumalated_list$B_l_return_weighted %>% mutate(.source = "B_l c /ponderação e s /bal"),
  accumalated_list$B_l_return_weighted_info %>% mutate(.source = "B_l c /ponderação e c /aspecto info"),
  accumalated_list$B_l_return_weighted_yearly_bal %>% mutate(.source = "B_l c /ponderação e c /bal e s /aspecto info"),
  accumalated_list$B_l_return_weighted_yearly_bal_info %>% mutate(.source = "B_l c /ponderação e c /bal e c /aspecto info"),
  
  
  accumalated_list$B_l_return_tri_bal %>% mutate(.source = "B_l s /ponderação e c /bal TRI"),
  accumalated_list$B_l_return_tri_bal_info  %>% mutate(.source = "B_l s /ponderação e c /bal e c /aspecto info TRI"),
  accumalated_list$B_l_return_weighted_tri_bal %>% mutate(.source = "B_l c /ponderação e c /bal e s /aspecto info TRI"),
  accumalated_list$B_l_return_weighted_tri_bal_info %>% mutate(.source = "B_l c /ponderação e c /bal e c /aspecto info TRI"),
  
  accumalated_list$B_l_return_markovitz %>% mutate(.source = "B_l markovitz e s /bal"),
  accumalated_list$B_l_return_markovitz_info %>% mutate(.source = "B_l markovitz e c /aspecto info"),
  accumalated_list$B_l_return_markovitz_yearly_bal %>% mutate(.source = "B_l markovitz e c /bal e s /aspecto info"),
  accumalated_list$B_l_return_markovitz_yearly_bal_info %>% mutate(.source = "B_l markovitz e c /bal e c /aspecto info"),
  
  accumalated_list$B_l_return_markovitz_tri_bal %>% mutate(.source = "B_l markovitz c /bal TRI"),
  accumalated_list$B_l_return_markovitz_tri_bal_info %>% mutate(.source = "B_l markovitz c /bal e /aspecto info TRI"),
)

s_H_acumulated_return <- bind_rows(
  accumalated_list$s_H_return %>% mutate(.source = "s_H s /ponderação e s /bal"),
  accumalated_list$s_H_return_info %>% mutate(.source = "s_H s /ponderação e s /bal e c /aspecto info"),
  accumalated_list$s_H_return_yearly_bal %>% mutate(.source = "s_H s /ponderação e c /bal"),
  accumalated_list$s_H_return_yearly_bal_info %>% mutate(.source = "s_H s /ponderação e c /bal e c /aspecto info"),
  accumalated_list$s_H_return_weighted %>% mutate(.source = "s_H c /ponderação e s /bal"),
  accumalated_list$s_H_return_weighted_info %>% mutate(.source = "s_H c /ponderação e c /aspecto info"),
  accumalated_list$s_H_return_weighted_yearly_bal %>% mutate(.source = "s_H c /ponderação e c /bal e s /aspecto info"),
  accumalated_list$s_H_return_weighted_yearly_bal_info %>% mutate(.source = "s_H c /ponderação e c /bal e c /aspecto info"),
  
  
  accumalated_list$s_H_return_tri_bal %>% mutate(.source = "s_H s /ponderação e c /bal TRI"),
  accumalated_list$s_H_return_tri_bal_info %>% mutate(.source = "s_H s /ponderação e c /bal e c /aspecto info TRI"),
  accumalated_list$s_H_return_weighted_tri_bal %>% mutate(.source = "s_H c /ponderação e c /bal e s /aspecto info TRI"),
  accumalated_list$s_H_return_weighted_tri_bal_info %>% mutate(.source = "s_H c /ponderação e c /bal e c /aspecto info TRI"),
  
  
  accumalated_list$s_H_return_markovitz %>% mutate(.source = "s_H markovitz e s /bal"),
  accumalated_list$s_H_return_markovitz_info %>% mutate(.source = "s_H markovitz e c /aspecto info"),
  accumalated_list$s_H_return_markovitz_yearly_bal %>% mutate(.source = "s_H markovitz e c /bal e s /aspecto info"),
  accumalated_list$s_H_return_markovitz_yearly_bal_info %>% mutate(.source = "s_H markovitz e c /bal e c /aspecto info"),
  
  accumalated_list$s_H_return_markovitz_tri_bal %>% mutate(.source = "s_H markovitz c /bal TRI"),
  accumalated_list$s_H_return_markovitz_tri_bal_info %>% mutate(.source = "s_H markovitz c /bal e /aspecto info TRI"),
)

s_l_acumulated_return <- bind_rows(
  accumalated_list$s_l_return %>% mutate(.source = "s_l s /ponderação e s /bal"),
  accumalated_list$s_l_return_info %>% mutate(.source = "s_l s /ponderação e s /bal e c /aspecto info"),
  accumalated_list$s_l_return_yearly_bal %>% mutate(.source = "s_l s /ponderação e c /bal"),
  accumalated_list$s_l_return_yearly_bal_info %>% mutate(.source = "s_l s /ponderação e c /bal e c /aspecto info"),
  accumalated_list$s_l_return_weighted %>% mutate(.source = "s_l c /ponderação e s /bal"),
  accumalated_list$s_l_return_weighted_info %>% mutate(.source = "s_l c /ponderação e c /aspecto info"),
  accumalated_list$s_l_return_weighted_yearly_bal %>% mutate(.source = "s_l c /ponderação e c /bal e s /aspecto info"),
  accumalated_list$s_l_return_weighted_yearly_bal_info %>% mutate(.source = "s_l c /ponderação e c /bal e c /aspecto info"),
  
  
  accumalated_list$s_l_return_tri_bal %>% mutate(.source = "s_l s /ponderação e c /bal TRI"),
  accumalated_list$s_l_return_tri_bal_info %>% mutate(.source = "s_l s /ponderação e c /bal e c /aspecto info TRI"),
  accumalated_list$s_l_return_weighted_tri_bal %>% mutate(.source = "s_l c /ponderação e c /bal e s /aspecto info TRI"),
  accumalated_list$s_l_return_weighted_tri_bal_info %>% mutate(.source = "s_l c /ponderação e c /bal e c /aspecto info TRI"),
  
  
  accumalated_list$s_l_return_markovitz %>% mutate(.source = "s_l markovitz e s /bal"),
  accumalated_list$s_l_return_markovitz_info %>% mutate(.source = "s_l markovitz e c /aspecto info"),
  accumalated_list$s_l_return_markovitz_yearly_bal %>% mutate(.source = "s_l markovitz e c /bal e s /aspecto info"),
  accumalated_list$s_l_return_markovitz_yearly_bal_info %>% mutate(.source = "s_l markovitz e c /bal e c /aspecto info"),
  
  accumalated_list$s_l_return_markovitz_tri_bal %>% mutate(.source = "s_l markovitz c /bal TRI"),
  accumalated_list$s_l_return_markovitz_tri_bal_info %>% mutate(.source = "s_l markovitz c /bal e /aspecto info TRI"),
)


bar_plot_accumulated_B_H <- ggplot(B_H_acumulated_return, aes(x = reorder(.source, -retorno_acumulado), y = retorno_acumulado)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  theme_minimal() +
  labs(
    title = "Retorno Acumulado total por Carteira do grupo Big High",
    x = "Carteira",
    y = "Retorno Acumulado total"
  ) +
  theme(axis.text.x = element_text(size = 14, angle = 75, hjust = 1)) +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1))


bar_plot_accumulated_B_l <- ggplot(B_l_acumulated_return, aes(x = reorder(.source, -retorno_acumulado), y = retorno_acumulado)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  theme_minimal() +
  labs(
    title = "Retorno Acumulado total por Carteira  do grupo Big low",
    x = "Carteira",
    y = "Retorno Acumulado total"
  ) +
  theme(axis.text.x = element_text(size = 14, angle = 75, hjust = 1)) +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1))


bar_plot_accumulated_s_H <- ggplot(s_H_acumulated_return, aes(x = reorder(.source, -retorno_acumulado), y = retorno_acumulado)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  theme_minimal() +
  labs(
    title = "Retorno Acumulado total por Carteira do grupo small High",
    x = "Carteira",
    y = "Retorno Acumulado total"
  ) +
  theme(axis.text.x = element_text(size = 14, angle = 75, hjust = 1)) +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1))


bar_plot_accumulated_s_l <- ggplot(s_l_acumulated_return, aes(x = reorder(.source, -retorno_acumulado), y = retorno_acumulado)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  theme_minimal() +
  labs(
    title = "Retorno Acumulado total por Carteira  do grupo small low",
    x = "Carteira",
    y = "Retorno Acumulado total"
  ) +
  theme(axis.text.x = element_text(size = 14, angle = 75, hjust = 1)) +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1))