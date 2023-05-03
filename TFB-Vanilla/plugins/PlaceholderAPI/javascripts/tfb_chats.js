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
                return "#ee2b23T#3551d7F#00ff00B &eNetwork Chats &8- &7Text in chats across the network!";
        }

    } else if (type == "lore") {
        switch (lang) {
            case "da":
                return "&7Skriv i chats på tværs af netværket!\\n&7Klik her, skriv &a/ch &7eller &a/ch ls &7for en oversigt\\n\\n&eKommando Genveje\\n&f- &a/c &8<&abesked&8> &8» &7Skriv med alle spillere!\\n&f- &a/h &8<&abesked&8> &8» &7Få hjælp fra admins!";
                break;
            default:
                return "&aLeft &7click to see your chats\\n&aRight &7click to see online chat players!\\n\\n&eCommand Shortcuts\\n&f- &a/c &8<&amessage&8> &8» &7Text with all players!\\n&f- &a/h &8<&amessage&8> &8» &7Get help from admins!";
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