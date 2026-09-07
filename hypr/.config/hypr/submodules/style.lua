-----------------------
---- LOOK AND FEEL ----
-----------------------

---
-- pywal16
---

local pywal = require(os.getenv("HOME") .. "/.cache/wal/colors.lua")

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = {top = 5, left = 20, right = 20, bottom = 10},
        border_size = 2,

        col = {
            --active_border   = "rgba(ffffffff)", --"rgba(00ffffff)",
            active_border = pywal.color2,
            inactive_border = pywal.background,
            --inactive_border = "rgba(F0EAD9aa)", --"rgba(262522aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 15,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})
