# Memória do projeto

Revisão: 2026-11-01. Ler este arquivo e `docs/ai-context/QUALITY_REVIEW_2026-11-01.md` antes de retomar alterações.

## Objetivo e estado

Exemplo inicial de laço for com quantidade opcional validada.

Mudanças funcionais desta revisão:
- Cinco saudações por padrão, preservando o exemplo original.
- Argumento opcional de 0 a 1000 para explorar o laço.
- Entrada inválida mostra uso no stderr e retorna código 1.
- Projeto atualizado para .NET 10 LTS.

## Decisões

- Preservar o propósito didático e o histórico anterior do Git.
- Manter esta revisão na branch `codex/quality-refresh` até integração coordenada.
- Preservar arquivos locais e avisos de terceiros; não versionar resultados de build, credenciais ou dados reais.
- Artefatos de console são distribuíveis locais. Um build ou pacote não comprova publicação em produção.
- .NET 10 LTS foi escolhido porque .NET 3.1 e 6 estavam sem suporte e .NET 8 encerra suporte em 2026-11-10. Referência: https://dotnet.microsoft.com/en-us/platform/support/policy/dotnet-core .

## Validação reproduzível

SDK .NET 10.

```powershell
./build.ps1 -Test -Package
dotnet run --project Primeiro-Console.csproj -- 3
```

O script verifica a saída padrão, a quantidade zero e a rejeição de argumento inválido.

## Limitações para continuidade

Exemplo didático intencionalmente pequeno, sem entrada interativa ou persistência.

Os documentos automáticos de maio em `docs/ai-context` são um registro histórico, incluindo falsos positivos por palavras como “secret”. Esta memória e a revisão de qualidade descrevem o estado posterior às correções.

Pacotes Release omitem símbolos de depuração e mapeiam caminhos de origem em `Directory.Build.props`, para não distribuir caminhos locais. Para depurar, use a configuração Debug.

## Evidência da revisão

Build .NET 10 e publish win-x64 aprovados; cinco saudações por padrão e código 1 para argumento inválido. Executável autossuficiente iniciado e encerrado corretamente.

## CI — 2026-11-08

O workflow `.github/workflows/ci.yml` valida a stack e os testes reais deste projeto em push/PR para `master` e por disparo manual. Usa ações oficiais fixadas por SHA, permissão `contents: read` e checkout sem credenciais persistentes. Não faz deploy nem publica pacotes.

A release `v2026.11.8` e seus binários continuam associados ao código `35cd9aed386d3ea04eb1914144a5b1dd74f78404`. O commit de workflow/documentação é posterior e não muda os artefatos já compilados. Resultado da execução remota disponível na aba Actions; não confundir configuração do workflow com aprovação de uma execução.
