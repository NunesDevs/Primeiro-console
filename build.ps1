param([switch]$Test, [switch]$Package)
$ErrorActionPreference = 'Stop'
$dotnet = if ($env:DOTNET_ROOT) { Join-Path $env:DOTNET_ROOT 'dotnet.exe' } else { 'dotnet' }
Push-Location $PSScriptRoot
try {
    & $dotnet build 'Primeiro-Console.csproj' -c Release --nologo
    if ($LASTEXITCODE) { throw 'Falha no build.' }
    if ($Test) {
        $dll = 'bin/Release/net10.0/Primeiro-Console.dll'
        $output = @(& $dotnet $dll)
        if ($LASTEXITCODE -ne 0 -or $output.Count -ne 5) { throw 'Saída padrão inválida.' }
        $empty = @(& $dotnet $dll 0)
        if ($LASTEXITCODE -ne 0 -or $empty.Count -ne 0) { throw 'Quantidade zero inválida.' }
        $invalid = New-Object System.Diagnostics.Process
        $invalid.StartInfo.FileName = $dotnet
        $invalid.StartInfo.WorkingDirectory = $PSScriptRoot
        $invalid.StartInfo.Arguments = ('"' + $dll + '" abc')
        $invalid.StartInfo.UseShellExecute = $false
        $invalid.StartInfo.CreateNoWindow = $true
        $invalid.StartInfo.RedirectStandardError = $true
        [void]$invalid.Start()
        $invalidMessage = $invalid.StandardError.ReadToEnd()
        $invalid.WaitForExit()
        if ($invalid.ExitCode -ne 1 -or $invalidMessage -notmatch 'Uso:') { throw 'Argumento inválido aceito.' }
        $invalid.Dispose()
        $global:LASTEXITCODE = 0
        if ($LASTEXITCODE) { throw 'Falha nos testes.' }
    }
    if ($Package) {
        & $dotnet publish 'Primeiro-Console.csproj' -c Release -r win-x64 --self-contained true -p:PublishSingleFile=true -o artifacts/publish --nologo
        if ($LASTEXITCODE) { throw 'Falha no empacotamento.' }
    }
} finally { Pop-Location }
