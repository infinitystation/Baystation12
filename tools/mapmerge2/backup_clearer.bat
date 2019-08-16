::By _Elar_

@echo off
cd ../../maps/
echo Are you sure? If not, just close CMD
pause

::.backup block
@echo on
for /R %%f in (*.backup) do del "%%f"
@echo off
pause

cls

echo All dmm.backup files in maps directories have been deleted
echo If you needn't to delete .before, just close CMD
pause
::.before block
@echo on
for /R %%f in (*.before) do del "%%f"
@echo off
echo Thank you for using mapmerge
pause
