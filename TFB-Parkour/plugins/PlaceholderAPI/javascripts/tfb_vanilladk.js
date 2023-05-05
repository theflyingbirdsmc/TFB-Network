var lang = "";
var type = "";
function tfbVanillaDK() {
   if (args.length == 2) {
       type = args[0];
       lang = args[1];
   }
    
    if(type == "name") {
        switch(lang) {
            case "da":
                return "&2Vanilla ";
                break;
            default:
                return "&2Vanilla";
        }
            
    } else if (type  == "lore") {
        switch(lang) {
            case "da":
                return "&eSprog&8: &7Dansk\\n&eKlik for at joine nu!";
                break;
            default:
                return "&eLanguage&8: &7Danish\\n&eClick to connect now!";
        }
    } else if (type  == "message") {
        switch(lang) {
            case "da":
                return "&ahttps://stats.theflyingbirds.net:8804 &8<- &eKlik her for at joine!";
                break;
            default:
                return "&ahttps://stats.theflyingbirds.net:8804 &8<- &eClick me to see stats";
        }
    } else {return "error";}
}

tfbVanillaDK();