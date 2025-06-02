

unlink("/tmp/R*", recursive = TRUE)
zip_path = "dfp_data_cache_DFP/dfp_cia_aberta_2018.zip"
unzip(zip_path, exdir = tempdir())

files <- list.files(tempdir(), pattern = "*_cia_aberta_(BPP|BPA)_con_.*\\.csv$", full.names = TRUE)
csv_data <- map(files, ~read_delim(.x, delim = ";", show_col_types = FALSE))
abev_ativo <- csv_data[[1]] %>% filter(CNPJ_CIA == '07.526.557/0001-00')
abev_passivo <- csv_data[[2]] %>% filter(CNPJ_CIA == '07.526.557/0001-00')
write.csv(abev_ativo, "teste.csv") 
write.csv(abev_passivo, "teste2.csv") 
ptr_liq <- abev_passivo %>% filter(CD_CONTA == '2.03')
passivo_total <- sum(abev_passivo$VL_CONTA) 
ativo_total <- sum(abev_ativo$VL_CONTA)
bind_rows(csv_data[1], csv_data[2])
print(csv_data)

