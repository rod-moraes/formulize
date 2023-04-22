# Arquitetura

# Objetivo

Esse documento tem por objetivo principal gravar resposta de um formulário.

# Regras iniciais, limite e Análise

Pontos a serem levados em consideração antes de introduzir uma nova feature:

- Todo projeto precisará respeitar as regras de Lint escritas no pacote flutterando-analysis.
- Camadas globais devem ter um lugar específico na aplicação, por tanto, devem estar na pasta Shared.
- Cada feature deverá ter sua própria pasta onde conterá todas as camadas necessárias para a execução dos casos de uso da feature.
- Todos os designs patterns usados no projeto devem estar listados na sessão “Design Patterns” desse documento, caso contrário será considerado implementação errônea.
- Packages e plugins novos só poderão ser usados nos projetos após avaliação e aprovação de toda equipe responsável pelo projeto.
- Atualizações no Modelo de domínio só poderão ser aceitas se primeiro for adicionada nesse documento e aprovado por todos os envolvidos no projeto.
- Não é permitido ter uma classe concreta como dependência de uma camada. Só será aceita coesão com classes abstratas ou interfaces. Com exceção da Store.
- Cada camada deve ter apenas uma responsabilidade.

# Entidades

![image](github/images/entities.png)

# Casos de Uso
**Board Formulário**
- Carregar formulários
- Excluir formulário

**Criação/Edição de Formulário**
- Carregar dados do formulário
- Excluir uma pergunta do formulário 
- Criar/Editar formulário
- Excluir formulário

**Criação/Edição perguntas de Formulário**
- Carregar dados da pergunta
- Criar/Editar perguntas de formulário
- Excluir pergunta do formulário

**Cadastrar/Editar respostas de Formulário**
- Carregar perguntas
- Carregar respostas
- Salvar respostas do formulário

**Board de respostas de Formulário**
- Carregar repostas
- Excluir respostas

**Configuraões**
- Validar senha de super usuário
- Modificar senha de super usuário
- Carregar configurações
- Salvar configurações

**Sincronização**
- DownloadBoards
- UploadBoards

# Design Patterns

- Repository Pattern: Para acesso a multiplas fonte de dados.
- Datasource Pattern: Para acesso a dados (API/Banco de dados)
- Service Pattern: Para isolar trechos de códigos com outras responsabilidades.
- Entity Pattern: Para definir as entidades da aplicação
- Dependency Injection: Resolver dependências das classes.
- Store: Guardar e mudar estados.
- State pattern: Padrão que auxilia no gerenciamento estados.
- Adapter: Converter um objeto em outro.
- Result: Trabalhar com retorno Múltiplo.

# Package externos

- result: Retorno múltiplo no formato Failure e Success.
- flutter_modular: Modularização de rotas e injeção de dependências.
- realm: Banco de dados e sincronização
- rx_notifier: Gerenciamento de estado
