cd ../../maps/bearcat_inf

FOR /R %%f IN (*.dmm) DO (
  copy %%f %%f.backup
)

pause
