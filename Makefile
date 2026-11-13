#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"), version 1.0.
# You may only use this file in accordance with the terms of version
# 1.0 of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source.  A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#

#
# Copyright 2026 Ignacio Soriano
#

# make install [DESTDIR=...] [PREFIX=/usr] [PYTHON=/usr/bin/python3]

PREFIX ?=	/usr
PYTHON ?=	/usr/bin/python3
DESTDIR ?=
APP_ID =	org.openindiana.MacSensors

BINDIR =	$(DESTDIR)$(PREFIX)/bin
APPDIR =	$(DESTDIR)$(PREFIX)/share/applications
ICONDIR =	$(DESTDIR)$(PREFIX)/share/icons/hicolor/scalable/apps
METADIR =	$(DESTDIR)$(PREFIX)/share/metainfo

all:

install:
	mkdir -p $(BINDIR) $(APPDIR) $(ICONDIR) $(METADIR)
	sed -e '1s|^#!.*|#!$(PYTHON)|' mac-sensors > $(BINDIR)/mac-sensors
	chmod 555 $(BINDIR)/mac-sensors
	cp data/$(APP_ID).desktop $(APPDIR)/
	cp data/$(APP_ID).svg $(ICONDIR)/
	cp data/$(APP_ID).metainfo.xml $(METADIR)/

check:
	$(PYTHON) -m py_compile mac-sensors
	rm -rf __pycache__

.PHONY: all install check
