--
-- Stream videos from my workstation to my laptop
-- My laptop doesn't have h265 hardware decoding & a weak cpu
-- My workstation transcodes the video into h264 and streams to my laptop
-- This way I still can enjoy my vids on my TV yay
--
-- Expects a playlist file with remote filenames/paths
--

local mp = require "mp"
local options = require "mp.options"


local opts = {
    enabled = false
}

options.read_options(opts, "remote")


-- local vids should play too
if not opts.enabled then
    return
end


-- maybe not a good idea to hardcode the pipe in
local fifo = os.getenv("HOME") .. "/mpvstream"
local ffmpeg_pid = nil


function kill_ffmpeg()
    if ffmpeg_pid then
        os.execute("kill " .. ffmpeg_pid)
        ffmpeg_pid = nil
    end
end


function start_ffmpeg(path)

    kill_ffmpeg()

    mp.msg.info("Streaming remote: " .. path)

    local cmd = string.format(
        [[ssh -T main "ffmpeg -loglevel error -nostdin -fflags +genpts -i '%s' -c:v libx264 -pix_fmt yuv420p -preset ultrafast -tune zerolatency -vf \"scale='min(1920,iw)':'min(1080,ih)':force_original_aspect_ratio=decrease,fps=30\" -c:a aac -f nut -" > "%s"]],
        path,
        fifo
    )

    local result = mp.command_native({
        name = "subprocess",
        args = {
            "bash",
            "-c",
            cmd
        },
        playback_only = false,
        detach = true
    })

    ffmpeg_pid = result.pid
end


mp.add_hook("on_load", 5, function()

    local path = mp.get_property("path")
    local format = mp.get_property("file-format")

    -- ignore the playlist & pipe
    if format == "playlist" or path == fifo then
        return
    end

    start_ffmpeg(path)

    -- pipe into mpv
    mp.set_property("stream-open-filename", fifo)

end)


mp.register_event("end-file", function()
    kill_ffmpeg()
end)
