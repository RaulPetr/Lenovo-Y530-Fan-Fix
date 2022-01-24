# Lenovo-Y530-Fan-Fix

## Requirements
 - These files will work on Windows 7/10/11
 - For running any file, install [Notebook Fan Control](https://github.com/hirschmann/nbfc/releases/download/1.6.3/NoteBookFanControl.1.6.3.setup.exe) app. This will add the ec-probe.exe to your path
 - For creating a service, use [NSSM](http://nssm.cc/download)

## Service Installation
 - Use nssm.exe and use the Fan-Service.bat
 - This should help [StackOverflow help link](https://stackoverflow.com/questions/415409/run-batch-file-as-a-windows-service?rq=1)
## Service working principle
  - The batch file reads system data every 5 seconds and :
    - If the temp is over 80, let the system control fan speed
    - If the temp is under 55 and the fans are off, lock them in the off state
  
## The other files (non-service)
 - Run them by double clicking, they do what their names suggest
