var lang = "";
var type = "";
function translate() {
    if (args.length == 2) {
        type = args[0];
        lang = args[1];
    }

    if (type == "header") {
        switch (lang) {
            case "da":
                return "            #f0f0f0Velkommen til #ee2b23T#f04923h#f26622e #3551d7F#366dd9l#3789dby#38a4ddi#39c0dfn#3adce1g #00ff00B#3fff00i#7dff00r#bcff00d#faff00s";
                break;
            default:
                return "             #f0f0f0Welcome to #ee2b23T#f04923h#f26622e #3551d7F#366dd9l#3789dby#38a4ddi#39c0dfn#3adce1g #00ff00B#3fff00i#7dff00r#bcff00d#faff00s";
        }

    } else if (type == "lore") {
        switch (lang) {
            case "da":
                return "&7Chat med alle på tværs af netværket!\\n&dGenvej: &a/c &8<&abesked&8>\\n\\n&eVenstreklik &7for at &askrive\\n&eHøjreklik &7for at &blæse\\n&eShift + højreklik &7for at &cforlade";
                break;
            default:
                return "&7Chat with all players on the network!\\n&dShortcut: &a/c &8<&amessage&8>\\n\\n&eLeft click &7to &awrite\\n&eRight click &7to &bread\\n&eShift + right click &7to &cleave";
        }
    } else { return "error"; }
}

translate();