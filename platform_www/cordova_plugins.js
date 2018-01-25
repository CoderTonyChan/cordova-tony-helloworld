cordova.define('cordova/plugin_list', function(require, exports, module) {
module.exports = [
  {
    "id": "cordova-plugin-iosrtc.Plugin",
    "file": "plugins/cordova-plugin-iosrtc/dist/cordova-plugin-iosrtc.js",
    "pluginId": "cordova-plugin-iosrtc",
    "clobbers": [
      "cordova.plugins.iosrtc"
    ]
  },
  {
    "id": "cordova-replay.CordovaReplay",
    "file": "plugins/cordova-replay/www/CordovaReplay.js",
    "pluginId": "cordova-replay",
    "clobbers": [
      "cordova.plugins.Replay"
    ]
  }
];
module.exports.metadata = 
// TOP OF METADATA
{
  "cordova-plugin-iosrtc": "4.0.2",
  "cordova-plugin-whitelist": "1.3.3",
  "cordova-replay": "0.0.4"
};
// BOTTOM OF METADATA
});