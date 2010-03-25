# Set prefix to the path where you would like to install git-panic in
prefix=/usr/local

# Files that need mode 755
EXEC_FILES := git-panic

uname := $(shell sh -c 'uname -s 2>/dev/null || echo not')

INSTALL := install
ifeq ($(uname),AIX)
	INSTALL := ginstall
endif

all:
	@echo "usage: make install"
	@echo "       make uninstall"

install:
	$(INSTALL) -d -m 0755 $(prefix)/bin
	$(INSTALL) -m 0755 $(EXEC_FILES) $(prefix)/bin

uninstall:
	test -d $(prefix)/bin && \
	cd $(prefix)/bin && \
	rm -f $(EXEC_FILES) $(SCRIPT_FILES)
