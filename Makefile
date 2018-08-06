PACKAGE = 'build_zsh'
VERSION = '0.2.1'

PREFIX := /usr/local
BINDIR := $(PREFIX)/bin
LIBDIR := $(PREFIX)/lib
SHAREDIR := $(PREFIX)/share
INCLUDEDIR := $(PREFIX)/include
MANDIR := $(SHAREDIR)/man

CC := cc
AR := ar
RANLIB := ranlib
CFLAGS := 
LDFLAGS := 

Q := @

all: build.zsh build/binary.zsh build/crystal.zsh build/library.zsh build/man.zsh build/moon.zsh build/ofile.zsh build/script.zsh build/shards.zsh build/sharedlib.zsh build/staticlib.zsh
	@:

build.zsh: build.zsh.in
	@echo '  SED >   build.zsh'
	$(Q)sed -e 's&@LIBDIR@&$(LIBDIR)&;s&@BINDIR@&$(BINDIR)&;s&@SHAREDIR@&$(SHAREDIR)&;' build.zsh.in > 'build.zsh'
	$(Q)chmod +x 'build.zsh'


build.zsh.install: build.zsh
	@echo '  IN >    $(BINDIR)/build.zsh'
	$(Q)mkdir -p '$(DESTDIR)$(BINDIR)'
	$(Q)install -m0755 build.zsh $(DESTDIR)$(BINDIR)/build.zsh

build.zsh.clean:
	@echo '  RM >    build.zsh'
	$(Q)rm -f build.zsh

build.zsh.uninstall:
	@echo '  RM >    $(BINDIR)/build.zsh'
	$(Q)rm -f '$(DESTDIR)$(BINDIR)/build.zsh'

build/binary.zsh:

build/binary.zsh.install: build/binary.zsh
	@echo '  IN >    $(SHAREDIR)/build.zsh/binary.zsh'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/binary.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/binary.zsh

build/binary.zsh.clean:

build/binary.zsh.uninstall:
	@echo '  RM >    $(SHAREDIR)/build.zsh/binary.zsh'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/binary.zsh'

build/crystal.zsh:

build/crystal.zsh.install: build/crystal.zsh
	@echo '  IN >    $(SHAREDIR)/build.zsh/crystal.zsh'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/crystal.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/crystal.zsh

build/crystal.zsh.clean:

build/crystal.zsh.uninstall:
	@echo '  RM >    $(SHAREDIR)/build.zsh/crystal.zsh'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/crystal.zsh'

build/library.zsh:

build/library.zsh.install: build/library.zsh
	@echo '  IN >    $(SHAREDIR)/build.zsh/library.zsh'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/library.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/library.zsh

build/library.zsh.clean:

build/library.zsh.uninstall:
	@echo '  RM >    $(SHAREDIR)/build.zsh/library.zsh'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/library.zsh'

build/man.zsh:

build/man.zsh.install: build/man.zsh
	@echo '  IN >    $(SHAREDIR)/build.zsh/man.zsh'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/man.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/man.zsh

build/man.zsh.clean:

build/man.zsh.uninstall:
	@echo '  RM >    $(SHAREDIR)/build.zsh/man.zsh'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/man.zsh'

build/moon.zsh:

build/moon.zsh.install: build/moon.zsh
	@echo '  IN >    $(SHAREDIR)/build.zsh/moon.zsh'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/moon.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/moon.zsh

build/moon.zsh.clean:

build/moon.zsh.uninstall:
	@echo '  RM >    $(SHAREDIR)/build.zsh/moon.zsh'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/moon.zsh'

build/ofile.zsh:

build/ofile.zsh.install: build/ofile.zsh
	@echo '  IN >    $(SHAREDIR)/build.zsh/ofile.zsh'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/ofile.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/ofile.zsh

build/ofile.zsh.clean:

build/ofile.zsh.uninstall:
	@echo '  RM >    $(SHAREDIR)/build.zsh/ofile.zsh'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/ofile.zsh'

build/script.zsh:

build/script.zsh.install: build/script.zsh
	@echo '  IN >    $(SHAREDIR)/build.zsh/script.zsh'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/script.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/script.zsh

build/script.zsh.clean:

build/script.zsh.uninstall:
	@echo '  RM >    $(SHAREDIR)/build.zsh/script.zsh'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/script.zsh'

build/shards.zsh:

build/shards.zsh.install: build/shards.zsh
	@echo '  IN >    $(SHAREDIR)/build.zsh/shards.zsh'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/shards.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/shards.zsh

build/shards.zsh.clean:

build/shards.zsh.uninstall:
	@echo '  RM >    $(SHAREDIR)/build.zsh/shards.zsh'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/shards.zsh'

