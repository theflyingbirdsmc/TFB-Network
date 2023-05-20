var lang = "";
var type = "";

function getRandomMessage(messages) {
    var randomIndex = Math.floor(Math.random() * messages.length);
    return messages[randomIndex];
}

var greetings = [
    "#f0f0f0Welcome back, &dKatieDeForest#f0f0f0! Soar high and conquer the skie",
    "#f0f0f0Hey &dKatieDeForest#f0f0f0! Ready to spread your wings and explore?",
    "#f0f0f0Greetings, &dKatieDeForest#f0f0f0! Let's tweet some Minecraft magic"
];

function translate() {
    if (args.length == 2) {
        type = args[0];
        lang = args[1];
    }

    if (type == "header") {
        switch (lang) {
            case "da":
                return getRandomMessage(greetings);
                break;
            default:
                return getRandomMessage(greetings);
        }

    } else if (type == "1") {
        switch (lang) {
            case "da":
                return "            #f0f0f0Brug &a/tfb #f0f0f0for at komme i gang";
                break;
            default:
                return "                #f0f0f0Use &a/tfb #f0f0f0to get started";
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