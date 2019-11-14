
function ofile.prelude {
	binary.prelude "$@"
}

function ofile.build {
	local dirname="$(dirname "$target")"
	write -n "${target}: ${target%.o}.c $(dirdep $target "${target%.o}.c ${sources[$target]}" "${depends[@target]}")"

	sed '/^#include "/!d;s/^#include "//;s/"$//' "${target%.o}.c" | \
	while read h; do
		h="$dirname/$h"

		write -n " $h"
	done
	write

	write "\t@echo '$(CC ${target})'"
	write -n "\t$Q\$(CC) \$(CFLAGS) ${cflags[$target]} -c ${target%.o}.c "
	write -n " ${cflags[$target]}"
	write " -o ${target}"
	write
}

function ofile.install {
	write "${target}.install:"
	write
}

function ofile.uninstall {
	write "${target}.uninstall:"
	write
}

