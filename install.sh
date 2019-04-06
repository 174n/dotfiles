#!/bin/bash
d=~/.mydotfiles
create_link() {
	local filename=$(basename -- "$1")
	local dirname=$(dirname "$1")
	local backupname="${filename%.*}_old.${filename##*.}"
	if [ -e "$1" ] && [[ ! -h "$1" ]]; then
		mv "$1" "$dirname/$backupname"
		echo -e "Backup of $filename was created"
		ln -s "$d/linux/$filename" $pa
		echo "$d/linux/$filename -> $pa"
	else
		echo -e "Backup of a symlink $pa was not created. No changes is done"
	fi
}

loop_through() {
	while read p; do
		local filename=$(basename -- "$p")
		eval local pa=$p
		create_link $pa
	done <"$d/linux.txt"
}

loop_through
