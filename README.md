# Example on how to use JSON config values

Import this package into your info-beamer account.

[![Import](https://cdn.infobeamer.com/s/img/import.png)](https://info-beamer.com/use?url=https://github.com/highTowerSU/alarm-node-infobeamer.git)

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


