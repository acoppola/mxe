# This file is part of MXE. See LICENSE.md for licensing information.

message("== Custom MXE File: " ${CMAKE_CURRENT_LIST_FILE})

if(NOT PKG_CONFIG_FOUND)
  find_package(PkgConfig REQUIRED)
endif()

pkg_check_modules(SDL_GFX SDL_gfx)

#compatibility
set(SDL_GFX_VERSION_STRING ${SDL_GFX_VERSION})

# for backward compatibility
set(SDLGFX_LIBRARY ${SDL_GFX_LIBRARIES})
set(SDLGFX_INCLUDE_DIR ${SDL_GFX_INCLUDE_DIRS})
set(SDLGFX_FOUND ${SDL_GFX_FOUND})