build/sharedlib.zsh:

build/sharedlib.zsh.install: build/sharedlib.zsh
	@echo '  IN >    $(SHAREDIR)/build.zsh/sharedlib.zsh'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/sharedlib.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/sharedlib.zsh

build/sharedlib.zsh.clean:

build/sharedlib.zsh.uninstall:
	@echo '  RM >    $(SHAREDIR)/build.zsh/sharedlib.zsh'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/sharedlib.zsh'

build/staticlib.zsh:

build/staticlib.zsh.install: build/staticlib.zsh
	@echo '  IN >    $(SHAREDIR)/build.zsh/staticlib.zsh'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/staticlib.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/staticlib.zsh

build/staticlib.zsh.clean:

build/staticlib.zsh.uninstall:
	@echo '  RM >    $(SHAREDIR)/build.zsh/staticlib.zsh'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/staticlib.zsh'

$(DESTDIR)$(PREFIX):
	@echo '  DIR >   $(PREFIX)'
	$(Q)mkdir -p $(DESTDIR)$(PREFIX)
$(DESTDIR)$(BINDIR):
	@echo '  DIR >   $(BINDIR)'
	$(Q)mkdir -p $(DESTDIR)$(BINDIR)
$(DESTDIR)$(LIBDIR):
	@echo '  DIR >   $(LIBDIR)'
	$(Q)mkdir -p $(DESTDIR)$(LIBDIR)
$(DESTDIR)$(SHAREDIR):
	@echo '  DIR >   $(SHAREDIR)'
	$(Q)mkdir -p $(DESTDIR)$(SHAREDIR)
$(DESTDIR)$(INCLUDEDIR):
	@echo '  DIR >   $(INCLUDEDIR)'
	$(Q)mkdir -p $(DESTDIR)$(INCLUDEDIR)
$(DESTDIR)$(MANDIR):
	@echo '  DIR >   $(MANDIR)'
	$(Q)mkdir -p $(DESTDIR)$(MANDIR)
install: subdirs.install build.zsh.install build/binary.zsh.install build/crystal.zsh.install build/library.zsh.install build/man.zsh.install build/moon.zsh.install build/ofile.zsh.install build/script.zsh.install build/shards.zsh.install build/sharedlib.zsh.install build/staticlib.zsh.install
	@:

subdirs.install:

uninstall: subdirs.uninstall build.zsh.uninstall build/binary.zsh.uninstall build/crystal.zsh.uninstall build/library.zsh.uninstall build/man.zsh.uninstall build/moon.zsh.uninstall build/ofile.zsh.uninstall build/script.zsh.uninstall build/shards.zsh.uninstall build/sharedlib.zsh.uninstall build/staticlib.zsh.uninstall
	@:

subdirs.uninstall:

test: all subdirs subdirs.test
	@:

subdirs.test:

clean: build.zsh.clean build/binary.zsh.clean build/crystal.zsh.clean build/library.zsh.clean build/man.zsh.clean build/moon.zsh.clean build/ofile.zsh.clean build/script.zsh.clean build/shards.zsh.clean build/sharedlib.zsh.clean build/staticlib.zsh.clean

distclean: clean

dist: dist-gz dist-xz dist-bz2
	$(Q)rm -- $(PACKAGE)-$(VERSION)

distdir:
	$(Q)rm -rf -- $(PACKAGE)-$(VERSION)
	$(Q)ln -s -- . $(PACKAGE)-$(VERSION)

dist-gz: $(PACKAGE)-$(VERSION).tar.gz
$(PACKAGE)-$(VERSION).tar.gz: distdir
	@echo '  TAR >   $(PACKAGE)-$(VERSION).tar.gz'
	$(Q)tar czf $(PACKAGE)-$(VERSION).tar.gz \
		$(PACKAGE)-$(VERSION)/build/binary.zsh \
		$(PACKAGE)-$(VERSION)/build/crystal.zsh \
		$(PACKAGE)-$(VERSION)/build/library.zsh \
		$(PACKAGE)-$(VERSION)/build/man.zsh \
		$(PACKAGE)-$(VERSION)/build/moon.zsh \
		$(PACKAGE)-$(VERSION)/build/ofile.zsh \
		$(PACKAGE)-$(VERSION)/build/script.zsh \
		$(PACKAGE)-$(VERSION)/build/shards.zsh \
		$(PACKAGE)-$(VERSION)/build/sharedlib.zsh \
		$(PACKAGE)-$(VERSION)/build/staticlib.zsh \
		$(PACKAGE)-$(VERSION)/build.zsh.in \
		$(PACKAGE)-$(VERSION)/project.zsh \
		$(PACKAGE)-$(VERSION)/Makefile

