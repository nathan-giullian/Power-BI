Write-host "Are you sure you want to overwrite the current PBIProj files in this folder? "
$Result = Read-Host -Prompt "[Y/N]"
if ($Result -eq 'Y') {
	# $ReportsManifestPath = '.\Reports\Test\DeploymentManifest.json'
	# $subManifestFile = Get-Content -Path $ReportsManifestPath | ConvertFrom-Dson
	# foreach ($Report in $subManifestFile.Deployments.PBIReports) {
		$PBIXFilePath = ".\Reports\Test\"
		$BPIProjPath = ".\Reports\Test\Test File - NGG"
		Write-host "Expanding PBIX File: $BPIProjPath to $PBIXFilePath"

		.\Util\PBIToolsCore\pbi-tools.core.exe compile $BPIProjPath -outPath $PBIXFilePath -format PBIX -overwrite True
	}
# }