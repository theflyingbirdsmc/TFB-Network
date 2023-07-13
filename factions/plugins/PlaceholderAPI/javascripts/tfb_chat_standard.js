var lang = "";
var type = "";
function danishStatus() {
    if ('%chatcontrolred_player_channel_mode_English%' === "read")
        return "&blæser";
    else if ('%chatcontrolred_player_channel_mode_English%' === "write")
        return "&askriver";
    else return "&cingen"
}

function englishStatus() {
    if ('%chatcontrolred_player_channel_mode_English%' === "read")
        return "&breading";
    else if ('%chatcontrolred_player_channel_mode_English%' === "write")
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
                return "&eStandard &8[" + danishStatus() + "&8]";
                break;
            default:
                return "&eStandard &8[" + englishStatus() + "&8]";
        }

    } else if (type == "lore") {
        switch (lang) {
            case "da":
                return "&7Chat kun med spillere på denne server!\\n&dGenvej: &7ingen\\n\\n&eVenstreklik &7for at &askrive\\n&eHøjreklik &7for at &blæse\\n&eShift + højreklik &7for at &cforlade";
                break;
            default:
                return "&7Chat only with players on this server!\\n&dShortcut: &7none\\n\\n&eLeft click &7to &awrite\\n&eRight click &7to &bread\\n&eShift + right click &7to &cleave";
        }
    } else { return "error"; }
}

translate();