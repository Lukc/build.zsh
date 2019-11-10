
function CSS {
	echo "${fg_bold[yellow]}  CSS >   ${fg_bold[white]}$@${reset_color}"
}

function sass.prelude {
	: ${install[$target]:=\$(SHAREDIR)/$package}
	: ${chmod[$target]:=644}
}

function sass.build {
	write "${target}: ${sources[$target]} $(dirdep $target)"
	write "\t@echo '$(CSS ${target})'"
	write "\t${Q}sassc ${sources[$target]} > ${target}"
	write "\n"
}

function sass.clean {
	script.clean "$@"
}

function sass.install {
	binary.install "$@"
}

function sass.uninstall {
	binary.uninstall "$@"
}

