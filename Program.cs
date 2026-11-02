// Primeiros passos: laço for com quantidade opcional e validada.
int quantidade = 5;
if (args.Length > 1 || (args.Length == 1 && (!int.TryParse(args[0], out quantidade) || quantidade < 0 || quantidade > 1000)))
{
    Console.Error.WriteLine("Uso: Primeiro-Console [quantidade de 0 a 1000]");
    return 1;
}
for (int i = 0; i < quantidade; i++) Console.WriteLine($"bem-vindo!{i}");
return 0;
