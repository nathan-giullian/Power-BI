Write-host "Are you sure you want to overwrite the current PBTProj files in this folder? "
$Result = Read-Host -Prompt "[Y/N]" 
if ($Result -eq 'Y') {
	$ReportsManifestPath = '.\Reports\Sales Reports\DeploymentManifest.json'
	$subManifestFile = Get-Content -Path $ReportsManifestPath | ConvertFrom-Json 
	foreach ($Report in $subManifestFile.Deployments.PBIReports) {
		$PBIXFilePath = ".\Reports\Sales Reports\$($Report.PBIXFileName)"
		$BPIProjPath = ".\Reports\Sales Reports\$($Report.FolderPath)"
		Write-host "Extrcting PB1X File: $BPIProjPath to $PBIXFilePath"
		
		.\Util\PBITools\pbi-tools.exe extract "$PBIXFilePath" -extractFolder "$BPIProjPath" -modelSerialization Default
	}
}

