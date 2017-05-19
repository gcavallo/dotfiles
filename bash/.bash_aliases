if [ -x /usr/bin/dircolors ]; then
	# Color output of coreutils
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# Personal aliases
alias la='ls -a'
alias ll='ls -alh'
alias sudo='sudo '
alias vi='vim'
alias lsblk='lsblk -o NAME,TYPE,KNAME,FSTYPE,MOUNTPOINT,LABEL,UUID,OWNER,GROUP,MODE,TYPE,SIZE'
alias 7zp="7za a -t7z -m0=lzma2 -mx=9 -mhe=on -p"
alias mutt="mutt -F $HOME/.config/mutt/muttrc"
alias konsole='konsole --new-tab'
alias chromium='XDG_CURRENT_DESKTOP="KDE" chromium'

colors () {
	# Echo a line of terminal colors
	echo ""
	for i in {30..37}; do
		echo -ne "\e[0;${i}m████\e[1;${i}m████\e[0m"
	done
	echo -e "\n"
}

serversslfp () {
	# Get server SSL certificate fingerprint in MD5, SHA1 and SHA256
	openssl s_client -connect "$1" < /dev/null 2>/dev/null | openssl x509 -fingerprint -md5 -noout -in /dev/stdin
	sleep 1
	openssl s_client -connect "$1" < /dev/null 2>/dev/null | openssl x509 -fingerprint -sha1 -noout -in /dev/stdin
	sleep 1
	openssl s_client -connect "$1" < /dev/null 2>/dev/null | openssl x509 -fingerprint -sha256 -noout -in /dev/stdin
}

backup () {
	# Backup given directories to /mnt/backup
	for dir in "$@"; do
		rsync -aXv --delete --delete-excluded --exclude-from="/etc/rsync-excludes.txt" "$(realpath "$dir")" /mnt/backup
	done
}

reflac () {
	# Optimize flac files and remove id3
	while [ $# -ne 0 ]; do
		id3v2 --delete-all "$1"
		flac "$1" --best -f -o "$1"
		shift
	done
}

v2gif () {
	# Encode video to animated gif
	ffmpeg -v warning -i "$2" -vf "fps=$1,palettegen" -y /tmp/palette.png
	ffmpeg -v warning -i "$2" -i /tmp/palette.png -lavfi "$1 [x]; [x][1:v] paletteuse" -y "$3"
	rm /tmp/palette.png
}

v2psp () {
	# Encode video for PSP-1001 3.60 device
	ffmpeg -ss 00:10:05.00 -i "$1" -vframes 1 -vf scale=160:120 "${2%.*}.jpg"
	mv "${2%.*}.jpg" "${2%.*}.THM"
	HandBrakeCLI --input "$1" --output "$2" \
		--maxWidth 480 --maxHeight 272 --rate 24 --modulus 16 --loose-crop 15 \
		--encoder x264 --encoder-preset veryslow --encopts cabac=1:bframes=3:me=umh:ref=2:b_pyramid=0:8x8dct=0:trellis=2 \
		--vb 512 --two-pass \
		--subtitle "1" --subtitle-burned \
		--aencoder aac --ab 128 --arate 48
}

brc () {
	# Reload bashrc (and aliases)
	source ~/.bashrc
}
