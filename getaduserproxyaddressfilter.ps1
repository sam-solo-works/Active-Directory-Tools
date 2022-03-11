﻿Get-ADUser testuser -Properties * | Select-Object Name,@{L = "ProxyAddresses"; E = {($_.ProxyAddresses | Where-Object { $_ -match "test"}) -join ";"}} | Export-CSV "C:\Documents\test $(get-date -f dd-MMM_hh_mm_ss).csv" -NoTypeInformation