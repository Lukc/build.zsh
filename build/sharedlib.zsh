
function sharedlib.build {
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
		cflags[${i%.c}.o]="${cflags[$target]}"
		ldflags[${i%.c}.o]="${ldflags[$target]}"
	done
}

function sharedlib.install {
	local install="${install[$target]:-\$(LIBDIR)}"
	typeset -l -a symlinks

	local realtarget="${target}.${version}"
	for i in ".${version%.*}" ".${version%.*.*}" ""; do
		symlinks+=("${target}${i}")
	done

	write "${target}.install: ${target}"
	write "\t@echo '$(IN "${install}/${realtarget}")'"
	write "\t${Q}mkdir -p '\$(DESTDIR)${install}'"
	write "\t${Q}install -m0755 ${target} \$(DESTDIR)${install}/${realtarget}"
	for l in ${symlinks[@]}; do
		write "\t@echo '$(LN "${install}/${l}")'"
		write -n "\t${Q}ln -sf '${install}/${realtarget}' "
		write    "'\$(DESTDIR)/${install}/$l'"
	done
	write
}

function sharedlib.uninstall {
	local install="${install[$target]:-\$(LIBDIR)}"
	typeset -l -a symlinks

	local realtarget="${target}.${version}"
	for i in ".${version%.*}" ".${version%.*.*}" ""; do
		symlinks+=("${target}${i}")
	done

	write "${target}.uninstall:"
	for target in ${realtarget} ${symlinks[@]}; do
		write "\t@echo '$(RM ${install}/${target})'"
		write "\t${Q}rm -f '\$(DESTDIR)${install}/${target}'"
	done

	write
}

