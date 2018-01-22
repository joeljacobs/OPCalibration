#!/data/data/com.termux/files/usr/bin/bash

newdir=$(git status -u |grep .tmp|grep -v deleted|awk -F "/" '{print $1}'|cut -f 2|head -1)
olddir=$(git status -u |grep .tmp|grep deleted|cut -d " " -f 5|awk -F "/" '{print $1}'|head -1)
mv $newdir $olddir
git mv $olddir $newdir
DATE=$(date +%Y-%m-%d.%H.%M.%S)
git commit -am "Snapshot $DATE"
