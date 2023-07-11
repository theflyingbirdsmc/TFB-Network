var lang = "";
var type = "";
function tfbProfile() {
   if (args.length == 2) {
       type = args[0];
       lang = args[1];
   }
    
    if(type == "name") {
        switch(lang) {
            case "da":
                return "&bOm dig";
                break;
            default:
                return "&bAbout You";
        }
            
    } else if (type  == "lore") {
        switch(lang) {
            case "da":
                return "&eHer handler det kun om dig\\n&eog du er jo fantastisk! :)";
                break;
            default:
                return "&eHere it's all about you\\n&eand you are amazing! :)";
        }
    } else {return "error";}
}

tfbProfile();