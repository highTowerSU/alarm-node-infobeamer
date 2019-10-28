gl.setup(NATIVE_WIDTH, NATIVE_HEIGHT)

local font = resource.load_font "Ubuntu-C.ttf"

local alarmtext = "Noch keine Einsatzinformationen!"


util.json_watch("config.json", function(config)
    alarmtext=config.text
end)

local function draw_info()
    local s = HEIGHT/10
    font:write(s, s*0.5, "Alarm"..alarmtext, s, 1,1,1,1)
end

function node.render()
    gl.clear(0,0,0,1)
    draw_info()
end
