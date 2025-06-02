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
2. Abra o arquivo `src/headers/header.R`
3. Execute o arquivo para instalar todas as bibliotecas necessárias

#### Passo 2: Coleta de Dados
1. Navegue até `src/dataScraping.R`
2. Este arquivo é responsável por coletar dados de balanço do site da CVM
3. Instale quaisquer bibliotecas adicionais que ainda não estejam instaladas
4. Execute o código completamente

#### Passo 3: Execução Principal
1. Após todos os arquivos serem baixados, navegue até `src/main.R`
2. Abra o arquivo no RStudio
3. Execute o código na íntegra
4. Ao final da execução, todos os resultados estarão disponíveis em diversas variáveis no formato `list of tibbles`

### Estrutura do Projeto

```
monografia-Ufpel/
├── src/
│   ├── headers/
│   │   └── header.R          # Bibliotecas necessárias
│   ├── dataScraping.R        # Coleta de dados da CVM
│   └── main.R                # Arquivo principal de execução
└── README.md
```

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
2. Open the file `src/headers/header.R`
3. Run the file to install all required libraries

#### Step 2: Data Collection
1. Navigate to `src/dataScraping.R`
2. This file is responsible for collecting balance sheet data from the CVM website
3. Install any additional libraries that are not yet installed
4. Execute the code completely

#### Step 3: Main Execution
1. After all files are downloaded, navigate to `src/main.R`
2. Open the file in RStudio
3. Execute the code in its entirety
4. At the end of execution, all results will be available in various variables in `list of tibbles` format

### Project Structure

```
monografia-Ufpel/
├── src/
│   ├── headers/
│   │   └── header.R          # Required libraries
│   ├── dataScraping.R        # CVM data collection
│   └── main.R                # Main execution file
└── README.md
```

### Support and Contribution

- **Issues**: Open an issue on GitHub and I'll try to help
- **Contributions**: Please contact me before contributing
- **Status**: This is a first version - there's still much to be improved

---

## 📊 About the Models

This software implements and tests:
- **Markowitz Portfolio Theory**: Modern portfolio theory for optimal asset allocation
- **Fama & French Model**: Multi-factor model for asset pricing

Este software implementa e testa:
- **Teoria de Portfólio de Markowitz**: Teoria moderna de portfólio para alocação ótima de ativos
- **Modelo Fama & French**: Modelo multifatorial para precificação de ativos

---

## 📝 License

Este projeto está em desenvolvimento como parte de uma monografia da UFPEL.

This project is under development as part of a UFPEL monograph.
