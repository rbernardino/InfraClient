Configuration Client
{
  Import-DscResource -ModuleName xNetworking
  Import-DscResource -ModuleName xComputerManagement

  Node $AllNodes.Where({ $_.Purpose -eq 'Client Computer' }).NodeName
  {
    xDNSServerAddress 'DNSServerIP'
    {
      Address        = '172.16.1.4'
      AddressFamily  = 'IPv4'
      InterfaceAlias = 'Ethernet 2'
    }

    xComputer $Nodename
    {
      Name       = $Nodename
      Credential = $(Get-Credential mycompany\winadmin)
      DependsOn  = '[xDNSServerAddress]DNSServerIP'
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

