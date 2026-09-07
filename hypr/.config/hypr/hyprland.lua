
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- HYPRLAND CONFIG                                       --
-- @veldogar                                             --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- This is the best config in the world.
-- Not.

-- Out of dwm config perfection hell
-- Keeping it very (!) simple & functional
-- little bit eye candy is allowed

---------------------
----   GLOBALS   ----
---------------------

terminal    = "kitty"
fileManager = "dolphin"
menu        = "rofi -show drun -show-icons -theme /home/thomas/.config/rofi/themes/run.rasi"

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "2560x1440@60",
    position = "0x0",
    scale    = "auto",
})

hl.monitor({
    output   = "DP-3",
    mode     = "2560x1440@60",
    position = "2560x0",
    scale    = "auto",
    disabled = true,
})

-------------------
---- AUTOSTART ----
-------------------

require ("submodules/autostart")

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

require("submodules/env")

-----------------------
---- LOOK AND FEEL ----
-----------------------

require("submodules/style")
require("submodules/animations")
require("submodules/layout")

---------------
---- INPUT ----
---------------

require("submodules/input")

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

require("submodules/rules")

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = false,
        --disable_splash_rendering = true,
    },
})

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")
