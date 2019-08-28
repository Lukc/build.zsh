
function scdocman.build {
	typeset -l S

	if [[ -n "${sources[$target]}" ]]; then
		S="${sources[$target]}"
	elif [[ -e "${target}.scd" ]]; then
		S="${target}.scd"
	fi

	write -n "${target}:"

	if [[ -n "${S}" ]]; then
		write " $S $(dirdep $target)"
		write "\t@echo '$(SED "${target}" | sed 's|SED|MAN|')'"
		write "\t${Q}scdoc < '$S' > '${target}'"
	fi

	write "\n"
}

function scdocman.install {
	local basename="${filename[$target]}"
	if [[ -z "$basename" ]]; then
		basename="$(basename "${target}")"
	fi

	local section="${basename%.scd}"
	section="${section##*.}"
	local install="${install[$target]:-\$(MANDIR)/man${section}}"

	write "${target}.install: ${target}"
	write "\t@echo '$(IN "${install}/${basename}")'"
	write "\t${Q}mkdir -p '\$(DESTDIR)${install}'"
	write "\t${Q}install -m0644 ${target} \$(DESTDIR)${install}/${basename}"
	write
}

function scdocman.uninstall {
	local basename="${filename[$target]}"
	if [[ -z "$basename" ]]; then
		basename="$(basename "${target}")"
	fi

	local section="${basename%.scd}"
	section="${section##*.}"
	local install="${install[$target]:-\$(MANDIR)/man${section}}"

	write "${target}.uninstall:"
	write "\t@echo '$(RM ${install}/${basename})'"
	write "\t${Q}rm -f '\$(DESTDIR)${install}/${basename}'"
	write
}

function scdocman.clean {
	typeset -l S

	if [[ -n "${sources[$target]}" ]]; then
		S="${sources[$target]}"
	else
		S="${target}.scd"
	fi

	write "${target}.clean:"

	if [[ -e "${S%% *}" ]]; then
		write "\t@echo '$(RM ${target})'"
		write "\t${Q}rm -f ${target}"
	fi

	write
}

function scdocman.distfiles {
	if [[ -e "${target}.scd" ]]; then
		echo "${target}.scd"
	else
		echo "${target}"
	fi
}

