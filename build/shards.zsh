
function shards.build {
	write "${target}: ${src[@]} ${depends[$target]}"
	write "\t@echo '${fg_bold[magenta]}  [SHARD]    ${fg_bold[white]}$target${reset_color}'"
	write "\t${Q}shards build"

	write "\n"
}

function shards.install {
	binary.install "$@"
}

function shards.uninstall {
	binary.uninstall "$@"
}

function shards.clean {
	script.clean "$@"
}

function shards.distfiles {
	echo "${target}"
}

