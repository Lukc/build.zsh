
function staticlib.build {
	write -n "${target}:"
	for i in ${src[@]} ${depends[@]}; do
		write -n " ${i%.c}.o"
	done
	write " ${depends[$target]} $(dirname $target)"
	write "\t@echo '$(LD ${target})'"
	write -n "\t$Q\$(AR) rc '${target}'"
	write    " ${src[@]//.c/.o}"
	write

	for i in ${src[@]}; do
		targets+=("${i%.c}.o")
		type[${i%.c}.o]=ofile
		auto[${i%.c}.o]=true
		cflags[${i%.c}.o]="${cflags[$target]}"
	done
}

function staticlib.install {
	local install="${install[$target]:-\$(LIBDIR)}"
	local basename="$(basename "${target}")"
	write "${target}.install: ${target}"
	write "\t@echo '$(IN "${install}/${basename}")'"
	write "\t${Q}mkdir -p '\$(DESTDIR)${install}'"
	write "\t${Q}install -m0755 ${target} \$(DESTDIR)${install}/${basename}"
	write
}

function staticlib.uninstall {
	local install="${install[$target]:-\$(LIBDIR)}"
	local basename="$(basename "${target}")"
	write "${target}.uninstall:"
	write "\t@echo '$(RM ${install}/${basename})'"
	write "\t${Q}rm -f '\$(DESTDIR)${install}/${basename}'"
	write
}

