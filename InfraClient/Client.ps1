Configuration Client
{

  Import-DscResource -ModuleName xComputerManagement

  Node $AllNodes.Where({ $_.Purpose -eq 'Client Computer' }).NodeName
  {
    xComputer $Nodename
    {
      Name       = $Nodename
      Credential = $(Get-Credential mycompany\winadmin)
      DomainName = 'mycompany.com'
    }
  }
}

Client `
  -ConfigurationData "$PSScriptRoot\ConfigurationData.psd1" `
  -OutputPath "$PSScriptRoot\mofs"

Start-DscConfiguration `
		-Path "$PSScriptRoot\mofs" `
		-Verbose -Wait -Force

