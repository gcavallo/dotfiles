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
alias killff="killall ffxivlauncher.exe"
alias mutt="mutt -F $HOME/.config/mutt/muttrc"
alias xfce4-terminal="xfce4-terminal --tab"

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

v2gif () {
	# Encode video to animated gif
	fps=10 # gif frames per second
	ffmpeg -v warning -i "$1" -vf "fps=$fps,palettegen" -y /tmp/palette.png
	ffmpeg -v warning -i "$1" -i /tmp/palette.png -lavfi "$fps [x]; [x][1:v] paletteuse" -y "$2"
}

v2hevc () {
	# Encode video to h265 stream
	crop=$((140 * 2)) # height crop (top + bottom)
	profile="main10"  # x265 profile
	preset="medium"   # x265 preset
	crf=18            # x265 constant rate factor
	ffmpeg -i "$1" -vf "crop=iw:ih-$crop" -f yuv4mpegpipe - | \
	x265 - --no-progress --y4m --preset $preset --profile $profile --crf $crf "$2" --tune grain
}

v2avc () {
	# Encode video to h264 stream
	crop=$((140 * 2)) # height crop (top + bottom)
	preset="veryslow" # x264 preset
	crf=19            # x264 constant rate factor
	ffmpeg -i "$1" -vf "crop=iw:ih-$crop" -c:v libx264 \
	-preset $preset -profile:v high -level 4.2 -crf $crf "$2" #--tune
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

a2aac () {
	# Encode audio to AAC
	ffmpeg -i "$1" -c:a libfdk_aac -b:a 192k "$2"
}

a2flac () {
	# Encode audio to AAC
	ffmpeg -i "$1" -c:a flac -compression_level 12 "$2"
}

brc () {
	# Reload bashrc (and aliases)
	source ~/.bashrc
}
