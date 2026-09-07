--
-- Playlist information
--

local mp = require "mp"
local function show_position()
    local pos = mp.get_property_number("playlist-pos-1", 0)
    local count = mp.get_property_number("playlist-count", 0)

    if count > 0 then
        mp.set_osd_ass(0, 0, string.format(
            "{\\an9\\fs12}%d/%d",
            pos,
            count
        ))
    end
end

mp.observe_property("playlist-count", "number", show_position)
mp.register_event("file-loaded", show_position)
