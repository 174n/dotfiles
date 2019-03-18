function dotfilesbackup() {
	local d=~/.mydotfiles
	mkdir -p "$d/linux"
	while read p; do
		eval local pa=$p
		cp $pa "$d/linux"
		echo "$(basename -- $p) backuped"
	done <"$d/linux.txt"
}
