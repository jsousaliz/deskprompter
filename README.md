# Deskprompter

Teleprompter para Windows desenvolvido em Delphi 12 Community Edition.

## Estrutura

```text
src/
  Dominio/
  Aplicacao/Aparencia/
  Aplicacao/Comandos/
  Aplicacao/Contratos/
  Aplicacao/Preferencias/
  Infraestrutura/
  Inicializacao/
  VCL/
tests/
docs/
```

Os identificadores próprios do projeto são escritos em português, sem acentos. Nomes definidos por Delphi, VCL, DUnitX, FireDAC, SQLite ou pela API do Windows são preservados.

A janela principal usa um formulário VCL tradicional composto por `Deskprompter.VCL.FormularioPrincipal.pas` e seu arquivo `.dfm`. O banco local é criado em `%LOCALAPPDATA%\Deskprompter\deskprompter.db`.

## Projetos

- `Deskprompter.groupproj`: grupo de projetos para abrir no RAD Studio.
- `src/Deskprompter.dproj`: aplicação VCL Win64.
- `tests/Deskprompter.Testes.dproj`: testes de unidade DUnitX Win64.

## Compilação

Abra `Deskprompter.groupproj` no Delphi 12 e selecione a plataforma Win64. Os executáveis são separados por finalidade:

- aplicação: `bin/app/Deskprompter.exe`;
- testes automatizados: `bin/tests/Deskprompter.Testes.exe`.

Ao alternar entre Debug e Release, o executável anterior é substituído. Os DCUs ficam isolados por projeto e configuração:

- aplicação: `dcu/app/<Configuracao>`;
- testes automatizados: `dcu/tests/<Configuracao>`.

O planejamento completo está em [docs/PLANEJAMENTO.md](docs/PLANEJAMENTO.md).

## Prova técnica da captura

Execute `bin/app/Deskprompter.exe` e confirme na barra inferior que a proteção de captura está ativa. Essa confirmação não substitui a inspeção visual no aplicativo de compartilhamento. O roteiro manual está em [docs/VALIDACAO-CAPTURA.md](docs/VALIDACAO-CAPTURA.md).
