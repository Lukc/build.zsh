PACKAGE = 'build_zsh'
VERSION = '0.2.1'

PREFIX := /usr/local
BINDIR := $(PREFIX)/bin
LIBDIR := $(PREFIX)/lib
SHAREDIR := $(PREFIX)/share
INCLUDEDIR := $(PREFIX)/include

CC := cc
AR := ar
RANLIB := ranlib
CFLAGS := 
LDFLAGS := 

Q := @

all: build.zsh build/binary.zsh build/library.zsh build/ofile.zsh build/script.zsh build/sharedlib.zsh build/staticlib.zsh

build.zsh:

build.zsh.install: build.zsh
	@echo '[01;31m  [IN]    [01;37m$(BINDIR)/build.zsh[00m'
	$(Q)mkdir -p '$(DESTDIR)$(BINDIR)'
	$(Q)install -m0755 build.zsh $(DESTDIR)$(BINDIR)/build.zsh

build.zsh.clean:

build.zsh.uninstall:
	@echo '[01;37m  [RM]    [01;37m$(BINDIR)/build.zsh[00m'
	$(Q)rm -f '$(DESTDIR)$(BINDIR)/build.zsh'

build/binary.zsh:

build/binary.zsh.install: build/binary.zsh
	@echo '[01;31m  [IN]    [01;37m$(SHAREDIR)/build.zsh/binary.zsh[00m'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/binary.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/binary.zsh

build/binary.zsh.clean:

build/binary.zsh.uninstall:
	@echo '[01;37m  [RM]    [01;37m$(SHAREDIR)/build.zsh/binary.zsh[00m'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/binary.zsh'

build/library.zsh:

build/library.zsh.install: build/library.zsh
	@echo '[01;31m  [IN]    [01;37m$(SHAREDIR)/build.zsh/library.zsh[00m'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/library.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/library.zsh

build/library.zsh.clean:

build/library.zsh.uninstall:
	@echo '[01;37m  [RM]    [01;37m$(SHAREDIR)/build.zsh/library.zsh[00m'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/library.zsh'

build/ofile.zsh:

build/ofile.zsh.install: build/ofile.zsh
	@echo '[01;31m  [IN]    [01;37m$(SHAREDIR)/build.zsh/ofile.zsh[00m'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/ofile.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/ofile.zsh

build/ofile.zsh.clean:

build/ofile.zsh.uninstall:
	@echo '[01;37m  [RM]    [01;37m$(SHAREDIR)/build.zsh/ofile.zsh[00m'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/ofile.zsh'

build/script.zsh:

build/script.zsh.install: build/script.zsh
	@echo '[01;31m  [IN]    [01;37m$(SHAREDIR)/build.zsh/script.zsh[00m'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/script.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/script.zsh

build/script.zsh.clean:

build/script.zsh.uninstall:
	@echo '[01;37m  [RM]    [01;37m$(SHAREDIR)/build.zsh/script.zsh[00m'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/script.zsh'

build/sharedlib.zsh:

build/sharedlib.zsh.install: build/sharedlib.zsh
	@echo '[01;31m  [IN]    [01;37m$(SHAREDIR)/build.zsh/sharedlib.zsh[00m'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/sharedlib.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/sharedlib.zsh

build/sharedlib.zsh.clean:

build/sharedlib.zsh.uninstall:
	@echo '[01;37m  [RM]    [01;37m$(SHAREDIR)/build.zsh/sharedlib.zsh[00m'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/sharedlib.zsh'

build/staticlib.zsh:

build/staticlib.zsh.install: build/staticlib.zsh
	@echo '[01;31m  [IN]    [01;37m$(SHAREDIR)/build.zsh/staticlib.zsh[00m'
	$(Q)mkdir -p '$(DESTDIR)$(SHAREDIR)/build.zsh'
	$(Q)install -m0755 build/staticlib.zsh $(DESTDIR)$(SHAREDIR)/build.zsh/staticlib.zsh

build/staticlib.zsh.clean:

build/staticlib.zsh.uninstall:
	@echo '[01;37m  [RM]    [01;37m$(SHAREDIR)/build.zsh/staticlib.zsh[00m'
	$(Q)rm -f '$(DESTDIR)$(SHAREDIR)/build.zsh/staticlib.zsh'

$(DESTDIR)$(PREFIX):
	@echo '[01;35m  [DIR]   [01;37m$(PREFIX)[00m'
	$(Q)mkdir -p $(DESTDIR)$(PREFIX)
$(DESTDIR)$(BINDIR):
	@echo '[01;35m  [DIR]   [01;37m$(BINDIR)[00m'
	$(Q)mkdir -p $(DESTDIR)$(BINDIR)
$(DESTDIR)$(LIBDIR):
	@echo '[01;35m  [DIR]   [01;37m$(LIBDIR)[00m'
	$(Q)mkdir -p $(DESTDIR)$(LIBDIR)
$(DESTDIR)$(SHAREDIR):
	@echo '[01;35m  [DIR]   [01;37m$(SHAREDIR)[00m'
	$(Q)mkdir -p $(DESTDIR)$(SHAREDIR)
$(DESTDIR)$(INCLUDEDIR):
	@echo '[01;35m  [DIR]   [01;37m$(INCLUDEDIR)[00m'
	$(Q)mkdir -p $(DESTDIR)$(INCLUDEDIR)
install: subdirs.install build.zsh.install build/binary.zsh.install build/library.zsh.install build/ofile.zsh.install build/script.zsh.install build/sharedlib.zsh.install build/staticlib.zsh.install
	@:

subdirs.install:

