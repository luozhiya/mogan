-------------------------------------------------------------------------------
--
-- MODULE      : xmake.lua
-- DESCRIPTION : Xmake config file for TeXmacs
-- COPYRIGHT   : (C) 2022  jingkaimori
--                   2022  Darcy Shen
--
-- This software falls under the GNU general public license version 3 or later.
-- It comes WITHOUT ANY WARRANTY WHATSOEVER. For details, see the file LICENSE
-- in the root directory or <http://www.gnu.org/licenses/gpl-3.0.html>.

includes("check_ctypes.lua")
includes("check_cincludes.lua")
includes("check_cxxfuncs.lua")
includes("check_csnippets.lua")
-- add debug and release modes
add_rules("mode.debug", "mode.release")

set_project("TEXMACS")
add_requires("libpng")
add_requires("libiconv")
add_requires("zlib")
add_requires("libjpeg")
add_requires("libcurl")
add_requires("freetype")

target("mogan")
    local TEXMACS_VERSION = "2.1.3"
    local DEVEL_VERSION = TEXMACS_VERSION
    local DEVEL_RELEASE = 1
    local STABLE_VERSION = TEXMACS_VERSION
    local STABLE_RELEASE = 1
    set_version(TEXMACS_VERSION)
    
    set_languages("c++17")
    set_policy("check.auto_ignore_flags", false)
    add_rules("qt.static")
    add_frameworks("QtGui","QtWidgets","QtCore","QtPrintSupport","QtSvg")
    add_packages("freetype")
    add_packages("libcurl")
    add_packages("libjpeg")
    add_packages("libpng")

    ---------------------------------------------------------------------------
    -- generate config files. see also:
    --    * https://github.com/xmake-io/xmake/issues/320
    --    * https://github.com/xmake-io/xmake/issues/342
    ---------------------------------------------------------------------------
    set_configdir("src/System")
    -- check for dl library
    configvar_check_cxxfuncs("dlopen","TM_DYNAMIC_LINKING")
    configvar_check_ctypes("HAVE_INTPTR_T","intptr_t")
    configvar_check_cincludes("HAVE_INTTYPES_H","inttypes.h")
    configvar_check_cincludes("HAVE_PTY_H","pty.h")
    configvar_check_cincludes("HAVE_STDINT_H","stdint.h")
    configvar_check_cincludes("HAVE_SYS_STAT_H","sys/stat.h")
    configvar_check_cincludes("HAVE_SYS_TYPES_H","sys/types.h")
    configvar_check_ctypes("HAVE_TIME_T","time_t")
    configvar_check_cincludes("HAVE_UTIL_H","util.h")
    if is_plat("windows") then
        set_configvar("GS_EXE", "bin/gs.exe")
    else
        set_configvar("GS_EXE", "/usr/bin/gs")
    end
    if is_plat("windows") then
    else if is_plat("macosx") then
        set_configvar("USE_STACK_TRACE",true)
        set_configvar("NO_FAST_ALLOC",true)
    end
        set_configvar("USE_STACK_TRACE",true)
    end
    add_configfiles(
        "src/System/config.h.xmake", {
            filename = "config.h",
            variables = {
                GS_FONTS = "../share/ghostscript/fonts:/usr/share/fonts:",
                GS_LIB = "../share/ghostscript/9.06/lib:",
                OS_MACOS = is_plat("macosx"),
                OS_MINGW = is_plat("windows"),
                SIZEOF_VOID_P = 8,
                USE_JEAIII = true,
                }})
    if is_plat("linux") then 
        set_configvar("CONFIG_OS", "GNU_LINUX")
    elseif is_subhost("cygwin") then
        set_configvar("CONFIG_OS", "CYGWIN")
    else 
        set_configvar("CONFIG_OS", "")
    end
    check_csnippets(
        "CONFIG_LARGE_POINTER", [[
            #include <stdlib.h>
            static_assert(sizeof(void*) == 8, "");]])
    add_configfiles(
        "src/System/tm_configure.hpp.xmake", {
            filename = "tm_configure.hpp",
            pattern = "@(.-)@",
            variables = {
                XMACS_VERSION = "1.1.1-rc1",
                CONFIG_USER = os.getenv("USER") or "unknown",
                CONFIG_DATE = os.time(),
                CONFIG_STD_SETENV = "#define STD_SETENV",
                tm_devel = "Texmacs-" .. DEVEL_VERSION,
                tm_devel_release = "Texmacs-" .. DEVEL_VERSION .. "-" .. DEVEL_RELEASE,
                tm_stable = "Texmacs-" .. STABLE_VERSION,
                tm_stable_release = "Texmacs-" .. STABLE_VERSION .. "-" .. STABLE_RELEASE,
                }})
    add_defines("PDFHUMMUS_NO_TIFF")

    ---------------------------------------------------------------------------
    -- add source and header files
    ---------------------------------------------------------------------------
    add_includedirs("src/Data/Convert")
    add_includedirs("src/Data/Document")
    add_includedirs("src/Data/Drd")
    add_includedirs("src/Data/History")
    add_includedirs("src/Data/Observers")
    add_includedirs("src/Data/Parser")
    add_includedirs("src/Data/String")
    add_includedirs("src/Data/Tree")
    add_includedirs("src/Edit")
    add_includedirs("src/Edit/Editor")
    add_includedirs("src/Edit/Interface")
    add_includedirs("src/Edit/Modify")
    add_includedirs("src/Edit/Process")
    add_includedirs("src/Edit/Replace")
    add_includedirs("src/Graphics/Bitmap_fonts")
    add_includedirs("src/Graphics/Colors")
    add_includedirs("src/Graphics/Fonts")
    add_includedirs("src/Graphics/Gui")
    add_includedirs("src/Graphics/Handwriting")
    add_includedirs("src/Graphics/Mathematics")
    add_includedirs("src/Graphics/Pictures")
    add_includedirs("src/Graphics/Renderer")
    add_includedirs("src/Graphics/Spacial")
    add_includedirs("src/Graphics/Types")
    add_includedirs("src/Kernel/Abstractions")
    add_includedirs("src/Kernel/Containers")
    add_includedirs("src/Kernel/Types")
    add_includedirs("src/Plugins")
    add_includedirs("src/Plugins/Pdf")
    add_includedirs("src/Plugins/Pdf/PDFWriter")
    add_includedirs("src/Plugins/Pdf/LibAesgm")
    add_includedirs("src/Scheme")
    add_includedirs("src/Scheme/S7")
    add_includedirs("src/Scheme/Scheme")
    add_includedirs("src/Style/Environment")
    add_includedirs("src/Style/Evaluate")
    add_includedirs("src/Style/Memorizer")
    add_includedirs("src/System")
    add_includedirs("src/System/Boot")
    add_includedirs("src/System/Classes")
    add_includedirs("src/System/Files")
    add_includedirs("src/System/Language")
    add_includedirs("src/System/Link")
    add_includedirs("src/System/Misc")
    add_includedirs("src/Texmacs")
    add_includedirs("src/Texmacs/Data")
    add_includedirs("src/Typeset")
    add_includedirs("src/Typeset/Bridge")
    add_includedirs("src/Typeset/Concat")
    add_includedirs("src/Typeset/Page")
    add_includedirs("TeXmacs/include")

    add_files("src/Data/**.cpp")
    add_files("src/Edit/**.cpp")
    add_files("src/Graphics/**.cpp")
    add_files("src/Kernel/**.cpp")
    add_files("src/Scheme/Scheme/**.cpp")
    add_files("src/Scheme/S7/**.cpp")
    add_files("src/Scheme/S7/*.c")
    add_files("src/System/**.cpp")
    add_files("src/Texmacs/Data/**.cpp")
    add_files("src/Texmacs/Server/**.cpp")
    add_files("src/Texmacs/Window/**.cpp")
    add_files("src/Typeset/**.cpp")
    add_files("src/Plugins/Axel/**.cpp")
    add_files("src/Plugins/Bibtex/**.cpp")
    add_files("src/Plugins/Cairo/**.cpp")
    add_files("src/Plugins/Database/**.cpp")
    add_files("src/Plugins/Freetype/**.cpp")
    add_files("src/Plugins/Jeaiii/**.cpp")
    add_files("src/Plugins/Pdf/**.cpp")
    add_files("src/Plugins/Ghostscript/**.cpp")
    add_files("src/Plugins/Imlib2/**.cpp")
    add_files("src/Plugins/Ispell/**.cpp")
    add_files("src/Plugins/Metafont/**.cpp")
    add_files("src/Plugins/LaTeX_Preview/**.cpp")
    add_files("src/Plugins/Mplayer/**.cpp")
    add_files("src/Plugins/Openssl/**.cpp")
    add_files("src/Plugins/Sqlite3/**.cpp")
    add_files("src/Plugins/Updater/**.cpp")
    add_files("src/Plugins/Curl/**.cpp")
    if is_plat("windows") then
        add_files("src/Plugins/Windows/**.cpp")
    else
        add_files("src/Plugins/Unix/**.cpp")
    end
    add_files("src/Plugins/Qt/**.cpp")
