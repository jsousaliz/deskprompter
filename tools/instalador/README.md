# Instalador

O arquivo `Deskprompter.iss` define o instalador tradicional Win64 usando Inno
Setup 6.

Antes de gerar o instalador, compile o projeto `Deskprompter.exe` em `Release`.
Em seguida, abra o arquivo `.iss` no Inno Setup Compiler ou execute:

```powershell
ISCC.exe Deskprompter.iss
```

O instalador será criado em `bin/instalador`.

A versão definida no script deve permanecer alinhada às informações de versão
do arquivo `src/Deskprompter.dproj`.

Para compilar a aplicação, executar os testes, gerar o instalador e calcular seu
SHA-256 em uma única operação:

```powershell
.\tools\instalador\Construir.ps1 -Versao 0.1.0
```

O resultado preparado para distribuição será gravado em `dist`.
