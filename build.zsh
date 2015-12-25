#!/usr/bin/env zsh

# TODO:
#	- Make more checks about whether the “things” built and installed are C.
#	  (stuff *will* break if you add non-C things as targets)
#	- Clean some more (or a lot). I mean, this script could even be reused if
#	  it were cleaner, more readable and somewhat more documented.
#	- Using subdirs creates trouble. Really. Don’t do it unless it’s for
#	  completely separate, independent sub-projects.
#	  Also, they’re unmaintained and probably broken by now.
#
# WARNINGS and LIMITATIONS:
# 	- Using a relative path in DESTDIR= *will* fail.
#

# Script output

function info {
	echo "${fg_bold[green]}-- ${fg_bold[white]}$@${reset_color}"
}

function warning {
	echo "${fg_bold[yellow]}-- $@${reset_color}" >&2
}

function error {
	echo "${fg_bold[red]}-- ERROR: $@${reset_color}" >&2
}

# Makefiles’ output

function write {
	echo "$@" >> $Makefile
}

function CC {
	echo "${fg_bold[blue]}  [CC]    ${fg_bold[white]}$@${reset_color}"
}

function LD {
	echo "${fg_bold[green]}  [LD]    ${fg_bold[white]}$@${reset_color}"
}

function IN {
	echo "${fg_bold[red]}  [IN]    ${fg_bold[white]}$@${reset_color}"
}

function LN {
	echo "${fg_bold[yellow]}  [LN]    ${fg_bold[white]}$@${reset_color}"
}

function RM {
	echo "${fg_bold[white]}  [RM]    ${fg_bold[white]}$@${reset_color}"
}

function SED {
	echo "${fg_bold[green]}  [SED]   ${fg_bold[white]}$@${reset_color}"
}

function DIR {
	echo "${fg_bold[magenta]}  [DIR]   ${fg_bold[white]}$@${reset_color}"
}

function TAR {
	echo "${fg_bold[yellow]}  [TAR]   ${fg_bold[white]}$@${reset_color}"
}

# Generic helpers

function has {
	local elem="$1"

	shift 1
	for i in "$@"; do
		[[ "$i" == "$elem" ]] && return 0
	done

	return 1
}

# Specialized helpers

