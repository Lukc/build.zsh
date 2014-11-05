
function script.build {
	write -n "${target}:"

	if [[ -e "${target}.in" ]]; then
		write " ${target}.in"
		write "\tcat ${target}.in > ${target}"
		write "\tchmod +x ${target}"
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
	write "${target}.clean:"

	if [[ -e "${target}.in" ]]; then
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

