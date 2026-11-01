local speaker = peripheral.find("speaker")
local dfpwm = require("cc.audio.dfpwm")

local decoder = dfpwm.make_decoder()
local file = fs.open("sfx.dfpwm", "r")

if not file then
    error("Hittade inte sfx.dfpwm")
end

while true do
    local chunk = file.read(16 * 1024) -- Läs 16KB i taget
    if not chunk then break end

    local buffer = decoder(chunk)
    
    -- Vänta tills högtalaren kan ta emot mer ljud
    while not speaker.playAudio(buffer) do
        os.pullEvent("speaker_audio_empty")
    end
end

file.close()
