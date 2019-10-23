
function binary.build {
	write -n "${target}:"
	for i in ${src[@]}; do
		write -n " ${i%.*}.o"
	done
	write " ${depends[$target]} $(dirdep $target)"
	write "\t@echo '$(LD ${target})'"
	write -n "\t$Q\$(CC) -o ${target} \$(LDFLAGS)"
	write -n " ${src[@]//.c/.o}"
	write " ${ldflags[$target]}"
	write

	for i in ${src[@]}; do
		targets+=("${i%.c}.o")
		type[${i%.c}.o]=ofile
		auto[${i%.c}.o]=true
		cflags[${i%.c}.o]="${cflags[$target]}"
	done
}

function binary.install {
	local install="${install[$target]:-\$(BINDIR)}"
	local basename="${filename[$target]}"
	if [[ -z "$basename" ]]; then
		basename="$(basename "${target}")"
	fi

	write "${target}.install: ${target}"
	write "\t@echo '$(IN "${install}/${basename}")'"
	write "\t${Q}mkdir -p '\$(DESTDIR)${install}'"
	write "\t${Q}install -m${chmod[$target]:-0755} ${target} \$(DESTDIR)${install}/${basename}"
	write
}

function binary.uninstall {
	local install="${install[$target]:-\$(BINDIR)}"
	local basename="${filename[$target]}"
	if [[ -z "$basename" ]]; then
		basename="$(basename "${target}")"
	fi

	write "${target}.uninstall:"
	write "\t@echo '$(RM ${install}/${basename})'"
	write "\t${Q}rm -f '\$(DESTDIR)${install}/${basename}'"
	write
}

function binary.clean {
	write -n "${target}.clean: "
	src=($(echo ${sources[$target]}))

	for file in ${src[@]}; do
		write -n " ${file%.c}.o.clean"
	done
	write

	write "\t@echo '$(RM ${target})'"
	write "\t${Q}rm -f ${target}"
	write
}

