# 🧪 E-commerce API & Web Tests – Robot Framework

Automação de testes API e Web do Serverest
, utilizando Robot Framework.
Projeto voltado para validar fluxos críticos de autenticação, usuários, produtos, carrinhos e interface web.

## 🎯 Objetivo

Garantir a qualidade da API Serverest e sua interface web, cobrindo:

Testes de API (login, CRUD de usuários, produtos e carrinhos)

Testes Web (login, cadastro, listagem e validações de UI)

Estrutura modular e reutilizável para facilitar manutenção e escalabilidade

##  🛠️ Tecnologias Utilizadas

####  Robot Framework

    RequestsLibrary
    – testes de API
    SeleniumLibrary
     – testes Web
    JSONLibrary
    – manipulação de JSON
    Python 3.10+
    Git/GitHub


## 🚀 Como rodar o projeto


# 1. Clone este repositório
```bash
git clone https://github.com/usuario/repositorio.git


# 2. Acesse a pasta do projeto
cd repositorio

# 3. Instale as dependências
 pip install -r requirements.txt --no-cache-dir

# 4. Inicie a aplicação
 robot -d logs tests


### Estrutura do projeto
ECOMMERCE-API-AND-WEB-ROBOTFRAMEWORK/
│
├── fixtures/                          # Dados, elementos, mensagens e configs
│   ├── data/
│   │   └── user_data.yaml              # Massa de dados de usuários
│   │
│   ├── elements/                       # Mapeamento de elementos da UI
│   │   ├── carts_elements.yaml
│   │   ├── login_elements.yaml
│   │   ├── product_elements.yaml
│   │   └── user_elements.yaml
│   │
│   ├── environments/
│   │   └── serverest.yaml              # Configuração de ambiente (URLs, etc)
│   │
│   ├── serverest/
│   │   └── files/
│   │        └── img.png                # Arquivos auxiliares (ex: upload)
│   │
│   └── messages/                       # Mensagens de validação
│       ├── message_back/
│       │   └── msg_globals.yaml
│       └── message_front/
│
├── logs/                               # Relatórios e logs de execução
│
├── support/                            # Recursos compartilhados
│   ├── python_files/
│   │   └── dotenv_loader.py            # Carregamento de variáveis (.env)
│   │
│   └── robot_files/
│       ├── elements.resource           # Import central de elementos
│       ├── environment.resource        # Variáveis de ambiente
│       ├── variables.resource          # Variáveis globais
│       └── resources.resource          # Keywords e libs comuns
│
├── tests/                              # Cenários de teste
│   └── serverest/
│       ├── api/                        # Testes API (REST)
│       │   ├── carts/
│       │   │   ├── carts_keyword.resource
│       │   │   ├── get_carts.robot
│       │   │   └── post_carts.robot
│       │   │
│       │   ├── product/
│       │   │   ├── delete_product.robot
│       │   │   ├── get_product.robot
│       │   │   ├── post_product.robot
│       │   │   └── put_product.robot
│       │   │
│       │   └── user/
│       │       ├── delete_user.robot
│       │       ├── get_user.robot
│       │       ├── post_user.robot
│       │       └── put_user.robot
│       │
│       └── front/                      # Testes Web (UI)
│           ├── carts/                  # (em expansão)
│           ├── product/
│           │   ├── product_create.robot
│           │   └── product_keywords.resource
│           │
│           └── user/
│               ├── user_create.robot
│               └── user_keywords.resource
│
│       __init__.robot                  # Arquivo de inicialização
│
├── utils/                              # Suporte para APIs e UI
│   ├── body/
│   │   ├── carts_body.resource         # Massa de requests de carrinhos
│   │   ├── login_body.resource         # Massa de requests de login
│   │   ├── product_body.resource       # Massa de requests de produtos
│   │   └── user_body.resource          # Massa de requests de usuários
│   │
│   ├── headers.resource                # Headers padrão para API
│   ├── keywords_front.resource         # Keywords para testes Web
│   └── keywords_serverest.resource     # Keywords para API Serverest
│
├── venv/                               # Ambiente virtual Python
│
├── .gitignore                          # Ignora arquivos/pastas no Git
└── README.md                           # Documentação principal do projeto


## ✅ Critérios de Qualidade

    - Estrutura modular para fácil manutenção
    - Relatórios automáticos gerados pelo Robot Framework (report.html e log.html)
    - Reuso de variáveis, bodies e keywords
    - Execução integrada com CI/CD (ex: GitHub Actions, Jenkins)
