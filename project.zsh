
package=build_zsh
version=0.4.1

@script build.zsh
local file
for file (build/*.zsh)
    @script $file --install '$(SHAREDIR)/build.zsh'

dist=( build/*.zsh build.zsh.in project.zsh Makefile )

