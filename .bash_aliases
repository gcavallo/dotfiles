if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias la='ls -a'
alias ll='ls -alh'
alias sudo='sudo '
alias vi='vim'
alias lsblk='lsblk -o NAME,TYPE,KNAME,FSTYPE,MOUNTPOINT,LABEL,UUID,OWNER,GROUP,MODE,TYPE,SIZE'
alias 7zp='7za a -t7z -m0=lzma2 -mx=9 -mhe=on -p'
alias killff='killall ffxivlauncher.exe'

serversslfp () {
	# Get server SSL certificate fingerprint in MD5, SHA1 and SHA256.
	openssl s_client -connect $1 < /dev/null 2>/dev/null | openssl x509 -fingerprint -md5 -noout -in /dev/stdin
	sleep 1
	openssl s_client -connect $1 < /dev/null 2>/dev/null | openssl x509 -fingerprint -sha1 -noout -in /dev/stdin
	sleep 1
	openssl s_client -connect $1 < /dev/null 2>/dev/null | openssl x509 -fingerprint -sha256 -noout -in /dev/stdin
}

backup () {
	# Backup given directories to /mnt/backup.
	for dir in "$@"; do
		rsync -aXq --delete --delete-excluded --exclude-from="/etc/rsync-excludes.txt" "$(realpath "$dir")" /mnt/backup
	done
}
