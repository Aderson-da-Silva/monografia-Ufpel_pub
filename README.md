# Monografia UFPEL

Um software para testar o modelo de carteiras de **MARKOWITZ**, **FAMA & FRENCH**.

A software to test **MARKOWITZ** and **FAMA & FRENCH** portfolio models.

---

## 🇧🇷 Português

### Pré-requisitos

- R (versão mais recente)
- RStudio (versão mais recente)

### Instalação e Execução

#### Passo 1: Configuração do Ambiente
1. Certifique-se de ter a versão mais recente do R e RStudio instalados
2. Clone o repositório para sua máquina local
3. Abra o arquivo `src/headers/header.R`
4. Execute o arquivo para instalar todas as bibliotecas necessárias

#### Passo 2: Coleta de Dados da CVM (PRIMEIRA EXECUÇÃO)
⚠️ **IMPORTANTE**: Na primeira execução do projeto, é obrigatório executar este passo.

1. Navegue até `src/dataScraping.R`
2. Este arquivo é responsável por coletar dados de balanço do site da CVM
3. Instale quaisquer bibliotecas adicionais que ainda não estejam instaladas
4. Execute o código completamente
5. **Aguarde o download**: Este processo irá baixar e criar as seguintes pastas com dados:
   - `dfp_data_cache_DFP/` - Demonstrações Financeiras Padronizadas (2017-2024)
   - `dfp_data_cache_ITR/` - Informações Trimestrais (2017-2024)
   - `fre_data_cache/` - Formulário de Referência (2017-2024)
   - `gdfpd2_cache/` - Cache de dados processados

#### Passo 3: Execução Principal
1. Após todos os arquivos serem baixados, navegue até `src/main.R`
2. Abra o arquivo no RStudio
3. Execute o código na íntegra
4. Ao final da execução, todos os resultados estarão disponíveis em diversas variáveis no formato `list of tibbles`

### Estrutura do Projeto

```
monografia-Ufpel/
├── src/                                    # Código fonte principal
│   ├── headers/                           # Configurações e bibliotecas
│   │   ├── header.R                       # Bibliotecas principais
│   │   ├── markovitz_header.R            # Bibliotecas específicas Markowitz
│   │   └── models.R                       # Modelos matemáticos
│   ├── calc_algs/                         # Algoritmos de cálculo
│   │   ├── final_calc.R                   # Cálculos finais
│   │   ├── market_value_weighted_calc.R   # Cálculos ponderados por valor
│   │   ├── markovitz_calc.R              # Algoritmo Markowitz
│   │   └── only_markovitz_calc.R         # Markowitz isolado
│   ├── graphical_generator/               # Geração de gráficos e relatórios
│   │   ├── acumulated_return_plots_by_group.R
│   │   ├── anual_plots_by_group.R
│   │   ├── data_to_spreadsheet.R
│   │   ├── plot_data_genera.R
│   │   └── trimestral_plots_by_group.R
│   ├── tests/                             # Testes
│   │   └── teste.R
│   ├── dataScraping.R                     # ⭐ Coleta de dados CVM
│   └── main.R                             # ⭐ Arquivo principal
├── dfp_data_cache_DFP/                    # Dados DFP da CVM (2017-2024)
├── dfp_data_cache_ITR/                    # Dados ITR da CVM (2017-2024)
├── fre_data_cache/                        # Dados FRE da CVM (2017-2024)
├── gdfpd2_cache/                          # Cache de dados processados
├── dados_armazenados/                     # Resultados salvos
├── docs/                                  # Documentação e dados auxiliares
├── legacy/                                # Código legado/depreciado
├── *.xlsx                                 # Planilhas de resultados
├── docker-compose.yml                     # Configuração Docker
├── Dockerfile                             # Container Docker
└── README.md
```

### Arquivos de Saída

Após a execução, o sistema gera diversos arquivos de resultado:
- `portifolios_markovitz_anual.xlsx` - Portfólios anuais Markowitz
- `portifolios_markovitz_trimestral.xlsx` - Portfólios trimestrais Markowitz
- `all_returns_markovitz_difference.xlsx` - Comparação de retornos
- `analise_financeira.xlsx` - Análise financeira completa
- `diferenca_media_anual.xlsx` - Diferenças médias anuais

### Suporte e Contribuição

- **Problemas**: Abra uma issue no GitHub que tentarei auxiliar
- **Contribuições**: Entre em contato antes de contribuir
- **Status**: Esta é uma primeira versão - ainda há muito a ser aprimorado

---

## 🇺🇸 English

