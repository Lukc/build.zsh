PACKAGE = 'build_zsh'
VERSION = '0.3.0'

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

all: build.zsh build/binary.zsh build/crystal.zsh build/header.zsh build/library.zsh build/man.zsh build/moon.zsh build/ofile.zsh build/scdocman.zsh build/script.zsh build/sharedlib.zsh build/staticlib.zsh
	@:

build.zsh: build.zsh.in 
	@echo '[01;32m  SED >   [01;37mbuild.zsh[00m'
	$(Q)sed -e 's&@PREFIX@&$(PREFIX)&;s&@BINDIR@&$(BINDIR)&;s&@LIBDIR@&$(LIBDIR)&;s&@SHAREDIR@&$(SHAREDIR)&;s&@INCLUDEDIR@&$(INCLUDEDIR)&;s&@MANDIR@&$(MANDIR)&;' build.zsh.in > 'build.zsh'
	$(Q)chmod +x 'build.zsh'


build.zsh.install: build.zsh
	@echo '[01;31m  IN >    [01;37m$(BINDIR)/build.zsh[00m'
	$(Q)mkdir -p '$(DESTDIR)$(BINDIR)'
	$(Q)install -m0755 build.zsh $(DESTDIR)$(BINDIR)/build.zsh

build.zsh.clean:
	@echo '[01;37m  RM >    [01;37mbuild.zsh[00m'
	$(Q)rm -f build.zsh

build.zsh.uninstall:
	@echo '[01;37m  RM >    [01;37m$(BINDIR)/build.zsh[00m'
	$(Q)rm -f '$(DESTDIR)$(BINDIR)/build.zsh'

build/binary.zsh:

build/binary.zsh.install: build/binary.zsh
	@echo '[01;31m  IN >    [01;37m$(SHAREDIR)/build.zsh/binary.zsh[00m'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/binary.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/binary.zsh

build/binary.zsh.clean:

build/binary.zsh.uninstall:
	@echo '[01;37m  RM >    [01;37m$(SHAREDIR)/build.zsh/binary.zsh[00m'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/binary.zsh'

build/crystal.zsh:

build/crystal.zsh.install: build/crystal.zsh
	@echo '[01;31m  IN >    [01;37m$(SHAREDIR)/build.zsh/crystal.zsh[00m'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/crystal.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/crystal.zsh

build/crystal.zsh.clean:

build/crystal.zsh.uninstall:
	@echo '[01;37m  RM >    [01;37m$(SHAREDIR)/build.zsh/crystal.zsh[00m'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/crystal.zsh'

build/header.zsh:

build/header.zsh.install: build/header.zsh
	@echo '[01;31m  IN >    [01;37m$(SHAREDIR)/build.zsh/header.zsh[00m'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/header.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/header.zsh

build/header.zsh.clean:

build/header.zsh.uninstall:
	@echo '[01;37m  RM >    [01;37m$(SHAREDIR)/build.zsh/header.zsh[00m'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/header.zsh'

build/library.zsh:

build/library.zsh.install: build/library.zsh
	@echo '[01;31m  IN >    [01;37m$(SHAREDIR)/build.zsh/library.zsh[00m'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/library.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/library.zsh

build/library.zsh.clean:

build/library.zsh.uninstall:
	@echo '[01;37m  RM >    [01;37m$(SHAREDIR)/build.zsh/library.zsh[00m'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/library.zsh'

build/man.zsh:

build/man.zsh.install: build/man.zsh
	@echo '[01;31m  IN >    [01;37m$(SHAREDIR)/build.zsh/man.zsh[00m'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/man.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/man.zsh

build/man.zsh.clean:

build/man.zsh.uninstall:
	@echo '[01;37m  RM >    [01;37m$(SHAREDIR)/build.zsh/man.zsh[00m'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/man.zsh'

build/moon.zsh:

build/moon.zsh.install: build/moon.zsh
	@echo '[01;31m  IN >    [01;37m$(SHAREDIR)/build.zsh/moon.zsh[00m'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/moon.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/moon.zsh

build/moon.zsh.clean:

build/moon.zsh.uninstall:
	@echo '[01;37m  RM >    [01;37m$(SHAREDIR)/build.zsh/moon.zsh[00m'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/moon.zsh'

