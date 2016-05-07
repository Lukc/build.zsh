
function crystal.build {
	write "${target}: ${src[@]} ${depends[$target]}"
	write "\t@echo '${fg_bold[magenta]}  [CR]    ${fg_bold[white]}$target${reset_color}'"
	write "\t${Q}crystal ${src[@]} -o '${target}'"

	write "\n"
}

function crystal.install {
	binary.install "$@"
}

function crystal.uninstall {
	binary.uninstall "$@"
}

function crystal.clean {
	script.clean "$@"
}

function crystal.distfiles {
	echo "${target}"
}