dist-xz: $(PACKAGE)-$(VERSION).tar.xz
$(PACKAGE)-$(VERSION).tar.xz: distdir
	@echo '  TAR >   $(PACKAGE)-$(VERSION).tar.xz'
	$(Q)tar cJf $(PACKAGE)-$(VERSION).tar.xz \
		$(PACKAGE)-$(VERSION)/build/binary.zsh \
		$(PACKAGE)-$(VERSION)/build/crystal.zsh \
		$(PACKAGE)-$(VERSION)/build/library.zsh \
		$(PACKAGE)-$(VERSION)/build/man.zsh \
		$(PACKAGE)-$(VERSION)/build/moon.zsh \
		$(PACKAGE)-$(VERSION)/build/ofile.zsh \
		$(PACKAGE)-$(VERSION)/build/script.zsh \
		$(PACKAGE)-$(VERSION)/build/shards.zsh \
		$(PACKAGE)-$(VERSION)/build/sharedlib.zsh \
		$(PACKAGE)-$(VERSION)/build/staticlib.zsh \
		$(PACKAGE)-$(VERSION)/build.zsh.in \
		$(PACKAGE)-$(VERSION)/project.zsh \
		$(PACKAGE)-$(VERSION)/Makefile

dist-bz2: $(PACKAGE)-$(VERSION).tar.bz2
$(PACKAGE)-$(VERSION).tar.bz2: distdir
	@echo '  TAR >   $(PACKAGE)-$(VERSION).tar.bz2'
	$(Q)tar cjf $(PACKAGE)-$(VERSION).tar.bz2 \
		$(PACKAGE)-$(VERSION)/build/binary.zsh \
		$(PACKAGE)-$(VERSION)/build/crystal.zsh \
		$(PACKAGE)-$(VERSION)/build/library.zsh \
		$(PACKAGE)-$(VERSION)/build/man.zsh \
		$(PACKAGE)-$(VERSION)/build/moon.zsh \
		$(PACKAGE)-$(VERSION)/build/ofile.zsh \
		$(PACKAGE)-$(VERSION)/build/script.zsh \
		$(PACKAGE)-$(VERSION)/build/shards.zsh \
		$(PACKAGE)-$(VERSION)/build/sharedlib.zsh \
		$(PACKAGE)-$(VERSION)/build/staticlib.zsh \
		$(PACKAGE)-$(VERSION)/build.zsh.in \
		$(PACKAGE)-$(VERSION)/project.zsh \
		$(PACKAGE)-$(VERSION)/Makefile

help:
	@echo ' :: build_zsh-0.2.1'
	@echo ''
	@echo 'Generic targets:'
	@echo '    - help           Prints this help message.'
	@echo '    - all            Builds all targets.'
	@echo '    - dist           Creates tarballs of the files of the project.'
	@echo '    - install        Installs the project.'
	@echo '    - clean          Removes compiled files.'
	@echo '    - uninstall      Deinstalls the project.'
	@echo ''
	@echo 'CLI-modifiable variables:'
	@echo '    - CC             ${CC}'
	@echo '    - CFLAGS         ${CFLAGS}'
	@echo '    - LDFLAGS        ${LDFLAGS}'
	@echo '    - DESTDIR        ${DESTDIR}'
	@echo '    - PREFIX         ${PREFIX}'
	@echo '    - BINDIR         ${BINDIR}'
	@echo '    - LIBDIR         ${LIBDIR}'
	@echo '    - SHAREDIR       ${SHAREDIR}'
	@echo '    - INCLUDEDIR     ${INCLUDEDIR}'
	@echo '    - MANDIR         ${MANDIR}'
	@echo ''
	@echo 'Project targets: '
	@echo '    - build.zsh      script'
	@echo '    - build/binary.zsh script'
	@echo '    - build/crystal.zsh script'
	@echo '    - build/library.zsh script'
	@echo '    - build/man.zsh  script'
	@echo '    - build/moon.zsh script'
	@echo '    - build/ofile.zsh script'
	@echo '    - build/script.zsh script'
	@echo '    - build/shards.zsh script'
	@echo '    - build/sharedlib.zsh script'
	@echo '    - build/staticlib.zsh script'
	@echo ''
	@echo 'Makefile options:'
	@echo '    - gnu:           false'
	@echo '    - colors:        false'
	@echo ''
	@echo 'Rebuild the Makefile with:'
	@echo '    zsh ./build.zsh'
.PHONY: all subdirs clean distclean dist install uninstall help

