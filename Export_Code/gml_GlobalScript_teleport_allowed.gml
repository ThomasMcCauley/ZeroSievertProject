function teleport_allowed(argument0) //gml_Script_teleport_allowed
{
    switch argument0
    {
        case "Stash":
        case "Conductor":
        case "Barman":
        case "Doctor":
        case "Networker":
            return true;
        case "Green Army":
            return quest_is_complete("unlock_makeshift_camp");
        case "Crimson Corporation":
            return quest_is_complete("new_arrivals");
    }

}

