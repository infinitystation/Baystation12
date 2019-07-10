@echo off
cd ../

echo __Choose git repository to merge with__
set /p mergerepo="Repo: "

echo ///Choose branch on remote repository///
set /p merbranch="Branch: "
echo You pull changes from %mergerepo% from branch %merbranch%.

set /p repname="Name to remote repository: "
echo Remote repository name: %repname%
git fetch %mergerepo%
git remote add %repname% %mergerepo%
echo Avalible now remote repositories:
git remote
set /p locbranch="Choose local branch to update by %merbranch% commits from %repname%: "

git checkout %locbranch%
git merge %repname%/%merbranch%
echo Merge Complite. Now resolve conflicts, if they exist.