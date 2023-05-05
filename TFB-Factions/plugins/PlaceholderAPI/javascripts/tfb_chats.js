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
                return "#ee2b23T#3551d7F#00ff00B &eNetværk Chats";
                break;
            default:
                return "#ee2b23T#3551d7F#00ff00B &eNetwork Chats";
        }

    } else if (type == "lore") {
        switch (lang) {
            case "da":
                return "&7Skriv i chats på tværs af netværket!\\n&aKlik &7for at se dine chats";
                break;
            default:
                return "&7Text in chats across the network!\\n&aClick &7to see your chats";
        }
    } else { return "error"; }
}

tfbDiscord();