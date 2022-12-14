modem = peripheral.find("modem")
modem.open(1)

speaker = peripheral.find("speaker")

function split(str)
    local t = {}
    for str in string.gmatch(str, "([^/]+)") do
        table.insert(t, str)
    end
    return t
end

while true do
 local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
 local vars = split(message)
 speaker.playNote(vars[1], tonumber(vars[2]), tonumber(vars[3]))
end