uninstall: subdirs.uninstall build.zsh.uninstall build/binary.zsh.uninstall build/library.zsh.uninstall build/ofile.zsh.uninstall build/script.zsh.uninstall build/sharedlib.zsh.uninstall build/staticlib.zsh.uninstall
	@:

subdirs.uninstall:

test: all subdirs subdirs.test
	@:

subdirs.test:

clean: build.zsh.clean build/binary.zsh.clean build/library.zsh.clean build/ofile.zsh.clean build/script.zsh.clean build/sharedlib.zsh.clean build/staticlib.zsh.clean

distclean: clean

dist: dist-gz dist-xz dist-bz2
	$(Q)rm -- $(PACKAGE)-$(VERSION)

distdir:
	$(Q)rm -rf -- $(PACKAGE)-$(VERSION)
	$(Q)ln -s -- . $(PACKAGE)-$(VERSION)

dist-gz: $(PACKAGE)-$(VERSION).tar.gz
$(PACKAGE)-$(VERSION).tar.gz: distdir
	@echo '[01;33m  [TAR]   [01;37m$(PACKAGE)-$(VERSION).tar.gz[00m'
	$(Q)tar czf $(PACKAGE)-$(VERSION).tar.gz \
		$(PACKAGE)-$(VERSION)/build/binary.zsh \
		$(PACKAGE)-$(VERSION)/build/library.zsh \
		$(PACKAGE)-$(VERSION)/build/ofile.zsh \
		$(PACKAGE)-$(VERSION)/build/script.zsh \
		$(PACKAGE)-$(VERSION)/build/sharedlib.zsh \
		$(PACKAGE)-$(VERSION)/build/staticlib.zsh \
		$(PACKAGE)-$(VERSION)/project.zsh \
		$(PACKAGE)-$(VERSION)/Makefile

dist-xz: $(PACKAGE)-$(VERSION).tar.xz
$(PACKAGE)-$(VERSION).tar.xz: distdir
	@echo '[01;33m  [TAR]   [01;37m$(PACKAGE)-$(VERSION).tar.xz[00m'
	$(Q)tar cJf $(PACKAGE)-$(VERSION).tar.xz \
		$(PACKAGE)-$(VERSION)/build/binary.zsh \
		$(PACKAGE)-$(VERSION)/build/library.zsh \
		$(PACKAGE)-$(VERSION)/build/ofile.zsh \
		$(PACKAGE)-$(VERSION)/build/script.zsh \
		$(PACKAGE)-$(VERSION)/build/sharedlib.zsh \
		$(PACKAGE)-$(VERSION)/build/staticlib.zsh \
		$(PACKAGE)-$(VERSION)/project.zsh \
		$(PACKAGE)-$(VERSION)/Makefile

dist-bz2: $(PACKAGE)-$(VERSION).tar.bz2
$(PACKAGE)-$(VERSION).tar.bz2: distdir
	@echo '[01;33m  [TAR]   [01;37m$(PACKAGE)-$(VERSION).tar.bz2[00m'
	$(Q)tar cjf $(PACKAGE)-$(VERSION).tar.bz2 \
		$(PACKAGE)-$(VERSION)/build/binary.zsh \
		$(PACKAGE)-$(VERSION)/build/library.zsh \
		$(PACKAGE)-$(VERSION)/build/ofile.zsh \
		$(PACKAGE)-$(VERSION)/build/script.zsh \
		$(PACKAGE)-$(VERSION)/build/sharedlib.zsh \
		$(PACKAGE)-$(VERSION)/build/staticlib.zsh \
		$(PACKAGE)-$(VERSION)/project.zsh \
		$(PACKAGE)-$(VERSION)/Makefile

help:
	@echo '[01;37m :: build_zsh-0.2.1[00m'
	@echo ''
	@echo '[01;37mGeneric targets:[00m'
	@echo '[00m    - [01;32mhelp          [37mPrints this help message.[00m'
	@echo '[00m    - [01;32mall           [37mBuilds all targets.[00m'
	@echo '[00m    - [01;32mdist          [37mCreates tarballs of the files of the project.[00m'
	@echo '[00m    - [01;32minstall       [37mInstalls the project.[00m'
	@echo '[00m    - [01;32mclean         [37mRemoves compiled files.[00m'
	@echo '[00m    - [01;32muninstall     [37mDeinstalls the project.[00m'
	@echo ''
	@echo '[01;37mCLI-modifiable variables:[00m'
	@echo '    - [01;34mCC            [37m${CC}[00m'
	@echo '    - [01;34mCFLAGS        [37m${CFLAGS}[00m'
	@echo '    - [01;34mLDFLAGS       [37m${LDFLAGS}[00m'
	@echo '    - [01;34mDESTDIR       [37m${DESTDIR}[00m'
	@echo '    - [01;34mPREFIX        [37m${PREFIX}[00m'
	@echo '    - [01;34mBINDIR        [37m${BINDIR}[00m'
	@echo '    - [01;34mLIBDIR        [37m${LIBDIR}[00m'
	@echo '    - [01;34mSHAREDIR      [37m${SHAREDIR}[00m'
	@echo '    - [01;34mINCLUDEDIR    [37m${INCLUDEDIR}[00m'
	@echo ''
	@echo '[01;37mProject targets: [00m'
	@echo '    - [01;33mbuild.zsh     [37mscript[00m'
	@echo ''
	@echo '[01;37mMakefile options:[00m'
	@echo '    - gnu:          true'
	@echo '    - colors:       true'
	@echo ''
	@echo '[01;37mRebuild the Makefile with:[00m'
	@echo '    zsh ./build.zsh -c -g'
.PHONY: all subdirs clean distclean dist install uninstall help

