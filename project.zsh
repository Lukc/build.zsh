
package=build_zsh
version=0.4.1

@script build.zsh
for it (build/*.zsh)
    @script $it --install '$(SHAREDIR)/build.zsh'

dist=( build/*.zsh build.zsh.in project.zsh Makefile )

