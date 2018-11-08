gl.setup(NATIVE_WIDTH, NATIVE_HEIGHT)

node.make_nested() -- so we can access child directories

util.json_watch("config.json", function(config)
    print "new top level config"
    pp(config)
end)

util.json_watch("automated/config.json", function(config)
    print "new automated json config!"
    pp(config)
end)

function node.render()
end
