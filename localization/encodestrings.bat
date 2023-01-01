
:: NOTE: w3strings.exe must be in the PATH variable

for /f "delims=|" %%f in ('dir /b *.csv') do (
  echo %%f
  w3strings.exe --encode %%f --id-space 7517
  move %%f.w3strings ../content/%%~nf.w3strings
  del %%f.w3strings.ws
)

Pause