function subdirs {
	for DIR in ${subdirs[@]}; do
		if $gnu; then
			write "\t@echo '   ${fg_bold[red]}>>     ${fg_bold[magenta]}`pwd`/${DIR}${reset_color}'"
		fi

		write -n "\t${Q}(cd \"${DIR}\" && $MAKE"

		if $gnu; then
			write -n " --no-print-directory"
		fi

		write -n ' Q=$(Q) CC="$(CC)" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" DESTDIR="$(DESTDIR)"'

		for name value in ${variables[@]}; do
			write -n " ${name}=\"\$(${name})\""
		done

		for name path in ${prefixes[@]}; do
			write -n " ${name}=\"\$(${name})\""
		done

		if (( $# > 0 )); then
			write -n " $@"
		fi

		write ")"

		if $gnu; then
			write "\t@echo '   ${fg_bold[red]}<<     ${fg_bold[magenta]}`pwd`/${DIR}${reset_color}'"
		fi
	done
}

function get_distfiles {
	for file in "${dist[@]}" $(echo ${sources[@]}) $(echo ${depends[@]}); do
		echo "$file"
	done

	typeset -a src
	src=($(echo ${sources[@]}))
	for file in ${src[@]}; do
		typeset file="${file%.c}.h"
		if [[ -e "$file" ]]; then
			echo "$file"
		fi
	done

	for dir in ${subdirs[@]}; do
		(
			unset dist sources depends subdirs
			typeset -a dist
			typeset -A sources depends

			cd "$dir"
			. ./project.zsh
			for file in $(get_distfiles); do
				local file="${dir}/${file}"
				while [[ "$file" =~ "\.\./" ]]; do
					file="${file/[a-z]*\/\.\.\//}"
				done

				echo "${file}"
			done
		)
	done
}

function exists {
	[[ "$(whence -w ${1})" != "${1}: none" ]]
}

function duplicated {
	local elem="$1"
	local count=0
	shift 1
	local i
	for i in $@; do
		if [[ "$elem" == "$i" ]]; then
			((count++))

			if (( $count > 1 )); then
				return 0
			fi
		fi
	done

	return 1
}

for dir in "/usr/local/share/build.zsh" ./build; do
	[[ -d "$dir" ]] && {
		for i in "$dir"/*.zsh; do
			. "$i"
		done
	}
done

##
# And so it begins
##

function main {
	typeset -a prefixes directories
	typeset -A ldflags cflags sources type depends install auto

	prefixes=(
		PREFIX '/usr/local'
		BINDIR '$(PREFIX)/bin'
		LIBDIR '$(PREFIX)/lib'
		SHAREDIR '$(PREFIX)/share'
		INCLUDEDIR '$(PREFIX)/include'
	)

	if [[ -f project.zsh && -r project.zsh ]]; then
		. ./project.zsh
	else
		error "No “project.zsh” found in $(pwd)."
		exit 1
	fi

	: > $Makefile

	if [[ -n "$package" && -n "$version" ]]; then
		export package version

		write "PACKAGE = '$package'"
		write "VERSION = '$version'"
		write
	else
		if $root; then
			error "No \$package or no \$version defined in your project.zsh!"
			error "Making tarballs and other stuff will be disabled."
			error "(please note that those variables should be defined only..."
			error " ... in the root directory of your project’s repository)"

			root=false
		fi
	fi

	# Got some issues of PATH being replaced by a value of $path…
	for prefix _path in ${prefixes[@]}; do
		write "$prefix := $_path"
	done

	for var val in ${variables[@]}; do
		write "$var := ${val}"
	done

	write

	write "CC := ${CC:-cc}"
	write "AR := ${AR:-ar}"
	write "RANLIB := ${RANLIB:-ranlib}"
	write "CFLAGS := ${CFLAGS}"
	write "LDFLAGS := ${LDFLAGS}"
	write

	write "Q := @"
	write

	if [[ -z "${all}" ]] || (( ${#all[@]} == 0 )); then
		all=(${targets[@]} $((( ${#subdirs[@]} > 0 )) && echo subdirs))
	fi

	write -n "all: ${all[@]}"

	if $gnu; then
		write "\n"
	else
		write "\n\t@:\n"
	fi

	typeset -l -a exported_rules
	local target_index=1
	while (($target_index <= ${#targets[@]})); do
		local target="${targets[$target_index]}"

		if has "${target}" "${exported_rules[@]}"; then
			((target_index++))
			continue
		else
			exported_rules+=("$target")
		fi

		typeset -a src
		src=($(echo ${sources[$target]}))
		local installdir="${install[$target]}"

		if exists "${type[$target]}.build"; then
			${type[$target]}.build
		else
			if ! exists "${type[$target]}.test"; then
				error "No predefined rule for the following type: ${type[$target]}"
				error "  (expect trouble, nothing’s gonna work!)"
			fi
		fi

		if exists "${type[$target]}.install"; then
			${type[$target]}.install
		else
			if [[ -z "${installdir}" ]]; then
				error "No install[${type[${target}]}] and no default installation directory."
				error "Your “install” rule will be broken!"
			else
				write "${target}.install: \$(DESTDIR)${installdir}"
				write "\t@echo '$(IN ${installdir}/${target})'"
				write "\t@mkdir -p '\$(DESTDIR)/${installdir}'"
				write "\t${Q}install -m755 $target \$(DESTDIR)${installdir}/$target"
				write
			fi
		fi

		if exists "${type[$target]}.clean"; then
			${type[$target]}.clean
		else
			write "${target}.clean:"
			write "\t@echo '$(RM ${target})'"
			write "\t${Q}rm -f ${target}"
			write
		fi

		if exists "${type[$target]}.uninstall"; then
			${type[$target]}.uninstall
		else
			write "${target}.uninstall:"
			write "\t@echo '$(RM "${installdir}/${target}")'"
			write "\t${Q}rm -f '\$(DESTDIR)${installdir}/${target}'"
			write
		fi

		if exists "${type[$target]}.test"; then
			${type[$target]}.test
		fi

		((target_index++))
	done

	for dir in ${directories[@]}; do
		write "\$(DESTDIR)${dir}:"
		write "\t@echo '$(DIR ${dir})'"
		write "\t${Q}mkdir -p \$(DESTDIR)${dir}"
	done

	for dir __ in ${prefixes[@]}; do
		write "\$(DESTDIR)\$(${dir}):"
		write "\t@echo '$(DIR "\$(${dir})")'"
		write "\t${Q}mkdir -p \$(DESTDIR)\$(${dir})"
	done

	(( ${#subdirs[@]} > 0 )) && {
		write "subdirs:"
		subdirs
		write
	}

	write -n "install: subdirs.install"
	for target in ${targets[@]}; do
		write -n " ${target}.install"
	done
	write "\n\t@:\n"

	write "subdirs.install:"
	subdirs install
	write

	write -n "uninstall: subdirs.uninstall"
	for target in ${targets[@]}; do
		write -n " ${target}.uninstall"
	done
	write "\n\t@:\n"

	write "subdirs.uninstall:"
	subdirs uninstall
	write

	write -n "test: all subdirs subdirs.test"
	for target in ${targets[@]}; do
		if exists ${type[$target]}.test; then
			write -n " ${target}.test"
		fi
	done
	for target in ${tests[@]}; do
		write -n " ${target}"
	done
	write "\n\t@:\n"

	write "subdirs.test:"
	subdirs test
	write

	write -n "clean:"
	(( ${#targets[@]} > 0 )) && {
		for target in ${targets[@]}; do
			write -n " ${target}.clean"
			(
				typeset -a src
				src=($(echo ${sources[$target]}))

				for file in ${src[@]}; do
					write -n " ${file%.c}.o.clean"
				done
			)
		done
	}
	write
	(( ${#subdirs[@]} > 0 )) && subdirs clean
	write

	write "distclean: clean"
	(( ${#subdirs[@]} > 0 )) && subdirs distclean
	write

	if $root; then
		write "dist: dist-gz dist-xz dist-bz2"
		write "\t"$Q'rm -- $(PACKAGE)-$(VERSION)'
		write

		write "distdir:"
		write "\t"$Q'rm -rf -- $(PACKAGE)-$(VERSION)'
		write "\t"$Q'ln -s -- . $(PACKAGE)-$(VERSION)'
		write

		typeset -a distfiles
		distfiles=($(get_distfiles))
		local i

		for i in {1..${#distfiles[@]}}; do
			if duplicated "${distfiles[${i}]}" "${distfiles[@]}"; then
				distfiles[${i}]=
			fi
		done

		for i flag in gz z xz J bz2 j; do
			write "dist-${i}: \$(PACKAGE)-\$(VERSION).tar.$i"
			write "\$(PACKAGE)-\$(VERSION).tar.$i: distdir"
			write "\t@echo '$(TAR "\$(PACKAGE)-\$(VERSION).tar.$i")'"
			write "\t${Q}tar c${flag}f \$(PACKAGE)-\$(VERSION).tar.$i \\"
			for i in {1..${#distfiles}}; do
				if [[ -n "${distfiles[$i]}" ]]; then
					write -n "\t\t\$(PACKAGE)-\$(VERSION)/${distfiles[$i]}"
					if (( i != ${#distfiles} )); then
						write " \\"
					fi
				fi
			done
			write "\n"
		done
	fi

	write "help:"

	if [[ -n "$package" ]]; then
		write "	@echo '${fg_bold[white]} :: $package-$version${reset_color}'"
		write "	@echo ''"
	fi

	write "	@echo '${fg_bold[white]}Generic targets:${reset_color}'"
	typeset -la help
	help=(
		help       "Prints this help message."
		all        "Builds all targets."
		dist       "Creates tarballs of the files of the project."
		install    "Installs the project."
		clean      "Removes compiled files."
		uninstall  "Deinstalls the project."
	)
	for rule message in ${help[@]}; do
		printf "	@echo '${reset_color}    - ${fg_bold[green]}%-14s${fg[white]}$message${reset_color}'\n" \
			"$rule" >> $Makefile
	done

	write "	@echo ''"
	write "	@echo '${fg_bold[white]}CLI-modifiable variables:${reset_color}'"
	for VAR in CC CFLAGS LDFLAGS DESTDIR; do
		printf "	@echo '    - ${fg_bold[blue]}%-14s${fg[white]}\${$VAR}${reset_color}'\n" "$VAR" >> $Makefile
	done
	for VAR __ in ${prefixes}; do
		printf "	@echo '    - ${fg_bold[blue]}%-14s${fg[white]}\${$VAR}${reset_color}'\n" "$VAR" >> $Makefile
	done

	write "	@echo ''"
	write "	@echo '${fg_bold[white]}Project targets: ${reset_color}'"
	for T in ${targets[@]}; do
		if [[ "${auto[$T]}" != true ]]; then
			printf "	@echo '    - ${fg_bold[yellow]}%-14s${fg[white]}${type[$T]}${reset_color}'\n" "$T" >> $Makefile
		fi
	done

	write "	@echo ''"
	write "	@echo '${fg_bold[white]}Makefile options:${reset_color}'"
	printf "	@echo '    - %-14s$gnu'\n"    "gnu:"    >> $Makefile
	printf "	@echo '    - %-14s$colors'\n" "colors:" >> $Makefile

	write "	@echo ''"
	write "	@echo '${fg_bold[white]}Rebuild the Makefile with:${reset_color}'"
	write "	@echo '    zsh ./build.zsh$($colors && echo -n " -c")$($gnu && echo -n " -g")'"

	for i in ${subdirs[@]}; do
		(
			cd $i
			unset subdirs targets dist sources ldflags depends install type variables
			typeset -A sources ldflags depends install type variables
			typeset -a targets dist
			root=false main $i
		)
	done

	write ".PHONY: all subdirs clean distclean dist install uninstall help"
	write
}

export Makefile=Makefile
export MAKE='$(MAKE)'
export Q='$(Q)'
export gnu=false
export colors=false

while (($# > 0)); do
	case "$1" in
		-c|--colors)
			export colors=true
			autoload -U colors
			colors
		;;
		-g|--gnu)
			export gnu=true
		;;
		-h|--help)
			echo "usage: $0 [OPTIONS]"
			echo
			echo "Options:"
			echo "   -h, --help           Print this help message."
			echo "   -c, --colors         Use colors in your Makefiles"
			echo "                        (relies on zsh/colors and your current \$TERM)"
			echo "   -g, --gnu            Sell your soul for gmake-dependent features."
			return 0
		;;
		*)
			error "unrecognised parameter: $1"
			return 1
		;;
	esac

	shift 1
done

echo "Generating Makefiles..."
root=true main

