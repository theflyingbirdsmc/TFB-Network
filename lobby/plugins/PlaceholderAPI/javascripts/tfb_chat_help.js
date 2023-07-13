var lang = "";
var type = "";
function danishStatus() {
    if ('%chatcontrolred_player_channel_mode_TFB-Help%' === "read")
        return "&blæser";
    else if ('%chatcontrolred_player_channel_mode_TFB-Help%' === "write")
        return "&askriver";
    else return "&cingen"
}

function englishStatus() {
    if ('%chatcontrolred_player_channel_mode_TFB-Help%' === "read")
        return "&breading";
    else if ('%chatcontrolred_player_channel_mode_TFB-Help%' === "write")
        return "&awriting";
    else return "&cnone"
}
function translate() {
    if (args.length == 2) {
        type = args[0];
        lang = args[1];
    }

    if (type == "name") {
        switch (lang) {
            case "da":
                return "#ee2b23T#3551d7F#00ff00B &cHjælp &8[" + danishStatus() + "&8]";
                break;
            default:
                return "#ee2b23T#3551d7F#00ff00B &cHelp &8[" + englishStatus() + "&8]";
        }

    } else if (type == "lore") {
        switch (lang) {
            case "da":
                return "&7Chat med staff på netværket!\\n&dGenvej: &a/h &8<&abesked&8>\\n\\n&eVenstreklik &7for at &askrive\\n&eHøjreklik &7for at &blæse\\n&eShift + højreklik &7for at &cforlade";
                break;
            default:
                return "&7Chat with staff on the network!\\n&dShortcut: &a/h &8<&amessage&8>\\n\\n&eLeft click &7to &awrite\\n&eRight click &7to &bread\\n&eShift + right click &7to &cleave";
        }
    } else { return "error"; }
}

translate();