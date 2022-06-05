@Echo off & SetLocal EnableDelayedExpansion
for /f "tokens=2" %%A in ('tasklist ^| findstr /i "redis-server.exe" 2^>NUL') do taskkill /f /pid  %%A"
@REM @Echo on
