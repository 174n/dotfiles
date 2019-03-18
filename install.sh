#!/bin/bash
d=~/.mydotfiles
create_backup() {
	local filename=$(basename -- "$1")
	local dirname=$(dirname "$1")
	local backupname="${filename%.*}_old.${filename##*.}"
	if [ -e "$1" ]; then
		mv "$1" "$dirname/$backupname"
		echo -e "Backup of $filename was created"
	fi
}
#mv a_old.txt a.txt
#create_backup "a.txt"

loop_through() {
	while read p; do
		local filename=$(basename -- "$p")
		eval local pa=$p
		create_backup $pa
		ln -s "$d/linux/$filename" $pa
		echo "$d/linux/$filename -> $pa"
	done <"$d/linux.txt"
}

loop_through
