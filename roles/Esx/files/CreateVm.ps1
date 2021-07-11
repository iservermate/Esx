Set-PowerCLIConfiguration -InvalidCertificateAction:ignore
Connect-VIServer 192.168.0.4 -User root -Password M0hsin!@#
Get-VM
New-VM -Name icmp-rtest-01 -Datastore Datastore1 -DiskGB 50 -MemoryGB 2 -NumCpu 2 -DiskStorageFormat Thin -CoresPerSocket 1 -CD -VMHost 192.168.0.4 -GuestId centos64Guest
Get-VM icmp-rtest-01 | Get-CDDrive | Set-CDDrive -ISOPath "[datastore1] OS/centos8.iso" -StartConnected $true -Confirm:$false 1> /dev/null
Start-VM -VM icmp-rtest-01 -Server 192.168.0.4