### Prerequisites

- R (latest version)
- RStudio (latest version)

### Installation and Execution

#### Step 1: Environment Setup
1. Make sure you have the latest versions of R and RStudio installed
2. Clone the repository to your local machine
3. Open the file `src/headers/header.R`
4. Run the file to install all required libraries

#### Step 2: CVM Data Collection (FIRST RUN)
⚠️ **IMPORTANT**: On the first project execution, this step is mandatory.

1. Navigate to `src/dataScraping.R`
2. This file is responsible for collecting balance sheet data from the CVM website
3. Install any additional libraries that are not yet installed
4. Execute the code completely
5. **Wait for download**: This process will download and create the following data folders:
   - `dfp_data_cache_DFP/` - Standardized Financial Statements (2017-2024)
   - `dfp_data_cache_ITR/` - Quarterly Information (2017-2024)
   - `fre_data_cache/` - Reference Forms (2017-2024)
   - `gdfpd2_cache/` - Processed data cache

#### Step 3: Main Execution
1. After all files are downloaded, navigate to `src/main.R`
2. Open the file in RStudio
3. Execute the code in its entirety
4. At the end of execution, all results will be available in various variables in `list of tibbles` format

### Project Structure

```
monografia-Ufpel/
├── src/                                    # Main source code
│   ├── headers/                           # Settings and libraries
│   │   ├── header.R                       # Main libraries
│   │   ├── markovitz_header.R            # Markowitz specific libraries
│   │   └── models.R                       # Mathematical models
│   ├── calc_algs/                         # Calculation algorithms
│   │   ├── final_calc.R                   # Final calculations
│   │   ├── market_value_weighted_calc.R   # Market value weighted calculations
│   │   ├── markovitz_calc.R              # Markowitz algorithm
│   │   └── only_markovitz_calc.R         # Isolated Markowitz
│   ├── graphical_generator/               # Graphics and reports generation
│   │   ├── acumulated_return_plots_by_group.R
│   │   ├── anual_plots_by_group.R
│   │   ├── data_to_spreadsheet.R
│   │   ├── plot_data_genera.R
│   │   └── trimestral_plots_by_group.R
│   ├── tests/                             # Tests
│   │   └── teste.R
│   ├── dataScraping.R                     # ⭐ CVM data collection
│   └── main.R                             # ⭐ Main file
├── dfp_data_cache_DFP/                    # CVM DFP data (2017-2024)
├── dfp_data_cache_ITR/                    # CVM ITR data (2017-2024)
├── fre_data_cache/                        # CVM FRE data (2017-2024)
├── gdfpd2_cache/                          # Processed data cache
├── dados_armazenados/                     # Stored results
├── docs/                                  # Documentation and auxiliary data
├── legacy/                                # Legacy/deprecated code
├── *.xlsx                                 # Result spreadsheets
├── docker-compose.yml                     # Docker configuration
├── Dockerfile                             # Docker container
└── README.md
```

### Output Files

After execution, the system generates various result files:
- `portifolios_markovitz_anual.xlsx` - Annual Markowitz portfolios
- `portifolios_markovitz_trimestral.xlsx` - Quarterly Markowitz portfolios
- `all_returns_markovitz_difference.xlsx` - Returns comparison
- `analise_financeira.xlsx` - Complete financial analysis
- `diferenca_media_anual.xlsx` - Annual average differences

### Support and Contribution

- **Issues**: Open an issue on GitHub and I'll try to help
- **Contributions**: Please contact me before contributing
- **Status**: This is a first version - there's still much to be improved

---

## 🐳 Docker Support

O projeto inclui suporte ao Docker para facilitar a execução:

The project includes Docker support for easier execution:

```bash
docker-compose up
```

---

## 📊 About the Models

This software implements and tests:
- **Markowitz Portfolio Theory**: Modern portfolio theory for optimal asset allocation
- **Fama & French Model**: Multi-factor model for asset pricing

Este software implementa e testa:
- **Teoria de Portfólio de Markowitz**: Teoria moderna de portfólio para alocação ótima de ativos
- **Modelo Fama & French**: Modelo multifatorial para precificação de ativos

---

## 📈 Data Sources

- **CVM (Comissão de Valores Mobiliários)**: Brazilian securities regulator
- **B3 (Brasil Bolsa Balcão)**: Brazilian stock exchange data
- **Financial statements from 2017-2024**

---

## 📝 License

Este projeto está em desenvolvimento como parte de uma monografia da UFPEL.

This project is under development as part of a UFPEL monograph.
