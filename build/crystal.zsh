
function crystal.prelude {
	if ! has_array_key CRFLAGS; then
		variables+=(CRFLAGS "--release")
	fi
}

function crystal.build {
	write "${target}: ${src[@]} ${depends[$target]} $(dirdep $target)"
	write "\t@echo '${fg_bold[magenta]}  CR >    ${fg_bold[white]}$target${reset_color}'"
	write "\t${Q}crystal build ${crflags[$target]} \$(CRFLAGS) ${src[@]} -o '${target}'"

	write "\n"
}

function crystal.install {
	binary.install "$@"
}

function crystal.uninstall {
	binary.uninstall "$@"
}

function crystal.clean {
	write "${target}.clean:"
	write "\t@echo '$(RM ${target})'"
	write "\t${Q}rm -f ${target}"
	write
}

function crystal.distfiles {
	echo "${target}"
}

