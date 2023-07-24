var lang = "";
var type = "";
function translate() {
    if (args.length == 2) {
        type = args[0];
        lang = args[1];
    }

    if (type == "name") {
        switch (lang) {
            case "da":
                return "&cTilbage";
                break;
            default:
                return "&cBack";
        }

    } else if (type == "lore") {
        switch (lang) {
            case "da":
                return "";
                break;
            default:
                return "";
        }
    } else { return "error"; }
}

translate();