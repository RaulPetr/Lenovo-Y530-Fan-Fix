@echo off


:loop
	for /f "tokens=*" %%a in ('ec-probe.exe read 171') do set state=%%a
    SET state= %state:~0,1%
	for /f "tokens=*" %%a in ('ec-probe.exe read 0x56') do set temp=%%a
    SET temp= %temp:~0,2%
	for /f "tokens=*" %%a in ('ec-probe.exe read 0xfe') do set fan=%%a
    SET fan= %fan:~0,2%

    if %temp% geq 80 if %state% equ 9 goto turnon

    if %temp% lss 55 if %fan% equ 0 if %state% equ 0 goto turnoff

    echo state %state%, temp %temp%, fan %fan%.

    timeout 5 > NUL
    goto loop
:turnon
    ec-probe.exe write 171 0x00
    echo turned ON fans
    goto loop
:turnoff
    ec-probe.exe write 171 0x09
    echo turned OFF fans
    goto loop
