
function binary.build {
	write -n "${target}:"
	for i in ${src[@]}; do
		write -n " ${i%.*}.o"
	done
	write " ${depends[$target]}"
	write "\t@echo '$(LD ${target})'"
	write -n "\t$Q\$(CC) -o ${target} \$(LDFLAGS)"
	write -n " ${src[@]//.c/.o}"
	write " ${ldflags[$target]}"
	write

	for i in ${src[@]}; do
		local dirname="$(dirname "$i")"

		write -n "${i%.c}.o: ${i}"

		sed '/^#include "/!d;s/^#include "//;s/"$//' $i | while read h; do
			h="$dirname/$h"

			write -n " $h"
		done
		write

		write "\t@echo '$(CC ${i%.c}.o)'"
		write -n "\t$Q\$(CC) \$(CFLAGS) ${cflags[$target]} -c ${i} "
		write -n " ${cflags[$target]}"
		write " -o ${i%.c}.o"
		write
	done
}

function binary.install {
	local install="${install[$target]:-\$(BINDIR)}"
	write "${target}.install: ${target}"
	write "\t@echo '$(IN "${install}/${target}")'"
	write "\t${Q}mkdir -p '\$(DESTDIR)${install}/${target}'"
	write "\t${Q}install -m0755 ${target} \$(DESTDIR)${install}/${target}"
	write
}

function binary.uninstall {
	local install="${install[$target]:-\$(BINDIR)}"
	write "${target}.uninstall:"
	write "\t@echo '$(RM ${install}/${target})'"
	write "\t${Q}rm -f '\$(DESTDIR)${install}/${target}'"
	write
}

function binary.clean {
	write "${target}.clean:"
	write "\t@echo '$(RM ${target})'"
	write "\t${Q}rm -f ${target}"
	write

	for i in ${src[@]}; do
		write "${i%.c}.o.clean:"
		write "\t@echo '$(RM ${i%.c}.o)'"
		write "\t${Q}rm -f ${i%.c}.o"
		write
	done
}

