
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
		if [[ -z "${install[$target]}" ]]; then
			write "\t${Q}echo '#!/usr/bin/env lua' > '${target}'"
			write "\t${Q}moonc -p $S >> '${target}'"
		else
			write "\t${Q}moonc -p $S > '${target}'"
			write "\t${Q}chmod +x '${basename}'"
		fi
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

