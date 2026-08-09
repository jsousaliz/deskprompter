<p align="center">
  <img src="src/Icones/png/Deskprompter-128.png" width="128" height="128" alt="Ícone do Deskprompter">
</p>

<h1 align="center">Deskprompter</h1>

Teleprompter para Windows com organização de textos, rolagem automática, espelhamento e proteção contra captura de tela.



## Recursos

- Interface de janela única para organizar, editar e apresentar os textos.
- Biblioteca em árvore com grupos e seus respectivos textos.
- Navegação rápida entre os textos do grupo atual.
- Editor de texto simples com salvamento local automático.
- Rolagem automática com reprodução, pausa, avanço, recuo e retorno ao início.
- Controle de velocidade, margem, fonte, tamanho e cores do texto e do fundo.
- Ajuste da opacidade da janela.
- Espelhamento horizontal e vertical para uso com vidro de teleprompter.
- Barra de rolagem disponível também durante o espelhamento.
- Modo de tela cheia e opção de ocultar os painéis para exibir somente o texto.
- Atalhos de teclado predefinidos, editáveis e persistidos localmente.
- Proteção de captura que pode ser ativada ou desativada durante a execução.
- Modo sempre no topo para manter o roteiro visível ao trabalhar em outra
  janela.

## Proteção contra captura

Quando ativada, a aplicação solicita ao Windows que exclua sua janela das APIs
compatíveis de captura. O conteúdo continua visível no monitor local, mas pode
aparecer vazio ou oculto em capturas e compartilhamentos de tela compatíveis.

Esse recurso depende do Windows, do método de captura e do aplicativo utilizado.
Por isso, deve ser validado no ambiente real antes de uma apresentação. Ele não
deve ser tratado como mecanismo de segurança ou proteção de conteúdo.

## Requisitos

- Windows 10 ou superior, 64 bits.
- Delphi 12 Community Edition ou outra edição compatível do RAD Studio 12.
- Plataforma de destino `Windows 64-bit`.

Para a exclusão completa da janela nas APIs compatíveis de captura, é necessário
Windows 10 versão 2004 ou superior.

## Compilação

1. Abra `Deskprompter.groupproj` no RAD Studio.
2. Selecione o projeto `Deskprompter.exe`.
3. Confirme a plataforma `Windows 64-bit`.
4. Escolha a configuração `Debug` ou `Release`.
5. Compile ou execute o projeto.

Os executáveis são gerados diretamente por finalidade:

```text
bin/
├── app/Deskprompter.exe
└── tests/Deskprompter.Testes.exe
```

Ao alternar entre `Debug` e `Release`, o executável anterior da mesma finalidade
é substituído. Os DCUs permanecem separados por projeto e configuração:

```text
dcu/
├── app/<Configuracao>/
└── tests/<Configuracao>/
```

## Instalador

O instalador tradicional é gerado com o Inno Setup 6 a partir de
`tools/instalador/Deskprompter.iss`:

1. Compile `Deskprompter.exe` na configuração `Release`.
2. Abra `tools/instalador/Deskprompter.iss` no Inno Setup.
3. Compile o script.

O pacote resultante é criado em `bin/instalador/`. A versão do instalador deve
ser mantida igual à versão configurada em `src/Deskprompter.dproj`.

O workflow `Criar release Deskprompter` permite executar o mesmo processo pelo
GitHub Actions usando um runner Windows auto-hospedado com Delphi 12, Inno Setup
6 e GitHub CLI. Com `publicar_release` desligado, ele apenas valida e armazena o
instalador como artefato. Quando ligado, também cria a tag e o GitHub Release.
As notas podem ser geradas automaticamente pelo GitHub ou lidas do arquivo
`docs/notas-de-versao/v<versao>.md`.

## Testes automatizados

O projeto `Deskprompter.Testes.exe` utiliza DUnitX e reúne testes de unidade e de
integração. Para executá-los pelo RAD Studio:

1. Selecione `Deskprompter.Testes.exe` no grupo de projetos.
2. Confirme a plataforma `Windows 64-bit`.
3. Compile e execute o projeto.

Os testes utilizam armazenamento temporário próprio e não devem alterar a base
local da aplicação.

## Dados locais

Grupos, textos, preferências e atalhos são persistidos em SQLite no perfil do
usuário:

```text
%LOCALAPPDATA%\Deskprompter\deskprompter.db
```

O projeto não envia os textos para serviços externos e atualmente não oferece
sincronização, backup ou exportação.

## Estrutura do código

```text
src/
├── Dominio/          regras e entidades do negócio
├── Aplicacao/        casos de uso, comandos, contratos e preferências
├── Infraestrutura/   SQLite, relógio, diagnóstico e integração com Windows
├── Inicializacao/    composição das dependências
├── VCL/              formulários e controladores da interface
└── Icones/           identidade visual da aplicação

tests/
├── Unitarios/
└── Integracao/

docs/notas-de-versao/   notas manuais publicadas nos releases
tools/instalador/       script de compilação e definição do instalador
```

A solução mantém as regras independentes da interface sempre que possível. A
camada VCL concentra os componentes visuais e as integrações específicas da tela,
enquanto contratos conectam a aplicação às implementações de infraestrutura.

## Convenções

Os identificadores próprios do projeto são escritos em português, sem acentos.
Nomes pertencentes ao Delphi, VCL, DUnitX, FireDAC, SQLite ou à API do Windows são
preservados.
