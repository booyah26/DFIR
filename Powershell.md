# Assorted Powershell commands for IR

## Enumerate the registry for scheduled tasks without the SD (Security Descriptor) Value
### Keys without the SD Value do not appear in the Task Scheduler GUI or schtasks /query

gci 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\' | where {$_.Property -notcontains 'ID'}
