@{
  AllNodes = @(
    @{
      NodeName                    = '*'
      PsDscAllowDomainUser        = $true
      PsDscAllowPlainTextPassword = $true
    },
    @{
      NodeName        = 'client'
      Purpose         = 'Client Computer'
    })
}
