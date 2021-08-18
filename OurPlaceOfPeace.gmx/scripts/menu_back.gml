switch(subMenu)
{
    case "Main":
        menu_close();
    break;
    case "Trail Mix":
        menu_call("Main");
    break;
    case "Artes Slot":
        menu_call("Artes Player");
    break;
    case "Artes Slot Select":
        menu_call_artes_slot(selectedPlayerId);
    break;
    case "Skill Arte":
        menu_call("Skill Player");
    break;
    case "Skill Upgrade":
        menu_call("Skill Arte");
    break;
    case "Settings":
        menu_call("Main");
    break;
    default:
        menu_call("Main");
    break;
}
