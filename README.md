# Formulize

Aplicativo para gerenciar e criar novas respostas de um questionário e sincronizadas na nuvem após os dados serem salvos localmente (**Offline-first**).

# 1. Funcionalidades

0. Desbloqueio de super usuário.
1. Criação de formulários (super usuário).
2. Criação de perguntas para um formulário (super usuário).
3. Cadastrar respostas em um formulário (usuário).
4. Editar respostas de um formulário (super usuário).
5. Excluir respostas de formulários (super usuário).
6. Sincronizar dados na nuvem.
7. Configuração de dispositivo.

## 1.0 Desbloqueio de super usuário.

O super usuário é necessária para efetuar algumas modificações no aplicativo e deve ser opcional, ou seja, solicitada quando o usuário tentar acessar areas restritas.
E tera um botão para desativar super usuário.

## 1.1 Criação de formulários (super usuário)

O usuário poderá criar um número ilimitado de formulários, mostrando as informações totais do formulário como: Nome do formulário, número total de respostas e status em forma de card.

Os status da lista devem ser: Ativados e Desativadas.

O usuário poderá filtrar as listas por status.

Somente o super usuário pode criar ou editar um formulário.

## 1.2 Criação de perguntas para um formulário (super usuário).

O usuário poderá criar um número ilimitado de perguntas para um formulário, cada pergunta tem um tipo e pode receber apenas uma resposta (exceto o campo checkbox)

Os tipos de campos de pergunta aceitos são: DROPDOWN(SELECT), TEXT, CHECKBOX, DATETIME, TIME, SWITCH

Cada campo de pergunta terá um hint, label, options(select, checkbox), required.

O campo checkbox é multipla escolha e sua resposta ficara em um campo de lista de respostas.

Além disso, terá um botão para criar um formulário padrão.

Somente o super usuário pode criar ou editar perguntas para um formulário.

## 1.3 Cadastrar respostas em um formulário (usuário).

A opção de cadastrar uma resposta de um formulário.

As perguntas serão listadas de forma dinamica baseado no cabeçalho do formulário.

O usuário poderá salvar o formulário clicando em "SALVAR" no canto direito superior.

O formulário só tera validação de campos "obrigatórios".

## 1.4 Editar respostas de um formulário (super usuário).

Para editar uma resposta o usuário deve logar como super usuário.

Para isso ele irá mostrar uma lista de respostas cadastradas.

Ao selecionar uma resposta ele vai para tela de cadastro de resposta com os campos preenchidos.

## 1.5 Excluir respostas de um formulário (super usuário).

Para excluir uma resposta o usuário deve logar como super usuário.

Para isso ele irá mostrar uma lista de respostas cadastradas.

Ao clicar na lixeira em uma resposta ele vai remover essa resposta do banco de dados.

## 1.6 Sincronizar dados na nuvem.

Todas as listas e seus dados serão guardados localmente no dispositivo do usuário, sendo sincronizados posteriormente na nuvem.

## 1.7 Configuração de dispositivo.

O app deverá ter opções de controle de tema, remoção de cache e senha do super usuário.

# 2. Experiência do Usuário

Toda interface será feita usando componentes pré-construidos do Material Design.

# 3. Arquitetura

[Geral](ARCHITECTURE.md)
