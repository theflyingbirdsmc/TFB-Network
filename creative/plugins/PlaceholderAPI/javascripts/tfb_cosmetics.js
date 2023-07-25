var lang = "";
var type = "";
function tfbCosmetics() {
   if (args.length == 2) {
       type = args[0];
       lang = args[1];
   }            
     if (type  == "lore") {
        switch(lang) {
            case "da":
                return "&7Mystery Eggs: &b%gadgetsmenu_mystery_boxes%\\n&7Mystery Eggshells: &b%gadgetsmenu_mystery_dust%\\n\\n&7Enjoy fun cosmetic features!\\n&7You get &bEggs &7by voting/playing\\n&7so keep playing and stay awesome!";
                break;
            default:
                return "&7Mystery Eggs: &b%gadgetsmenu_mystery_boxes%\\n&7Mystery Eggshells: &b%gadgetsmenu_mystery_dust%\\n\\n&7Enjoy fun cosmetic features!\\n&7You get &bEggs &7by voting/playing\\n&7so keep playing and stay awesome!";
        }
    } else {return "error";}
}

tfbCosmetics();