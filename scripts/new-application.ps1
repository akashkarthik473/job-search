<#
.SYNOPSIS
  Scaffold a tailored application from a base resume.

.DESCRIPTION
  Creates applications/<year>/<company>_<role>/ containing:
    - Akash_Karthik_<Company>_<Role>_Resume.tex  (copy of the chosen base)
    - notes.md            (the 5-step tailoring worksheet, pre-filled)
    - job_description.txt (paste the posting here)
  and appends a row to tracker/applications.csv.

  The .tex is named exactly what the submitted PDF should be called, so
  build-resume.ps1 produces a correctly-named artifact with no renaming step.

.EXAMPLE
  .\scripts\new-application.ps1 -Company Astranis -Role "Embedded Software" -Base embedded_controls -Priority A

.EXAMPLE
  .\scripts\new-application.ps1 -Company Anduril -Role "Robotics Test" -Base simulation_robotics
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][string]$Company,
    [Parameter(Mandatory = $true)][string]$Role,
    [Parameter(Mandatory = $true)]
    [ValidateSet('embedded_controls', 'simulation_robotics', 'software_backend')]
    [string]$Base,
    [ValidateSet('A', 'B', 'C')][string]$Priority = 'B',
    [string]$JobUrl = '',
    [string]$JobId = ''
)

$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$year = (Get-Date).Year
$today = (Get-Date).ToString('yyyy-MM-dd')

function ConvertTo-Token {
    param([string]$Text)
    $t = $Text -replace '[^A-Za-z0-9]+', '_'
    return $t.Trim('_')
}

$companyToken = ConvertTo-Token $Company
$roleToken = ConvertTo-Token $Role

# Folder slug keeps underscores + the role, so two roles at one company stay
# in separate folders. The *file* name is the human-readable form.
$slug = "$($companyToken)_$($roleToken)".ToLower()

# Submitted-file naming: "Akash Karthik <Company> Resume.pdf". Spaces, no role.
# Strip only characters Windows forbids in a filename.
$companyFile = ($Company -replace '[\\/:*?"<>|]', '').Trim()

$appDir = Join-Path $repoRoot "applications\$year\$slug"
if (Test-Path $appDir) {
    throw "Already exists: $appDir  (applying twice? check tracker/applications.csv)"
}
New-Item -ItemType Directory -Path $appDir -Force | Out-Null

# --- resume ---------------------------------------------------------------
$resumeName = "Akash Karthik $companyFile Resume.tex"
$resumePath = Join-Path $appDir $resumeName
$baseSrc = Join-Path $repoRoot "bases\$Base.tex"

# -Encoding UTF8 on every read: PS 5.1 Get-Content defaults to ANSI, which
# would double-encode any non-ASCII character on the way back out.
$baseText = Get-Content $baseSrc -Raw -Encoding UTF8
$header = @"
% ---------------------------------------------------------------------------
% $Company - $Role
% Tailored from bases/$Base.tex on $today
% Worksheet: notes.md in this folder. Posting: job_description.txt
%
% Do NOT put the company name anywhere in the rendered document. It belongs in
% the filename only.
% ---------------------------------------------------------------------------
"@
# Strip the base file's own banner comment, keep everything from \documentclass.
$bodyStart = $baseText.IndexOf('\documentclass')
$body = $baseText.Substring($bodyStart)
Set-Content -Path $resumePath -Value "$header`r`n$body" -Encoding utf8

# --- worksheet + posting --------------------------------------------------
$notesSrc = Join-Path $repoRoot 'templates\application\notes.md'
$notes = Get-Content $notesSrc -Raw -Encoding UTF8
# {{COMPANY_FILE}} is the filename-safe company; {{COMPANY}}/{{ROLE}} are prose.
$notes = $notes -replace '\{\{COMPANY_FILE\}\}', $companyFile
$notes = $notes -replace '\{\{COMPANY\}\}', $Company -replace '\{\{ROLE\}\}', $Role
$notes = $notes -replace '(?m)^- \*\*Base used:\*\*.*$', "- **Base used:** $Base"
$notes = $notes -replace '(?m)^- \*\*Priority:\*\*.*$', "- **Priority:** $Priority"
if ($JobUrl) { $notes = $notes -replace '(?m)^- \*\*Job URL:\*\*.*$', "- **Job URL:** $JobUrl" }
if ($JobId) { $notes = $notes -replace '(?m)^- \*\*Job ID:\*\*.*$', "- **Job ID:** $JobId" }
Set-Content -Path (Join-Path $appDir 'notes.md') -Value $notes -Encoding utf8

Copy-Item (Join-Path $repoRoot 'templates\application\job_description.txt') (Join-Path $appDir 'job_description.txt')

# --- tracker --------------------------------------------------------------
$roleFamily = switch ($Base) {
    'embedded_controls'   { 'embedded' }
    'simulation_robotics' { 'simulation' }
    'software_backend'    { 'backend' }
}
$relResume = "applications/$year/$slug/$($resumeName -replace '\.tex$', '.pdf')"
$row = '"{0}","{1}","{2}","{3}","","","{4}","{5}","{6}","","saved","tailor resume and apply","",""' -f `
    $Company, $Role, $JobId, $JobUrl, $roleFamily, $Priority, $relResume
Add-Content -Path (Join-Path $repoRoot 'tracker\applications.csv') -Value $row -Encoding utf8

# --- done -----------------------------------------------------------------
Write-Host ""
Write-Host "Created $appDir" -ForegroundColor Green
Write-Host "  $resumeName"
Write-Host "  notes.md              <- work through steps 1-5 here"
Write-Host "  job_description.txt   <- paste the posting NOW, before it disappears"
Write-Host ""
Write-Host "Tracker row added (status: saved)." -ForegroundColor Green
Write-Host ""
Write-Host "Next:" -ForegroundColor Cyan
Write-Host "  1. Paste the posting into job_description.txt"
Write-Host "  2. Fill steps 1-3 in notes.md (job family, top 5 reqs, evidence map)"
Write-Host "  3. Edit $resumeName -- skills order, bullet swaps, project order"
Write-Host "  4. Run the step 5 truth check"
Write-Host "  5. .\scripts\build-resume.ps1 `"applications\$year\$slug\$resumeName`"   (quotes needed - spaces)"
