XDG_BIN_HOME ?= $(HOME)/.local/bin

INSTALL = install
LN_S = ln -s

SHOW_SCRIPT = show-apl-keyboard
SCRIPTS = $(SHOW_SCRIPT)

all:
	true

install:
	if [ ! -d $(XDG_BIN_HOME) ] && [ -d $(HOME)/bin ]; then \
	  bindir=$(HOME)/bin; \
	else \
	  bindir=$(XDG_BIN_HOME); \
        fi; \
	$(INSTALL) -D $(SCRIPTS) $$bindir; \
	$(LN_S) $(SHOW_SCRIPT) $$bindir/show-bqn-keyboard
	test -f "$(HOME)/.XCompose" || $(INSTALL) XCompose "$(HOME)/.XCompose"

check:
	shellcheck $(SCRIPTS)

.PSEUDO: all install check
