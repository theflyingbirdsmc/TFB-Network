var lang = "";
var type = "";
function tfbYoutube() {
    if (args.length == 2) {
        type = args[0];
        lang = args[1];
    }

    if (type == "name") {
        switch (lang) {
            case "da":
                return "#ee2b23T#3551d7F#00ff00B #FF0000YouTube";
                break;
            default:
                return "#ee2b23T#3551d7F#00ff00B #FF0000YouTube";
        }

    } else if (type == "lore") {
        switch (lang) {
            case "da":
                return "&eKlik her for et link i chatten!";
                break;
            default:
                return "&eClick me to get a link in chat!";
        }
    } else if (type == "message") {
        switch (lang) {
            case "da":
                return "&ayoutube.com/user/theflyingbirdsmc&r &8<- &eKlik her for at besøge vores YouTube!";
                break;
            default:
                return "&ayoutube.com/user/theflyingbirdsmc&r &8<- &eClick me to see our YouTube";
        }
    } else { return "error"; }
}

tfbYoutube();