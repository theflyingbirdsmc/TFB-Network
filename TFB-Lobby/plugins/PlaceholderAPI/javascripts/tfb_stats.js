var lang = "";
var type = "";
function tfbStats() {
    if (args.length == 2) {
        type = args[0];
        lang = args[1];
    }

    if (type == "name") {
        switch (lang) {
            case "da":
                return "#ee2b23T#3551d7F#00ff00B #368F17Statistikker";
                break;
            default:
                return "#ee2b23T#3551d7F#00ff00B #368F17Statistics";
        }

    } else if (type == "lore") {
        switch (lang) {
            case "da":
                return "&eKlik her for et link i chatten!\\n\\n&f- &aSe statistikker om dig selv og andre spillere\\n&f- &aHar du en rank, så kan du se serverens statistikker!";
                break;
            default:
                return "&eClick me to get a link in chat!\\n\\n&f- &aCheck statistics about yourself and other players\\n&f- &aIf you have a rank, you can see server statistics!";
        }
    } else if (type == "message") {
        switch (lang) {
            case "da":
                return "&ahttps://stats.theflyingbirds.net &8<- &eKlik her for at joine!";
                break;
            default:
                return "&ahttps://stats.theflyingbirds.net &8<- &eClick me to see stats";
        }
    } else { return "error"; }
}

tfbStats();