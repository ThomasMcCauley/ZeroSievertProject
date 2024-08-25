function teleport_to(argument0) //gml_Script_teleport_to
{
    if (!teleport_allowed(argument0))
        return;
    with (obj_player)
    {
        switch argument0
        {
            case "Stash":
                x = 284
                y = 870
                break
            case "Conductor":
                x = 693
                y = 1343
                break
            case "Barman":
                x = 591
                y = 904
                break
            case "Doctor":
                x = 986
                y = 1032
                break
            case "Networker":
                x = 488
                y = 1040
                break
            case "Green Army":
                x = 86
                y = 586
                break
            case "Crimson Corporation":
                x = 770
                y = 815
                break
            default:
                trace_error("Teleport target \"", argument0, "\" not recognised")
                break
        }

    }
    obj_camera.alarm[1] = 1
}

