function scr_npc_arms(argument0, argument1) //gml_Script_scr_npc_arms
{
    var ss = argument0
    var arms = argument1
    state = ss
    draw_weapon = false
    var aa = instance_create_depth(x, y, 0, arms)
    aa.linked_id = id
    aa.image_xscale = image_xscale
}

