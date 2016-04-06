
function MOON {
	echo "${fg_bold[yellow]}  [MOON]  ${fg_bold[white]}$@${reset_color}"
}

function moon.build {
	write -n "${target}:"

	typeset -l S

	if [[ -n "${sources[$target]}" ]]; then
		S="${sources[$target]}"
	elif [[ -e "${target%.lua}.moon" ]]; then
		S="${target%.lua}.moon"
	fi

	if [[ -n "${S}" ]]; then
		write " ${S}"
		write "\t@echo '$(MOON "${target}")'"
#		write "\t@echo '$(SED "${basename}")'"
#		write -n "\t${Q}sed -e '"
#		write -n "s&@LIBDIR@&\$(LIBDIR)&;"
#		write -n "s&@BINDIR@&\$(BINDIR)&;"
#		write -n "s&@SHAREDIR@&\$(SHAREDIR)&;"
#		write    "' '${basename}.in' > '${basename}'"
		write "\t${Q}moonc -p $S > '${target}'"
#		write "\t${Q}chmod +x '${basename}'"
	fi

	write "\n"
}

function moon.install {
	binary.install "$@"
}

function moon.uninstall {
	binary.uninstall "$@"
}

function moon.clean {
	typeset -l S

	if [[ -n "${sources[$target]}" ]]; then
		S="${sources[$target]}"
	else
		S="${target%.lua}.moon"
	fi

	write "${target}.clean:"

	if [[ -e "${S%% *}" ]]; then
		write "\t@echo '$(RM ${target})'"
		write "\t${Q}rm -f ${target}"
	fi

	write
}

function moon.distfiles {
	if [[ -e "${target}.moon" ]]; then
		echo "${target}.moon"
	else
		echo "${target}"
	fi
}