build/ofile.zsh:

build/ofile.zsh.install: build/ofile.zsh
	@echo '[01;31m  IN >    [01;37m$(SHAREDIR)/build.zsh/ofile.zsh[00m'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/ofile.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/ofile.zsh

build/ofile.zsh.clean:

build/ofile.zsh.uninstall:
	@echo '[01;37m  RM >    [01;37m$(SHAREDIR)/build.zsh/ofile.zsh[00m'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/ofile.zsh'

build/scdocman.zsh:

build/scdocman.zsh.install: build/scdocman.zsh
	@echo '[01;31m  IN >    [01;37m$(SHAREDIR)/build.zsh/scdocman.zsh[00m'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/scdocman.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/scdocman.zsh

build/scdocman.zsh.clean:

build/scdocman.zsh.uninstall:
	@echo '[01;37m  RM >    [01;37m$(SHAREDIR)/build.zsh/scdocman.zsh[00m'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/scdocman.zsh'

build/script.zsh:

build/script.zsh.install: build/script.zsh
	@echo '[01;31m  IN >    [01;37m$(SHAREDIR)/build.zsh/script.zsh[00m'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/script.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/script.zsh

build/script.zsh.clean:

build/script.zsh.uninstall:
	@echo '[01;37m  RM >    [01;37m$(SHAREDIR)/build.zsh/script.zsh[00m'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/script.zsh'

build/sharedlib.zsh:

build/sharedlib.zsh.install: build/sharedlib.zsh
	@echo '[01;31m  IN >    [01;37m$(SHAREDIR)/build.zsh/sharedlib.zsh[00m'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/sharedlib.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/sharedlib.zsh

build/sharedlib.zsh.clean:

build/sharedlib.zsh.uninstall:
	@echo '[01;37m  RM >    [01;37m$(SHAREDIR)/build.zsh/sharedlib.zsh[00m'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/sharedlib.zsh'

build/staticlib.zsh:

build/staticlib.zsh.install: build/staticlib.zsh
	@echo '[01;31m  IN >    [01;37m$(SHAREDIR)/build.zsh/staticlib.zsh[00m'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/staticlib.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/staticlib.zsh

build/staticlib.zsh.clean:

build/staticlib.zsh.uninstall:
	@echo '[01;37m  RM >    [01;37m$(SHAREDIR)/build.zsh/staticlib.zsh[00m'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/staticlib.zsh'

build:
	$(Q)mkdir -p build
$(DESTDIR)$(PREFIX):
	@echo '[01;35m  DIR >   [01;37m$(PREFIX)[00m'
	$(Q)mkdir -p $(DESTDIR)$(PREFIX)
$(DESTDIR)$(BINDIR):
	@echo '[01;35m  DIR >   [01;37m$(BINDIR)[00m'
	$(Q)mkdir -p $(DESTDIR)$(BINDIR)
$(DESTDIR)$(LIBDIR):
	@echo '[01;35m  DIR >   [01;37m$(LIBDIR)[00m'
	$(Q)mkdir -p $(DESTDIR)$(LIBDIR)
$(DESTDIR)$(SHAREDIR):
	@echo '[01;35m  DIR >   [01;37m$(SHAREDIR)[00m'
	$(Q)mkdir -p $(DESTDIR)$(SHAREDIR)
$(DESTDIR)$(INCLUDEDIR):
	@echo '[01;35m  DIR >   [01;37m$(INCLUDEDIR)[00m'
	$(Q)mkdir -p $(DESTDIR)$(INCLUDEDIR)
$(DESTDIR)$(MANDIR):
	@echo '[01;35m  DIR >   [01;37m$(MANDIR)[00m'
	$(Q)mkdir -p $(DESTDIR)$(MANDIR)
install: subdirs.install build.zsh.install build/binary.zsh.install build/crystal.zsh.install build/header.zsh.install build/library.zsh.install build/man.zsh.install build/moon.zsh.install build/ofile.zsh.install build/scdocman.zsh.install build/script.zsh.install build/sharedlib.zsh.install build/staticlib.zsh.install
	@:

