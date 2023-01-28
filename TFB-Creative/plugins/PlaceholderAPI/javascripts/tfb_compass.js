var lang = "";
var type = "";
function tfbCompass() {
    if (args.length == 2) {
        type = args[0];
        lang = args[1];
    }

    if (type == "name") {
        switch (lang) {
            case "da":
                return "#ee2b23T#3551d7F#00ff00B &eMenu &7(&a/tfb&7)";
                break;
            default:
                return "#ee2b23T#3551d7F#00ff00B &eMenu &7(&a/tfb&7)";
        }

    } else if (type == "lore") {
        switch (lang) {
            case "da":
                return "&7Servere, Discord, Shop & meget mere!\\n\\n&aHøjreklik for at åbne";
                break;
            default:
                return "&7Servers, Discord,\\n&7Shop & much more!\\n\\n&aRight click to open";
        }
    } else { return "error"; }
}

tfbCompass();