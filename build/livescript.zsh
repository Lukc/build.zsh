
##
# The livescript backend makes a lot of assumptions about a *lot* of things.
# For example, it assumes you’ll build using browserify, that you’ll want
# to minify using babel, and so on.
#
# You’ll probably want to override or redefine some of those functions in
# your project.zsh, which kinda sucks but is also difficult to avoid with…
# well… you know, JavaScript.
##

function LSC {
	echo "${fg_bold[blue]}  LSC >   ${fg_bold[white]}$@${reset_color}"
}

function BUN {
	echo "${fg_bold[green]}  BUN >   ${fg_bold[white]}$@${reset_color}"
}

function MIN {
	echo "${fg_bold[red]}  MIN >   ${fg_bold[white]}$@${reset_color}"
}

function livescript.prelude {
	: ${install[$target]:=\$(SHAREDIR)/$package}
	: ${chmod[$target]:=644}
}

function livescript.build {
	write "${target}: ${target%.js}.bundle.js $(dirdep $target)"
	write "\t@echo '$(MIN ${target%.js}.js)'"
	write "\t${Q}npx babel --minified ${target%.js}.bundle.js -o ${target}"
	write "\n"

	write "${target%.js}.bundle.js: ${sources[$target]} ${depends[$target]} $(dirdep $target)"
	write "\t@echo '$(BUN ${target%.js}.bundle.js)'"
	write "\t${Q}npx browserify -t browserify-livescript ${sources[$target]} -o ${target%.js}.bundle.js"
	write "\n"
}

function livescript.clean {
	write "${target}.clean:"
	for file in ${target} ${target%.js}.bundle.js; do
		write "\t@echo '$(RM ${file})'"
		write "\t${Q}rm -f ${file}"
	done
	write "\n"
}

function livescript.install {
	binary.install "$@"
}

function livescript.uninstall {
	binary.uninstall "$@"
}
