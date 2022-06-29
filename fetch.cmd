@echo off
:: load configuration
for /f "delims== tokens=1,2" %%G in (application.conf) do set %%G=%%H
:: scrape website
curl -G %API%%city% > data.txt
:: remove ` in data.txt
cscript replace.vbs "data.txt" "`" ""
cscript replace.vbs "data.txt" "<script" "<norun"
cscript replace.vbs "data.txt" "</script>" "</norun>"
:: update last-update
echo %date%T%time% > last-update.txt
:: sleep for 5 minutes
timeout /T 300 /nobreak
pause