subdirs.install:

uninstall: subdirs.uninstall build.zsh.uninstall build/binary.zsh.uninstall build/crystal.zsh.uninstall build/header.zsh.uninstall build/library.zsh.uninstall build/man.zsh.uninstall build/moon.zsh.uninstall build/ofile.zsh.uninstall build/scdocman.zsh.uninstall build/script.zsh.uninstall build/sharedlib.zsh.uninstall build/staticlib.zsh.uninstall
	@:

subdirs.uninstall:

test: all subdirs subdirs.test
	@:

subdirs.test:

clean: build.zsh.clean build/binary.zsh.clean build/crystal.zsh.clean build/header.zsh.clean build/library.zsh.clean build/man.zsh.clean build/moon.zsh.clean build/ofile.zsh.clean build/scdocman.zsh.clean build/script.zsh.clean build/sharedlib.zsh.clean build/staticlib.zsh.clean

distclean: clean

dist: dist-gz dist-xz dist-bz2
	$(Q)rm -- $(PACKAGE)-$(VERSION)

distdir:
	$(Q)rm -rf -- $(PACKAGE)-$(VERSION)
	$(Q)ln -s -- . $(PACKAGE)-$(VERSION)

dist-gz: $(PACKAGE)-$(VERSION).tar.gz
$(PACKAGE)-$(VERSION).tar.gz: distdir
	@echo '[01;33m  TAR >   [01;37m$(PACKAGE)-$(VERSION).tar.gz[00m'
	$(Q)tar czf $(PACKAGE)-$(VERSION).tar.gz \
		$(PACKAGE)-$(VERSION)/build/binary.zsh \
		$(PACKAGE)-$(VERSION)/build/crystal.zsh \
		$(PACKAGE)-$(VERSION)/build/header.zsh \
		$(PACKAGE)-$(VERSION)/build/library.zsh \
		$(PACKAGE)-$(VERSION)/build/man.zsh \
		$(PACKAGE)-$(VERSION)/build/moon.zsh \
		$(PACKAGE)-$(VERSION)/build/ofile.zsh \
		$(PACKAGE)-$(VERSION)/build/scdocman.zsh \
		$(PACKAGE)-$(VERSION)/build/script.zsh \
		$(PACKAGE)-$(VERSION)/build/sharedlib.zsh \
		$(PACKAGE)-$(VERSION)/build/staticlib.zsh \
		$(PACKAGE)-$(VERSION)/build.zsh.in \
		$(PACKAGE)-$(VERSION)/project.zsh \
		$(PACKAGE)-$(VERSION)/Makefile

dist-xz: $(PACKAGE)-$(VERSION).tar.xz
$(PACKAGE)-$(VERSION).tar.xz: distdir
	@echo '[01;33m  TAR >   [01;37m$(PACKAGE)-$(VERSION).tar.xz[00m'
	$(Q)tar cJf $(PACKAGE)-$(VERSION).tar.xz \
		$(PACKAGE)-$(VERSION)/build/binary.zsh \
		$(PACKAGE)-$(VERSION)/build/crystal.zsh \
		$(PACKAGE)-$(VERSION)/build/header.zsh \
		$(PACKAGE)-$(VERSION)/build/library.zsh \
		$(PACKAGE)-$(VERSION)/build/man.zsh \
		$(PACKAGE)-$(VERSION)/build/moon.zsh \
		$(PACKAGE)-$(VERSION)/build/ofile.zsh \
		$(PACKAGE)-$(VERSION)/build/scdocman.zsh \
		$(PACKAGE)-$(VERSION)/build/script.zsh \
		$(PACKAGE)-$(VERSION)/build/sharedlib.zsh \
		$(PACKAGE)-$(VERSION)/build/staticlib.zsh \
		$(PACKAGE)-$(VERSION)/build.zsh.in \
		$(PACKAGE)-$(VERSION)/project.zsh \
		$(PACKAGE)-$(VERSION)/Makefile

