call "D:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\VCVARSALL.BAT" amd64

cd .
nmake -f ceshi20210723.mk  ISPROTECTINGMODEL=NOTPROTECTING
@if errorlevel 1 goto error_exit
exit /B 0

:error_exit
echo The make command returned an error of %errorlevel%
An_error_occurred_during_the_call_to_make
