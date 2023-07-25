var lang = "";
var type = "";
function translate() {
    if (args.length == 2) {
        type = args[0];
        lang = args[1];
    }

    if (type == "1") {
        switch (lang) {
            case "da":
                return "&f🕊 &eVelkommen til &#ee2b23T&#f04923h&#f26622e &#3551d7F&#366dd9l&#3789dby&#38a4ddi&#39c0dfn&#3adce1g &#00ff00B&#3fff00i&#7dff00r&#bcff00d&#faff00s &f🕊";
                break;
            default:
                return "&f🕊 &eWelcome to &#ee2b23T&#f04923h&#f26622e &#3551d7F&#366dd9l&#3789dby&#38a4ddi&#39c0dfn&#3adce1g &#00ff00B&#3fff00i&#7dff00r&#bcff00d&#faff00s &f🕊";
        }

    } else if (type == "3") {
        switch (lang) {
            case "da":
                return "&a🧭 &aKlik her &eeller brug kompasset for at komme i gang &a🧭";
                break;
            default:
                return "&a🧭 &aClick here &eor use the &acompass &eto get started &a🧭";
        }
    } else { return "error"; }
}

translate();