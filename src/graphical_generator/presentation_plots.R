# Gráfico para B_H (Big High)
ggplot(dados_combinados_retorno_B_H, aes(x = date, y = accumulated_daily_return, color = portifolio)) +
  geom_line(linewidth = 0.8) +
  scale_color_manual(
    values = c(
      "Fama&French sem balanceamento" = "#1f77b4",
      "Fama&French com balanceamento" = "#ff7f0e", 
      "Markowitz sem balanceamento" = "#2ca02c",
      "Markowitz com balanceamento" = "#d62728",
      "IBOV" = "#3d2c7e",
      "SELIC" = "#F564A9"
    )
  ) +
  labs(
    title = "Retorno Acumulado das carteiras Big High",
    x = "Data",
    y = "Retorno Acumulado",
    color = "Portfólio"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")

# Gráfico para B_l (Big Low)
ggplot(dados_combinados_retorno_B_l, aes(x = date, y = accumulated_daily_return, color = portifolio)) +
  geom_line(linewidth = 0.8) +
  scale_color_manual(
    values = c(
      "Fama&French Sem balanceamento" = "#1f77b4",
      "Fama&French Com balanceamento" = "#ff7f0e", 
      "Markowitz sem balanceamento" = "#2ca02c",
      "Markowitz com balanceamento" = "#d62728",
      "IBOV" = "#3d2c7e",
      "SELIC" = "#F564A9"
    )
  ) +
  labs(
    title = "Retorno Acumulado das carteiras Big Low",
    x = "Data",
    y = "Retorno Acumulado",
    color = "Portfólio"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")

# Gráfico para s_H (Small High)
ggplot(dados_combinados_retorno_s_H, aes(x = date, y = accumulated_daily_return, color = portifolio)) +
  geom_line(linewidth = 0.8) +
  scale_color_manual(
    values = c(
      "Fama&French Sem balanceamento" = "#1f77b4",
      "Fama&French Com balanceamento" = "#ff7f0e", 
      "Markowitz sem balanceamento" = "#2ca02c",
      "Markowitz com balanceamento" = "#d62728",
      "IBOV" = "#3d2c7e",
      "SELIC" = "#F564A9"
    )
  ) +
  labs(
    title = "Retorno Acumulado das carteiras Small High",
    x = "Data",
    y = "Retorno Acumulado",
    color = "Portfólio"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")

# Gráfico para s_l (Small Low)
ggplot(dados_combinados_retorno_s_l, aes(x = date, y = accumulated_daily_return, color = portifolio)) +
  geom_line(linewidth = 0.8) +
  scale_color_manual(
    values = c(
      "Fama&French Sem balanceamento" = "#1f77b4",
      "Fama&French Com balanceamento" = "#ff7f0e", 
      "Markowitz sem balanceamento" = "#2ca02c",
      "Markowitz com balanceamento" = "#d62728",
      "IBOV" = "#3d2c7e",
      "SELIC" = "#F564A9"
    )
  ) +
  labs(
    title = "Retorno Acumulado das carteiras Small Low",
    x = "Data",
    y = "Retorno Acumulado",
    color = "Portfólio"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")





# Gráfico para B_H_info (Big High Info)
ggplot(dados_combinados_retorno_B_H_info, aes(x = date, y = accumulated_daily_return, color = portifolio)) +
  geom_line(linewidth = 0.8) +
  scale_color_manual(
    values = c(
      "Fama&French sem balanceamento" = "#1f77b4",
      "Fama&French com balanceamento" = "#ff7f0e", 
      "Markowitz sem balanceamento" = "#2ca02c",
      "Markowitz com balanceamento" = "#d62728",
      "IBOV" = "#3d2c7e",
      "SELIC" = "#F564A9"
    )
  ) +
  labs(
    title = "Retorno Acumulado das carteiras Big High (Com aspecto informacional)",
    x = "Data",
    y = "Retorno Acumulado",
    color = "Portfólio"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")

# Gráfico para B_l_info (Big Low Info)
ggplot(dados_combinados_retorno_B_l_info, aes(x = date, y = accumulated_daily_return, color = portifolio)) +
  geom_line(linewidth = 0.8) +
  scale_color_manual(
    values = c(
      "Fama&French sem balanceamento" = "#1f77b4",
      "Fama&French com balanceamento" = "#ff7f0e", 
      "Markowitz sem balanceamento" = "#2ca02c",
      "Markowitz com balanceamento" = "#d62728",
      "IBOV" = "#3d2c7e",
      "SELIC" = "#F564A9"
    )
  ) +
  labs(
    title = "Retorno Acumulado das carteiras Big Low (Com aspecto informacional)",
    x = "Data",
    y = "Retorno Acumulado",
    color = "Portfólio"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")

# Gráfico para s_H_info (Small High Info)
ggplot(dados_combinados_retorno_s_H_info, aes(x = date, y = accumulated_daily_return, color = portifolio)) +
  geom_line(linewidth = 0.8) +
  scale_color_manual(
    values = c(
      "Fama&French sem balanceamento" = "#1f77b4",
      "Fama&French com balanceamento" = "#ff7f0e", 
      "Markowitz sem balanceamento" = "#2ca02c",
      "Markowitz com balanceamento" = "#d62728",
      "IBOV" = "#3d2c7e",
      "SELIC" = "#F564A9"
    )
  ) +
  labs(
    title = "Retorno Acumulado das carteiras Small High (Com aspecto informacional)",
    x = "Data",
    y = "Retorno Acumulado",
    color = "Portfólio"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")

# Gráfico para s_l_info (Small Low Info)
ggplot(dados_combinados_retorno_s_l_info, aes(x = date, y = accumulated_daily_return, color = portifolio)) +
  geom_line(linewidth = 0.8) +
  scale_color_manual(
    values = c(
      "Fama&French sem balanceamento" = "#1f77b4",
      "Fama&French com balanceamento" = "#ff7f0e", 
      "Markowitz sem balanceamento" = "#2ca02c",
      "Markowitz com balanceamento" = "#d62728",
      "IBOV" = "#3d2c7e",
      "SELIC" = "#F564A9"
    )
  ) +
  labs(
    title = "Retorno Acumulado das carteiras Small Low (Com aspecto informacional)",
    x = "Data",
    y = "Retorno Acumulado",
    color = "Portfólio"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")



# Gráfico para comparação das estratégias Markowitz sem grupos
ggplot(dados_combinados_retorno_only_markowitz, aes(x = date, y = accumulated_daily_return, color = portifolio)) +
  geom_line(linewidth = 0.8) +
  scale_color_manual(
    values = c(
      "Sem balanceamento e sem aspecto informacional" = "#1f77b4",
      "Sem balanceamento e com aspecto informacional" = "#ff7f0e",
      "Com balanceamento e sem aspecto informacional" = "#2ca02c",
      "Com balanceamento e com aspecto informacional" = "#d62728",
      "IBOV" = "#3d2c7e",
      "SELIC" = "#F564A9"
    )
  ) +
  labs(
    title = "Retorno Acumulado das carterias sem divisão por grupos ponderadas por Markowiwz",
    x = "Data",
    y = "Retorno Acumulado",
    color = "Portfólio"
  ) +
  theme_minimal() +
  theme(
    legend.position = "bottom",
  ) +
  guides(color = guide_legend(ncol = 2))
library(ggplot2)
library(dplyr)

# Gráfico 1: Carteiras COM aspecto informacional
grafico_com_info <- carteiras_com_info %>%
  mutate(portifolio = reorder(portifolio, sharpe_medio)) %>%
  ggplot(aes(x = portifolio, y = sharpe_medio, fill = portifolio)) +
  geom_bar(stat = "identity", show.legend = FALSE, alpha = 0.8) +
  coord_flip() +
  labs(
    title = "Índice de Sharpe Médio - Carteiras COM Aspecto Informacional",
    subtitle = "Comparação das diferentes estratégias de investimento",
    x = "Portfolio",
    y = "Sharpe Médio",
    caption = "Fonte: Análise própria"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold"),
    plot.subtitle = element_text(size = 12),
    axis.text.y = element_text(size = 10),
    axis.text.x = element_text(size = 10),
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank()
  ) +
  scale_fill_viridis_d(option = "plasma") +
  geom_text(aes(label = round(sharpe_medio, 3)), 
            hjust = -0.1, size = 3, color = "black")

# Gráfico 2: Carteiras SEM aspecto informacional
grafico_sem_info <- carteiras_sem_info %>%
  mutate(portifolio = reorder(portifolio, sharpe_medio)) %>%
  ggplot(aes(x = portifolio, y = sharpe_medio, fill = portifolio)) +
  geom_bar(stat = "identity", show.legend = FALSE, alpha = 0.8) +
  coord_flip() +
  labs(
    title = "Índice de Sharpe Médio - Carteiras SEM Aspecto Informacional",
    subtitle = "Comparação das diferentes estratégias de investimento",
    x = "Portfolio",
    y = "Sharpe Médio",
    caption = "Fonte: Análise própria"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold"),
    plot.subtitle = element_text(size = 12),
    axis.text.y = element_text(size = 10),
    axis.text.x = element_text(size = 10),
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank()
  ) +
  scale_fill_viridis_d(option = "viridis") +
  geom_text(aes(label = round(sharpe_medio, 3)), 
            hjust = -0.1, size = 3, color = "black")

# Exibir os gráficos
print(grafico_com_info)
print(grafico_sem_info)
