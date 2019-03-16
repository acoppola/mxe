# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := libsge
$(PKG)_WEBSITE  := https://github.com/flibitijibibo/libSGE
$(PKG)_DESCR    := libSGE
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1085c49
$(PKG)_CHECKSUM := 04678a7c317e9a12c6fdc613136e21a8e97f837d6b8952a996aa62c25ce6da34
$(PKG)_GH_CONF  := flibitijibibo/libSGE/branches/master
$(PKG)_DEPS     := cc sdl sdl_image freetype


define $(PKG)_BUILD
    cd '$(1)'
    $(SED) -i "s,USE_IMG = n,USE_IMG = y,g" '$(1)/Makefile.conf'
    $(SED) -i "s,ifdef __WIN32__,if 0,g" '$(1)/sge_surface.cpp'
    $(SED) -i "s,ifdef __WIN32__,if 0,g" '$(1)/sge_textpp.cpp'
    $(SED) -i "s,ifdef __WIN32__,if 0,g" '$(1)/sge_tt_text.cpp'
    $(SED) -i "s,ifdef __WIN32__,if 0,g" '$(1)/sge_bm_text.cpp'
    $(SED) -i 's,dlltool,i686-w64-mingw32-dlltool,gp' '$(1)/Makefile'
    $(SED) -i 's,dllwrap,i686-w64-mingw32-dllwrap,gp' '$(1)/Makefile'
    $(MAKE) CXX=$(TARGET)-g++ CC=$(TARGET)-gcc PREFIX=$(PREFIX)/$(TARGET) PREFIX_H=$(PREFIX)/$(TARGET)/include/SDL SGE_LIBS='$(PREFIX)/$(TARGET)/lib -lstdc++' HAVE_IMG=y -C '$(1)' -j 1 config
    $(MAKE) CXX=$(TARGET)-g++ CC=$(TARGET)-gcc PREFIX=$(PREFIX)/$(TARGET) PREFIX_H=$(PREFIX)/$(TARGET)/include/SDL SGE_LIBS='$(PREFIX)/$(TARGET)/lib -lstdc++' HAVE_IMG=y -C '$(1)' -j 1
    cp $(1)/libSGE.a $(PREFIX)/$(TARGET)/lib/libSGE.a
    cp $(1)/sge*.h $(PREFIX)/$(TARGET)/include/SDL
endef
