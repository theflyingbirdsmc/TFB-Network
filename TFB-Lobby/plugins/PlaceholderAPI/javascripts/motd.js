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
                return "             #f0f0f0Velkommen til #ee2b23T#f04923h#f26622e #3551d7F#366dd9l#3789dby#38a4ddi#39c0dfn#3adce1g #00ff00B#3fff00i#7dff00r#bcff00d#faff00s";
                break;
            default:
                return "              #f0f0f0Welcome to #ee2b23T#f04923h#f26622e #3551d7F#366dd9l#3789dby#38a4ddi#39c0dfn#3adce1g #00ff00B#3fff00i#7dff00r#bcff00d#faff00s";
        }

    } else if (type == "1") {
        switch (lang) {
            case "da":
                return "  #f0f0f0Brug &akompasset #f0f0f0eller &a/tfb #f0f0f0for at komme i gang";
                break;
            default:
                return "      #f0f0f0Use the &acompass #f0f0f0or &a/tfb #f0f0f0to get started";
        }
    } else if (type == "2") {
        switch (lang) {
            case "da":
                return "";
                break;
            default:
                return "";
        }
    } else if (type == "3") {
        switch (lang) {
            case "da":
                return "                   #f0f0f0Henvist af en ven?";
                break;
            default:
                return "                 #f0f0f0Referred by a friend?";
        }
    } else if (type == "4") {
        switch (lang) {
            case "da":
                return "         #f0f0f0Brug &a/refer &8<&aven&8> #f0f0f0for belønninger!";
                break;
            default:
                return "          #f0f0f0Use &a/refer &8<&afriend&8> #f0f0f0for rewards!";
        }
    } else if (type == "5") {
        switch (lang) {
            case "da":
                return "";
                break;
            default:
                return "";
        }
    } else if (type == "6") {
        switch (lang) {
            case "da":
                return "    #f0f0ffVi håber, at din tid hos os når nye højder!";
                break;
            default:
                return " #f0f0f0We hope your time with us soars to new heights!";
        }
    } else { return "error"; }
}

translate();