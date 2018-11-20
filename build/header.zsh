
function header.build {
	:
}

function header.install {
	local install="${install[$target]:-\$(INCLUDEDIR)}"
	local basename="${filename[$target]}"
	if [[ -z "$basename" ]]; then
		basename="$(basename "${target}")"
	fi

	write "${target}.install: ${target}"
	write "\t@echo '$(IN "${install}/${basename}")'"
	write "\t${Q}mkdir -p '\$(DESTDIR)${install}'"
	write "\t${Q}install -m0644 ${target} \$(DESTDIR)${install}/${basename}"
	write
}

function header.uninstall {
	[[ -z "${install[$target]}" ]] && install[$target]="\$(INCLUDEDIR)"
	binary.uninstall "$@"
}

function header.clean {
	write "${target}.clean: ${target}"
	write "\t${Q}:"
	write
}

function header.distfiles {
	echo "${target}"
}

