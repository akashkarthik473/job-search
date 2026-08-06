<#
.SYNOPSIS
  Compile a resume .tex to PDF with XeLaTeX, then remove the aux clutter.

.DESCRIPTION
  Sets TEXINPUTS so style/resume.sty resolves from anywhere in the repo, runs
  xelatex twice (second pass fixes hyperref PageLabels), and deletes the
  intermediate files. The PDF lands next to the .tex with the same basename --
  which is why tailored resumes are named exactly what you want the PDF called.

.EXAMPLE
  .\scripts\build-resume.ps1 bases\embedded_controls.tex

.EXAMPLE
  # Rebuild everything
  .\scripts\build-resume.ps1 -All
#>
[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string]$TexFile,

    [switch]$All,

    [switch]$KeepAux
)

$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$styleDir = Join-Path $repoRoot 'style'

$xelatex = Join-Path $env:LOCALAPPDATA 'Programs\MiKTeX\miktex\bin\x64\xelatex.exe'
if (-not (Test-Path $xelatex)) {
    $cmd = Get-Command xelatex -ErrorAction SilentlyContinue
    if ($cmd) {
        $xelatex = $cmd.Source
    } else {
        throw "xelatex not found. Install MiKTeX: winget install --id MiKTeX.MiKTeX -e"
    }
}

function Build-One {
    param([string]$Path)

    $full = (Resolve-Path $Path).Path
    $dir = Split-Path -Parent $full
    $base = [System.IO.Path]::GetFileNameWithoutExtension($full)

    Write-Host "Building $base ..." -ForegroundColor Cyan

    $env:TEXINPUTS = "$styleDir;"
    Push-Location $dir
    try {
        foreach ($pass in 1, 2) {
            $output = & $xelatex -synctex=1 -interaction=nonstopmode -file-line-error $full
            if ($LASTEXITCODE -ne 0) {
                Write-Host "--- xelatex pass $pass failed ---" -ForegroundColor Red
                $output | Select-String -Pattern ':\d+:' | Select-Object -First 15 | ForEach-Object { Write-Host $_ -ForegroundColor Red }
                throw "Build failed for $base (see $base.log)"
            }
        }

        if (-not $KeepAux) {
            foreach ($ext in '.aux', '.log', '.out', '.synctex.gz', '.xdv') {
                $junk = Join-Path $dir "$base$ext"
                if (Test-Path $junk) { Remove-Item $junk -Force }
            }
        }

        $pdf = Join-Path $dir "$base.pdf"
        $size = [math]::Round((Get-Item $pdf).Length / 1KB, 1)
        Write-Host "  -> $pdf ($size KB)" -ForegroundColor Green
    }
    finally {
        Pop-Location
    }
}

if ($All) {
    $targets = @()
    $targets += Get-ChildItem (Join-Path $repoRoot 'bases') -Filter *.tex -ErrorAction SilentlyContinue
    $targets += Get-ChildItem (Join-Path $repoRoot 'master') -Filter *.tex -ErrorAction SilentlyContinue
    $targets += Get-ChildItem (Join-Path $repoRoot 'applications') -Filter *.tex -Recurse -ErrorAction SilentlyContinue
    foreach ($t in $targets) { Build-One $t.FullName }
    Write-Host "`nBuilt $($targets.Count) file(s)." -ForegroundColor Green
}
elseif ($TexFile) {
    Build-One $TexFile
}
else {
    throw "Pass a .tex path or -All. Example: .\scripts\build-resume.ps1 bases\embedded_controls.tex"
}