dist-bz2: $(PACKAGE)-$(VERSION).tar.bz2
$(PACKAGE)-$(VERSION).tar.bz2: distdir
	@echo '[01;33m  TAR >   [01;37m$(PACKAGE)-$(VERSION).tar.bz2[00m'
	$(Q)tar cjf $(PACKAGE)-$(VERSION).tar.bz2 \
		$(PACKAGE)-$(VERSION)/build/binary.zsh \
		$(PACKAGE)-$(VERSION)/build/crystal.zsh \
		$(PACKAGE)-$(VERSION)/build/header.zsh \
		$(PACKAGE)-$(VERSION)/build/library.zsh \
		$(PACKAGE)-$(VERSION)/build/man.zsh \
		$(PACKAGE)-$(VERSION)/build/moon.zsh \
		$(PACKAGE)-$(VERSION)/build/ofile.zsh \
		$(PACKAGE)-$(VERSION)/build/scdocman.zsh \
		$(PACKAGE)-$(VERSION)/build/script.zsh \
		$(PACKAGE)-$(VERSION)/build/sharedlib.zsh \
		$(PACKAGE)-$(VERSION)/build/staticlib.zsh \
		$(PACKAGE)-$(VERSION)/build.zsh.in \
		$(PACKAGE)-$(VERSION)/project.zsh \
		$(PACKAGE)-$(VERSION)/Makefile

help:
	@echo '[01;37m :: build_zsh-0.3.0[00m'
	@echo ''
	@echo '[01;37mGeneric targets:[00m'
	@echo '[00m    - [01;32mhelp          [37m Prints this help message.[00m'
	@echo '[00m    - [01;32mall           [37m Builds all targets.[00m'
	@echo '[00m    - [01;32mdist          [37m Creates tarballs of the files of the project.[00m'
	@echo '[00m    - [01;32minstall       [37m Installs the project.[00m'
	@echo '[00m    - [01;32mclean         [37m Removes compiled files.[00m'
	@echo '[00m    - [01;32muninstall     [37m Deinstalls the project.[00m'
	@echo ''
	@echo '[01;37mCLI-modifiable variables:[00m'
	@echo '    - [01;34mCC            [37m ${CC}[00m'
	@echo '    - [01;34mCFLAGS        [37m ${CFLAGS}[00m'
	@echo '    - [01;34mLDFLAGS       [37m ${LDFLAGS}[00m'
	@echo '    - [01;34mDESTDIR       [37m ${DESTDIR}[00m'
	@echo '    - [01;34mPREFIX        [37m ${PREFIX}[00m'
	@echo '    - [01;34mBINDIR        [37m ${BINDIR}[00m'
	@echo '    - [01;34mLIBDIR        [37m ${LIBDIR}[00m'
	@echo '    - [01;34mSHAREDIR      [37m ${SHAREDIR}[00m'
	@echo '    - [01;34mINCLUDEDIR    [37m ${INCLUDEDIR}[00m'
	@echo '    - [01;34mMANDIR        [37m ${MANDIR}[00m'
	@echo ''
	@echo '[01;37mProject targets: [00m'
	@echo '    - [01;33mbuild.zsh     [37m script[00m'
	@echo '    - [01;33mbuild/binary.zsh[37m script[00m'
	@echo '    - [01;33mbuild/crystal.zsh[37m script[00m'
	@echo '    - [01;33mbuild/header.zsh[37m script[00m'
	@echo '    - [01;33mbuild/library.zsh[37m script[00m'
	@echo '    - [01;33mbuild/man.zsh [37m script[00m'
	@echo '    - [01;33mbuild/moon.zsh[37m script[00m'
	@echo '    - [01;33mbuild/ofile.zsh[37m script[00m'
	@echo '    - [01;33mbuild/scdocman.zsh[37m script[00m'
	@echo '    - [01;33mbuild/script.zsh[37m script[00m'
	@echo '    - [01;33mbuild/sharedlib.zsh[37m script[00m'
	@echo '    - [01;33mbuild/staticlib.zsh[37m script[00m'
	@echo ''
	@echo '[01;37mMakefile options:[00m'
	@echo '    - gnu:           false'
	@echo '    - colors:        true'
	@echo ''
	@echo '[01;37mRebuild the Makefile with:[00m'
	@echo '    zsh ./build.zsh -c'
.PHONY: all subdirs clean distclean dist install uninstall help

