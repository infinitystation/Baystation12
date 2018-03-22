cd ../../maps/torch/infinity_station_maps

FOR /R %%f IN (*.dmm) DO (
  copy %%f %%f.backup
)

pause
