# Example on how to use JSON config values

Import this package into your info-beamer account.

[![Import](https://cdn.infobeamer.com/s/img/import.png)](https://info-beamer.com/use?url=https://github.com/info-beamer/package-json-config.git)

This package shows how you might build a package that contains both user
controlled values as well as an automatically updated part that is
updated only using the API.

The top-level `node.json` file specifies a playlist as an example of
a user configurable option.

Inside the `automated` directory there's another `node.json` file. It
shows two fields of type `json` that can be changed only using the API.

Updating is easy:

```
curl -u:$API_KEY https://info-beamer.com/api/v1/setup/$SETUP_ID -d 'config={"automated":{"config_value1":{"foo":"bar"}}}&mode=update'
```

(Note: You shouldn't use raw curl for the API as the arguments to config
 should be urlencoded. Use a propery HTTP request library in your language
 of choice to do this correctly.)

By specifying the `mode=update` parameter, the above call only changes the
`config_value1` value in the `automated` subdirectory. The user made settings
in the top-level node remain unchanged. If you have multiple `json` types in your
`node.json`, like in this example, you can of course also modify them all
at once with a single HTTP call:

```
curl ... 'config={"automated":{"config_value1":{"foo":"bar"},"config_value2": 1234}}&mode=update'
```

Inside your `node.lua` code you can easily watch both the top-level
`config.json` as well as the `automated/config.json` file using the
[util.json_watch](https://info-beamer.com/doc/info-beamer#util.json_watch)
helper function. See the node.lua code in the package for details.

Using the `json` data type for all configuration options allows you to
place arbitrary values in the configuration itself and inside Lua you
can directly access them in the `util.json_watch` callback. No extra
parsing is required.
