
function script.build {
	local -l S=${sources[$target]:-}
	write -n "${target}:"
	[[ -z $S ]] && S=($target.in(N))
	[[ -z $S ]] && {
		write "\n"
		return
	}
	write " $S $(dirdep $target)"
	write "\t@echo '$(SED "${target}")'"
	write -n "\t${Q}sed -e '"
	local variable value
	for variable value ( $prefixes $variables )
		write -n "s&@${variable}@&\$(${variable})&;"
	write "' $S > '${target}'"
	write "\t${Q}chmod +x '${target}'\n"
}

function script.install {
	binary.install "$@"
}

function script.uninstall {
	binary.uninstall "$@"
}

function script.clean {
	typeset -l S=${sources[$target]:-$target.in}
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

