# Makefile for tramp code

# This file is part of XEmacs.

# XEmacs is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 2, or (at your option) any
# later version.

# XEmacs is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# for more details.

# You should have received a copy of the GNU General Public License
# along with XEmacs; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
# Boston, MA 02111-1307, USA.

VERSION = 1.00
AUTHOR_VERSION = 2.46
MAINTAINER = XEmacs Development Team <xemacs-beta@xemacs.org>
PACKAGE = tramp
PKG_TYPE = regular
REQUIRES = tramp xemacs-base vc fsf-compat efs dired mail-lib gnus
CATEGORY = standard

ELCS = lisp/tramp-util.elc lisp/tramp.elc lisp/tramp-vc.elc \
	lisp/trampcache.elc

INFO_FILES = texi/$(PACKAGE).info
TEXI_FILES = texi/$(PACKAGE).texi

# ifneq ('$(BUILD_WITHOUT_MULE)','t')
# INFO_FILES += texi/$(PACKAGE)_ja.info
# TEXI_FILES += texi/$(PACKAGE)_ja.texi
# endif

MANUAL = $(PACKAGE)

AUTOLOAD_PATH = lisp

include ../../XEmacs.rules

GENERATED += $(AUTOLOAD_PATH)/custom-load.elc


all::  $(AUTOLOAD_PATH)/auto-autoloads.elc $(ELCS) \
	$(AUTOLOAD_PATH)/custom-load.elc texinfo

.texi.info:
	makeinfo -o $@ $<

texinfo: $(INFO_FILES)

srckit: srckit-std

binkit: binkit-common


