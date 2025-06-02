library(openxlsx)



alocacao_portifolios_planilha(most_efficient_portifolio_yearly_bal, "portifolios_markovitz_anual.xlsx")
alocacao_portifolios_planilha(most_efficient_portifolio_tri_bal, "portifolios_markovitz_trimestral.xlsx")


alocacao_portifolios_planilha <- function (data, name) {
  wb <- createWorkbook()
  
  sources <- unique(data$.source)
  
  # Iterar sobre cada valor único de .source
  for (source in sources) {
    # Filtrar as linhas correspondentes ao valor atual de .source
    filtered_data <- data %>%
      filter(.source == source) %>%
      unnest(weights) %>% # Desaninha a coluna weights
      mutate(
        risk = round(risk, 2),
        return = round(return, 2),
        `risco/retorno` = round(simplified_sharp_ratio, 2)
      ) %>% select(-simplified_sharp_ratio, -`.source`)
    
    # Adicionar uma nova planilha ao workbook
    addWorksheet(wb, sheetName = source)
    
    # Escrever os dados filtrados na planilha correspondente
    writeData(wb, sheet = source, x = filtered_data)
  }
  
  # Salvar o workbook em um arquivo Excel
  saveWorkbook(wb, file = name, overwrite = TRUE)
}





convert_returnos <- function() {
  wb <- createWorkbook()
  addWorksheet(wb, "Retornos")
  
  startRow <- 1
  startCol <- 1
  distance <- 2
  
  
  writeData(wb, sheet = "Retornos", x = B_H_return, startRow = startRow, startCol = startCol)
  
  startCol <- startCol + ncol(B_l_return) + distance
  writeData(wb, sheet = "Retornos", x = B_l_return, startRow = startRow, startCol = startCol)
  
  startCol <- startCol + ncol(s_H_return) + distance
  writeData(wb, sheet = "Retornos", x = s_H_return, startRow = startRow, startCol = startCol)
  
  startCol <- startCol + ncol(s_H_return) + distance
  writeData(wb, sheet = "Retornos", x = s_l_return, startRow = startRow, startCol = startCol)
  
  
  #Segunda linha de dados
  startCol <- 1
  startRow <- startRow + nrow(B_H_return_weighted) + distance + 1
  writeData(wb, sheet = "Retornos", x = B_H_return_weighted, startRow = startRow, startCol = startCol)
  
  startCol <- startCol + ncol(B_l_return_weighted) + distance
  writeData(wb, sheet = "Retornos", x = B_l_return_weighted, startRow = startRow, startCol = startCol)
  
  startCol <- startCol + ncol(s_H_return_weighted) + distance
  writeData(wb, sheet = "Retornos", x = s_H_return_weighted, startRow = startRow, startCol = startCol)
  
  startCol <- startCol + ncol(s_l_return_weighted) + distance
  writeData(wb, sheet = "Retornos", x = s_l_return_weighted, startRow = startRow, startCol = startCol)
  
  
  #Terceira linha de dados
  
  startCol <- 1
  startRow <- startRow + nrow(B_H_return_weighted_yearly_bal) + distance + 1
  writeData(wb, sheet = "Retornos", x = B_H_return_weighted_yearly_bal, startRow = startRow, startCol = startCol)
  
  startCol <- startCol + ncol(B_l_return_weighted_yearly_bal) + distance
  writeData(wb, sheet = "Retornos", x = B_l_return_weighted_yearly_bal, startRow = startRow, startCol = startCol)
  
  startCol <- startCol + ncol(s_H_return_weighted_yearly_bal) + distance
  writeData(wb, sheet = "Retornos", x = s_H_return_weighted_yearly_bal, startRow = startRow, startCol = startCol)
  
  startCol <- startCol + ncol(s_l_return_weighted_yearly_bal) + distance
  writeData(wb, sheet = "Retornos", x = s_l_return_weighted_yearly_bal, startRow = startRow, startCol = startCol)
  
  
  saveWorkbook(wb, "retornos_Aderson.xlsx", overwrite = TRUE)
}

convert_all_data <- function() {
  wb <- createWorkbook()
  
  addWorksheet(wb, sheetName = "Ret. d. carteira B/H por ação")
  addWorksheet(wb, sheetName = "Ret. d. carteira B/l por ação")
  addWorksheet(wb, sheetName = "Ret. d. carteira s/H por ação")
  addWorksheet(wb, sheetName = "Ret. d. carteira s/l por ação")
  addWorksheet(wb, sheetName = "Retorno d. da carteira B/H")
  addWorksheet(wb, sheetName = "Retorno d. da carteira B/l")
  addWorksheet(wb, sheetName = "Retorno d. da carteira s/H")
  addWorksheet(wb, sheetName = "Retorno d. da carteira s/l")
  addWorksheet(wb, sheetName = "Retorno anual da carteira B/H")
  addWorksheet(wb, sheetName = "Retorno anual da carteira B/l")
  addWorksheet(wb, sheetName = "Retorno anual da carteira s/H")
  addWorksheet(wb, sheetName = "Retorno anual da carteira s/l")
  addWorksheet(wb, sheetName = "Retorno Anual das ações")
  
  writeData(wb, sheet = "Ret. d. carteira B/H por ação", x = stock_prices_B_H)
  writeData(wb, sheet = "Ret. d. carteira B/l por ação", x = stock_prices_B_l)
  writeData(wb, sheet = "Ret. d. carteira s/H por ação", x = stock_prices_s_H)
  writeData(wb, sheet = "Ret. d. carteira s/l por ação", x = stock_prices_s_l)
  writeData(wb, sheet = "Retorno d. da carteira B/H", x = B_H_daily)
  writeData(wb, sheet = "Retorno d. da carteira B/l", x = B_l_daily)
  writeData(wb, sheet = "Retorno d. da carteira s/H", x = s_H_daily)
  writeData(wb, sheet = "Retorno d. da carteira s/l", x = s_l_daily)
  writeData(wb, sheet = "Retorno anual da carteira B/H", x = B_H_return)
  writeData(wb, sheet = "Retorno anual da carteira B/l", x = B_l_return)
  writeData(wb, sheet = "Retorno anual da carteira s/H", x = s_H_return)
  writeData(wb, sheet = "Retorno anual da carteira s/l", x = s_l_return)
  writeData(wb, sheet = "Retorno Anual das ações", x = stocks_anual_return)
  
  saveWorkbook(wb, "resultados_Aderson.xlsx", overwrite = TRUE)
}
