library(rvest)
library(httr)

url_itr <- "https://dados.cvm.gov.br/dados/CIA_ABERTA/DOC/ITR/DADOS/"
url_dfp <- "https://dados.cvm.gov.br/dados/CIA_ABERTA/DOC/DFP/DADOS/"


# Diretório onde os arquivos ZIP serão salvos
download_dir <- "dfp_data_cache_ITR"
download_dir2 <- "dfp_data_cache_DFP"

# Criar o diretório, se não existir
if (!dir.exists(download_dir)) {
  dir.create(download_dir)
}
if (!dir.exists(download_dir2)) {
  dir.create(download_dir2)
}


page <- read_html(url_itr)
# Extrair todos os links da página
links <- page %>%
  html_nodes("a") %>%
  html_attr("href") %>%
  grep("\\.zip$", ., value = TRUE)  # Filtrar apenas links que terminam com '.zip'

# Filtrar os links que contêm os anos de 2018 a 2022
filtered_links <- links[grepl("2017|2018|2019|2020|2021|2022|2023|2024", links)]




# Função para baixar os arquivos ZIP
download_files <- function(links) {
  for (link in links) {
    # Criar o nome do arquivo
    file_name <- basename(link)
    
    # Fazer o download do arquivo
    download_url <- paste0(url_itr, link)
    
    # Caminho completo onde o arquivo será salvo
    dest_file <- file.path(download_dir, file_name)
    
    # Baixar o arquivo
    GET(download_url, write_disk(dest_file, overwrite = TRUE))
    
    print(paste("Baixando:", file_name))
  }
}

# Baixar os arquivos
download_files(filtered_links)




page <- read_html(url_dfp)
# Extrair todos os links da página
links <- page %>%
  html_nodes("a") %>%
  html_attr("href") %>%
  grep("\\.zip$", ., value = TRUE)  # Filtrar apenas links que terminam com '.zip'

# Filtrar os links que contêm os anos de 2018 a 2022
filtered_links <- links[grepl("2017|2018|2019|2020|2021|2022|2023|2024", links)]


download_files <- function(links) {
  for (link in links) {
    # Criar o nome do arquivo
    file_name <- basename(link)
    
    # Fazer o download do arquivo
    download_url <- paste0(url_dfp, link)
    
    # Caminho completo onde o arquivo será salvo
    dest_file <- file.path(download_dir2, file_name)
    
    # Baixar o arquivo
    GET(download_url, write_disk(dest_file, overwrite = TRUE))
    
    print(paste("Baixando:", file_name))
  }
}

# Baixar os arquivos
download_files(filtered_links)


#Pegando informes relacionados a quantidade de ações ordinárias e preferênciais das empresas ano a ano
url_fre <- "https://dados.cvm.gov.br/dados/CIA_ABERTA/DOC/FRE/DADOS/"
download_dir <- "fre_data_cache"
if (!dir.exists(download_dir)) {
  dir.create(download_dir)
}

page <- read_html(url_fre)
# Extrair todos os links da página
links <- page %>%
  html_nodes("a") %>%
  html_attr("href") %>%
  grep("\\.zip$", ., value = TRUE)  # Filtrar apenas links que terminam com '.zip'

# Filtrar os links que contêm os anos de 2018 a 2022
filtered_links <- links[grepl("2017|2018|2019|2020|2021|2022|2023|2024", links)]




# Função para baixar os arquivos ZIP
download_files <- function(links) {
  for (link in links) {
    # Criar o nome do arquivo
    file_name <- basename(link)
    
    # Fazer o download do arquivo
    download_url <- paste0(url_fre, link)
    
    # Caminho completo onde o arquivo será salvo
    dest_file <- file.path(download_dir, file_name)
    
    # Baixar o arquivo
    GET(download_url, write_disk(dest_file, overwrite = TRUE))
    
    print(paste("Baixando:", file_name))
  }
}

# Baixar os arquivos
download_files(filtered_links)

