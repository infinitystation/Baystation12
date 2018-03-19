cd ../../maps/exodus_infinity

FOR /R %%f IN (*.dmm) DO (
  copy %%f %%f.backup
)

pause
