var lang = "";
var type = "";
function tfbShop() {
    if (args.length == 2) {
        type = args[0];
        lang = args[1];
    }

    if (type == "name") {
        switch (lang) {
            case "da":
                return "#ee2b23T#3551d7F#00ff00B #235babShop";
                break;
            default:
                return "#ee2b23T#3551d7F#00ff00B #235babShop";
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
                return "&ashop.theflyingbirds.net&r &8<- &eKlik her for at besøge vores shop!";
                break;
            default:
                return "&ashop.theflyingbirds.net&r &8- &eClick me to visit our shop!";
        }
    } else { return "error"; }
}

tfbShop();