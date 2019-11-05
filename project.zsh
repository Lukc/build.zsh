
package=build_zsh
version=0.4.1

targets=(build.zsh)
type[build.zsh]=script

for i in build/*.zsh; do
	targets+=($i)
	type[$i]=script
	install[$i]='$(SHAREDIR)/build.zsh'
#	auto[$i]=true
done

dist=(build/*.zsh build.zsh.in project.zsh Makefile)

