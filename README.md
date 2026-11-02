# Primeiro console C#

Exemplo inicial de laço for com quantidade opcional validada.

## Comportamento

- Cinco saudações por padrão, preservando o exemplo original.
- Argumento opcional de 0 a 1000 para explorar o laço.
- Entrada inválida mostra uso no stderr e retorna código 1.
- Projeto atualizado para .NET 10 LTS.

## Executar e validar

SDK .NET 10.

```powershell
./build.ps1 -Test -Package
dotnet run --project Primeiro-Console.csproj -- 3
```

O script verifica a saída padrão, a quantidade zero e a rejeição de argumento inválido.

## Limites

Exemplo didático intencionalmente pequeno, sem entrada interativa ou persistência.

## Manutenção e licença

Código autoral licenciado sob a [MIT](LICENSE). Dependências, ferramentas e materiais de terceiros mantêm suas próprias licenças e avisos.

Decisões e continuidade: [PROJECT_MEMORY.md](PROJECT_MEMORY.md).
