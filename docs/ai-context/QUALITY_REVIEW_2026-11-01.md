# Revisão de qualidade — 2026-11-01

Exemplo inicial de laço for com quantidade opcional validada.

## Escopo

Leitura de fontes, documentação, configurações e scripts do projeto, excluindo dependências, metadados Git e saídas geradas. Sem alteração visual; mudanças de interface gráfica exigem Figma.

## Correções e decisões

- Cinco saudações por padrão, preservando o exemplo original.
- Argumento opcional de 0 a 1000 para explorar o laço.
- Entrada inválida mostra uso no stderr e retorna código 1.
- Projeto atualizado para .NET 10 LTS.

## Como validar

SDK .NET 10.

```powershell
./build.ps1 -Test -Package
dotnet run --project Primeiro-Console.csproj -- 3
```

O script verifica a saída padrão, a quantidade zero e a rejeição de argumento inválido.

## Limites reais

Exemplo didático intencionalmente pequeno, sem entrada interativa ou persistência.

Confira `PROJECT_MEMORY.md` para continuidade. Os resultados executados estão registrados abaixo.

## Resultado executado

Build .NET 10 e publish win-x64 aprovados; cinco saudações por padrão e código 1 para argumento inválido. Executável autossuficiente iniciado e encerrado corretamente.

Publicação em produção não foi realizada. Pacotes foram preparados e a publicação da branch será registrada na auditoria local; integração e distribuição são coordenadas separadamente.
