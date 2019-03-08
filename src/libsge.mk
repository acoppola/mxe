# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := libsge
$(PKG)_WEBSITE  := https://github.com/flibitijibibo/libSGE
$(PKG)_DESCR    := libSGE
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1085c49
$(PKG)_CHECKSUM := 04678a7c317e9a12c6fdc613136e21a8e97f837d6b8952a996aa62c25ce6da34
$(PKG)_GH_CONF  := flibitijibibo/libSGE/branches/master
$(PKG)_DEPS     := cc freetype sdl sdl_image


define $(PKG)_BUILD
    cd '$(1)'
    echo '$(PREFIX)/$(TARGET)'
    $(SED) -i 's,(shell sdl-config --prefix),$(PREFIX)/$(TARGET),gpw output' '$(1)/Makefile.conf'
    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 shared
    $(MAKE) -C '$(1)' -j 1 install
    cp $(1)/libSGE.a ~/mxe/usr/i686-w64-mingw32.static/lib/libSGE.a
	cp $(1)/sge*.h ~/mxe/usr/i686-w64-mingw32.static/include/SDL/
endef
