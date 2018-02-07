#!/data/data/com.termux/files/usr/bin/bash

#newdir=$(git status -u |grep .tmp|grep -v deleted|awk -F "/" '{print $1}'|cut -f 2|head -1)
newdir=$(readlink /data/params/d)
olddir=$(git status -u |grep .tmp|grep deleted|cut -d " " -f 5|awk -F "/" '{print $1}'|head -1)
git status
echo "newdir = $newdir"
echo "olddir = $olddir"
if [[ $newdir != $olddir ]]
then
	read -p "Do you want me to rename?(y) " rename
	if [[ $rename == 'y' ]]
	then 
		mv $newdir $olddir
		git mv $olddir $newdir
		read -p "Do you want to commit?(y) " commit
		if [[ $commit == 'y' ]]
		then
			DATE=$(date +%Y-%m-%d.%H.%M.%S)
			git commit -am "Snapshot $DATE"
		fi
	fi
else
	echo "newdir = oldir."
fi
git status
