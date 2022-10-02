# Assorted Powershell commands for IR

## Enumerate the registry for hidden scheduled tasks 
### Keys without the SD Value (Security Descriptor) do not appear in the Task Scheduler GUI or schtasks /query
#### https://www.microsoft.com/security/blog/2022/04/12/tarrask-malware-uses-scheduled-tasks-for-defense-evasion/

gci 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\' | where {$_.Property -notcontains 'ID'}
