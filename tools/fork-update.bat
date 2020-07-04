@echo off
cd ../

echo ///Choose branch to pull///
set /p Data="Branch: "
echo Branch to pull: %Data%

set /p repname="Name to remote repository: "
echo Remote repository name: %repname%
git fetch https://github.com/infinitystation/Baystation12
git remote add %repname% https://github.com/infinitystation/Baystation12.git
echo Avalible now remote repositories:
git remote
set /p updbranch="Choose branch to update by %Data% commits from %repname%: "

git checkout %updbranch%
git pull %repname% %Data%
echo Update completed