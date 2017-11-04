
function man.build {
	typeset -l S

	if [[ -n "${sources[$target]}" ]]; then
		S="${sources[$target]}"
	elif [[ -e "${target}.md" ]]; then
		S="${target}.md"
	fi

	write -n "${target}:"

	if [[ -n "${S}" ]]; then
		write " $S"
		write "\t@echo '$(SED "${target}" | sed 's|SED|MAN|')'"
		write "\t${Q}pandoc -s --from markdown --to man '$S' -o '${target}'"
	fi

	write "\n"
}

function man.install {
	local basename="${filename[$target]}"
	if [[ -z "$basename" ]]; then
		basename="$(basename "${target}")"
	fi

	local section="${basename%.md}"
	section="${section##*.}"
	local install="${install[$target]:-\$(MANDIR)/man${section}}"

	write "${target}.install: ${target}"
	write "\t@echo '$(IN "${install}/${basename}")'"
	write "\t${Q}mkdir -p '\$(DESTDIR)${install}'"
	write "\t${Q}install -m0644 ${target} \$(DESTDIR)${install}/${basename}"
	write
}

function man.uninstall {
	local basename="${filename[$target]}"
	if [[ -z "$basename" ]]; then
		basename="$(basename "${target}")"
	fi

	local section="${basename%.md}"
	section="${section##*.}"
	local install="${install[$target]:-\$(MANDIR)/man${section}}"

	write "${target}.uninstall:"
	write "\t@echo '$(RM ${install}/${basename})'"
	write "\t${Q}rm -f '\$(DESTDIR)${install}/${basename}'"
	write
}

function man.clean {
	typeset -l S

	if [[ -n "${sources[$target]}" ]]; then
		S="${sources[$target]}"
	else
		S="${target}.md"
	fi

	write "${target}.clean:"

	if [[ -e "${S%% *}" ]]; then
		write "\t@echo '$(RM ${target})'"
		write "\t${Q}rm -f ${target}"
	fi

	write
}

function man.distfiles {
	if [[ -e "${target}.md" ]]; then
		echo "${target}.md"
	else
		echo "${target}"
	fi
}

