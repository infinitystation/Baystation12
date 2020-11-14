killall -s 9 DreamDaemon

git pull

sudo DreamMaker baystation12.dme

sudo nohup nice -n -20 DreamDaemon baystation12.dmb 7777 -trusted -logself -public -threads on -map-threads on &