
function script.build {
	typeset -l S

	if [[ -n "${sources[$target]}" ]]; then
		S="${sources[$target]}"
	elif [[ -e "${target}.in" ]]; then
		S="${target}.in"
	fi

	write -n "${target}:"

	if [[ -n "${S}" ]]; then
		write " $S $(dirname $target)"
		write "\t@echo '$(SED "${target}")'"
		write -n "\t${Q}sed -e '"
		write -n "s&@LIBDIR@&\$(LIBDIR)&;"
		write -n "s&@BINDIR@&\$(BINDIR)&;"
		write -n "s&@SHAREDIR@&\$(SHAREDIR)&;"
		write    "' $S > '${target}'"
		write "\t${Q}chmod +x '${target}'"
	fi

	write "\n"
}

function script.install {
	binary.install "$@"
}

function script.uninstall {
	binary.uninstall "$@"
}

function script.clean {
	typeset -l S

	if [[ -n "${sources[$target]}" ]]; then
		S="${sources[$target]}"
	else
		S="${target}.in"
	fi

	write "${target}.clean:"

	if [[ -e "${S%% *}" ]]; then
		write "\t@echo '$(RM ${target})'"
		write "\t${Q}rm -f ${target}"
	fi

	write
}

function script.distfiles {
	if [[ -e "${target}.in" ]]; then
		echo "${target}.in"
	else
		echo "${target}"
	fi
}

