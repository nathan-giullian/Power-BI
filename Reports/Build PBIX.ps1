Write-host "Are you sure you want to overwrite the current PBIProj files in this folder? "
$Result = Read-Host -Prompt "[Y/N]"
if ($Result -eq 'Y') {
	# $ReportsManifestPath = '.\Reports\Sales Reports\DeploymentManifest.json'
	# $subManifestFile = Get-Content -Path $ReportsManifestPath | ConvertFrom-Dson
	# foreach ($Report in $subManifestFile.Deployments.PBIReports) {
		$PBIXFilePath = ".\Reports\Sales Reports\" #Add your file path here to the specific report folder
		$BPIProjPath = ".\Reports\Sales Reports\$($Report.FolderPath)" #Add the file path with the folder for the json and other files here
		Write-host "Expanding PBIX File: $BPIProjPath to $PBIXFilePath"

		.\Util\PBIToolsCore\pbi-tools.core.exe compile $BPIProjPath -outPath $PBIXFilePath -format PBIX -overwrite True
	}
# }