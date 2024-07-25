Uninstall-ChocolateyZipPackage `
    -PackageName "pyenv-win" `
    -ZipFileName "pyenv-win.zip"

Uninstall-ChocolateyEnvironmentVariable `
    -VariableName 'PYENV' `
    -VariableType 'Machine'

Uninstall-ChocolateyEnvironmentVariable `
    -VariableName 'PYENV_HOME' `
    -VariableType 'Machine'

$path = [System.Environment]::GetEnvironmentVariable('PATH', 'Machine')

$path = ($path.Split(';') | Where-Object { $_ -notlike '*\.pyenv\pyenv-win\*' }) -join ';'

[System.Environment]::SetEnvironmentVariable(
    'PATH',
    $path,
    'Machine'
)
