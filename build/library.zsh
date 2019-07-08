
function library.build {
	write -n "${target}: ${target}.so ${target}.a $(dirdep $target)"
	write
	write "\t@:"

	targets+=("${target}.so" "${target}.a")

	for i in ${target}.so ${target}.a; do
		auto[$i]=true
		sources[$i]="${sources[$target]}"
		cflags[$i]="-fPIC ${cflags[$target]}"
		ldflags[$i]="${ldflags[$target]}"
	done

	type[${target}.so]=sharedlib
	type[${target}.a]=staticlib
}

function library.install {
	write "${target}.install: ${target}.so.install ${target}.a.install"
	write
}

function library.uninstall {
	write "${target}.uninstall: ${target}.so.uninstall ${target}.a.uninstall"
	write
}

function library.clean {
	write "${target}.clean: ${target}.so.clean ${target}.a.clean"
	write
}

