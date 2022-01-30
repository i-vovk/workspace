$dnsServers = (Get-NetAdapter | Where-Object InterfaceDescription -like "Cisco AnyConnect*" | Get-DnsClientServerAddress).ServerAddresses -join ','
$searchSuffix = (Get-DnsClientGlobalSetting).SuffixSearchList -join ','

function set-DnsWsl($distro) {
    if ( $dnsServers ) {
        wsl.exe -d $distro -u root /opt/wsl_dns.py --servers $dnsServers --search $searchSuffix
    }
    else {
        wsl.exe -d $distro -u root /opt/wsl_dns.py
    }
}

set-DnsWsl Ubuntu-18.04
set-DnsWsl Ubuntu-20.04
