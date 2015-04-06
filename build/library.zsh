
function library.build {
	write -n "${target}:"
	for i in ${src[@]}; do
		write -n " ${i%.*}.o"
	done
	write " ${depends[$target]}"
	write "\t@echo '$(LD ${target})'"
	write -n "\t$Q\$(CC) -o ${target} -shared \$(LDFLAGS)"
	write -n " ${src[@]//.c/.o}"
	write " ${ldflags[$target]}"
	write

	for i in ${src[@]}; do
		targets+=("${i%.c}.o")
		type[${i%.c}.o]=ofile
		auto[${i%.c}.o]=true
		cflags[${i%.c}.o]="-fPIC ${cflags[$target]}"
	done
}

function library.install {
	local install="${install[$target]:-\$(LIBDIR)}"
	write "${target}.install: ${target}"
	write "\t@echo '$(IN "${install}/${target}")'"
	write "\t${Q}mkdir -p '\$(DESTDIR)${install}'"
	write "\t${Q}install -m0755 ${target} \$(DESTDIR)${install}/${target}"
	write
}

function library.uninstall {
	local install="${install[$target]:-\$(LIBDIR)}"
	write "${target}.uninstall:"
	write "\t@echo '$(RM ${install}/${target})'"
	write "\t${Q}rm -f '\$(DESTDIR)${install}/${target}'"
	write
}

function library.clean {
	write "${target}.clean:"
	write "\t@echo '$(RM ${target})'"
	write "\t${Q}rm -f ${target}"
	write
}

