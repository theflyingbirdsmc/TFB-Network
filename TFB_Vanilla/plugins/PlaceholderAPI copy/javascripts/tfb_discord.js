var lang = "";
var type = "";
function tfbDiscord() {
    if (args.length == 2) {
        type = args[0];
        lang = args[1];
    }

    if (type == "name") {
        switch (lang) {
            case "da":
                return "#ee2b23T#3551d7F#00ff00B #5865F2Discord";
                break;
            default:
                return "#ee2b23T#3551d7F#00ff00B #5865F2Discord";
        }

    } else if (type == "lore") {
        switch (lang) {
            case "da":
                return "&eKlik her for et link i chatten!\\n\\n&f- &aBliv opdateret om alt med #ee2b23T#3551d7F#00ff00B &a;)\\n&f- &aFå din #ee2b23T#3551d7F#00ff00B &arank på vores Discord\\n&f- &aMød andre fugle du kan spille med :>";
                break;
            default:
                return "&eClick me to get a link in chat!\\n\\n&f- &aStay connected with everything #ee2b23T#3551d7F#00ff00B &a;)\\n&f- &aGet your #ee2b23T#3551d7F#00ff00B &arank as a Discord role\\n&f- &aMeet other birds :>";
        }
    } else if (type == "message") {
        switch (lang) {
            case "da":
                return "&adiscord.theflyingbirds.net&r &8<- &eKlik her for at joine!";
                break;
            default:
                return "&adiscord.theflyingbirds.net&r &8<- &eClick me to join!";
        }
    } else { return "error"; }
}

tfbDiscord();