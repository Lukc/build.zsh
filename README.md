
# build.zsh

A zsh-powered tool that writes plain, simple Makefiles.

## CLI usage

```
usage: ./build.zsh [OPTIONS]

Options:
   -h, --help           Print this help message.
   -c, --colors         Use colors in your Makefiles
                        (relies on zsh/colors and your current $TERM)
   -g, --gnu            Sell your soul for gmake-dependent features.
```

You should REALLY use `-c`, at least because the Makefiles look cooler.

## Generating a Makefile

```sh
$ ls project.zsh
project.zsh
$ build.zsh
Generating Makefiles...
$
```

## Installation with pre-built Makefile

Running `make help` gives the following output for `build.zsh`.

```
 :: build_zsh-0.2.1

Generic targets:
    - help           Prints this help message.
    - all            Builds all targets.
    - dist           Creates tarballs of the files of the project.
    - install        Installs the project.
    - clean          Removes compiled files.
    - uninstall      Deinstalls the project.

CLI-modifiable variables:
    - CC             cc
    - CFLAGS         
    - LDFLAGS        
    - DESTDIR        
    - PREFIX         /usr/local
    - BINDIR         /usr/local/bin
    - LIBDIR         /usr/local/lib
    - SHAREDIR       /usr/local/share
    - INCLUDEDIR     /usr/local/include

Project targets: 
    - build.zsh      script
    - build/binary.zsh script
    - build/crystal.zsh script
    - build/library.zsh script
    - build/moon.zsh script
    - build/ofile.zsh script
    - build/script.zsh script
    - build/sharedlib.zsh script
    - build/staticlib.zsh script

Makefile options:
    - gnu:           false
    - colors:        false

Rebuild the Makefile with:
    zsh ./build.zsh
```

A similar output is shown for any project having a Makefile that was generated with `build.zsh`.

The help message is updated when variables are defined from the command line.
For example, running `make PREFIX=/opt/foo help` will show that most of the directory variables have changed.
`make help` is a great tool to check you’re configuring your build just right before spending ours compiling or installing your software!

The traditionnal `make && make install` still apply to softwares configured with `build.zsh`.
Actually, you could call it `build.zsh && make && make install`.

build.zsh uses itself to generate its Makefile.
If you wanna install it, you should know how to at this point. :)

## Project configuration

### Example: build.zsh

```zsh
package=build_zsh # Name of the package.
version=0.2.1     # Version of the package.

targets=(build.zsh)     # The things to build or install.
type[build.zsh]=script  # How they’re built.

# Using a for loop to add more targets.
# In this example, we’re registering scripts for installation.
for i in build/*.zsh; do
	targets+=($i)
	type[$i]=script

	# Installation in a non-default directory.
	install[$i]='$(SHAREDIR)/build.zsh'

	# Targets marked as “auto” won’t appear in `make help`.
	auto[$i]=true
done

# Files to add to tarballs through `make dist`.
dist=(build.zsh.in build/*.zsh project.zsh Makefile)
```

Running `build.zsh` will generate a new Makefile. :)

Don’t hesitate to add `-c` and `-g` to improve the Makefile’s appearance.

## Debug

If your build.zsh-generated Makefile is buggy, you can run `make` with the `Q=` variable to show everything that’s happening.

Example: `make Q= build`.

