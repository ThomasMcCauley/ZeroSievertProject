/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_mm_init_lista

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_mm_init_lista

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function lista_craft() //gml_Script_lista_craft
{
    global.craft_req = -4
    global.craft_req_n = -4
    global.craft_id = -4
    global.craft_name = -4
    global.craft_track = -4
    global.craft_cost = -4
    global.craft_type = -4
    global.craft_get = -4
    global.craft_get_n = -4
    global.craft_get_dur = -4
    global.craft_req_skill_id = -4
    global.craft_req_skill_lvl = -4
    global.craft_req_module_id = -4
    global.craft_req_module_lvl = -4
    for (var i = 0; i < 250; i++)
    {
        global.craft_cost[i] = -1
        global.craft_track[i] = false
    }
    i = 0
    var j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (0 << 0)
    global.craft_req[i][0] = "scrap_med"
    global.craft_req_n[i][0] = 3
    global.craft_get[i] = "bandage"
    global.craft_get_n[i] = 1
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (0 << 0)
    global.craft_req[i][0] = "water_bottle"
    global.craft_req_n[i][0] = 1
    global.craft_req[i][1] = "bandage"
    global.craft_req_n[i][1] = 3
    global.craft_get[i] = "bandage_sterilizzata"
    global.craft_get_n[i] = 3
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (16 << 0)
    global.craft_req_skill_lvl[i] = 1
    global.craft_req_module_id[i] = (1 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (0 << 0)
    global.craft_req[i][0] = "scrap_med"
    global.craft_req_n[i][0] = 5
    global.craft_get[i] = "pills_anti_rad"
    global.craft_get_n[i] = 2
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (16 << 0)
    global.craft_req_skill_lvl[i] = 1
    global.craft_req_module_id[i] = (1 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (0 << 0)
    global.craft_req[i][0] = "scrap_med"
    global.craft_req_n[i][0] = 5
    global.craft_req[i][1] = "bandage"
    global.craft_req_n[i][1] = 1
    global.craft_req[i][2] = "bandage_sterilizzata"
    global.craft_req_n[i][2] = 1
    global.craft_req[i][3] = "scissors_surgery"
    global.craft_req_n[i][3] = 1
    global.craft_get[i] = "medikit_long"
    global.craft_get_n[i] = 2
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (16 << 0)
    global.craft_req_skill_lvl[i] = 2
    global.craft_req_module_id[i] = (1 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (0 << 0)
    global.craft_req[i][0] = "scrap_med"
    global.craft_req_n[i][0] = 6
    global.craft_req[i][1] = "bandage"
    global.craft_req_n[i][1] = 2
    global.craft_req[i][2] = "injector_vuoto"
    global.craft_req_n[i][2] = 1
    global.craft_req[i][3] = "scissors_surgery"
    global.craft_req_n[i][3] = 1
    global.craft_get[i] = "medikit_1"
    global.craft_get_n[i] = 1
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (16 << 0)
    global.craft_req_skill_lvl[i] = 3
    global.craft_req_module_id[i] = (1 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (0 << 0)
    global.craft_req[i][0] = "scrap_med"
    global.craft_req_n[i][0] = 6
    global.craft_req[i][1] = "bandage_sterilizzata"
    global.craft_req_n[i][1] = 2
    global.craft_req[i][2] = "injector_vuoto"
    global.craft_req_n[i][2] = 1
    global.craft_req[i][3] = "scissors_surgery"
    global.craft_req_n[i][3] = 1
    global.craft_get[i] = "medikit_2"
    global.craft_get_n[i] = 1
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (16 << 0)
    global.craft_req_skill_lvl[i] = 3
    global.craft_req_module_id[i] = (1 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (0 << 0)
    global.craft_req[i][0] = "bandage"
    global.craft_req_n[i][0] = 2
    global.craft_req[i][1] = "scrap_med"
    global.craft_req_n[i][1] = 4
    global.craft_get[i] = "anti_bleed_gel"
    global.craft_get_n[i] = 1
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (16 << 0)
    global.craft_req_skill_lvl[i] = 4
    global.craft_req_module_id[i] = (1 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (0 << 0)
    global.craft_req[i][0] = "medikit_long"
    global.craft_req_n[i][0] = 2
    global.craft_req[i][1] = "bandage"
    global.craft_req_n[i][1] = 2
    global.craft_req[i][2] = "scrap_med"
    global.craft_req_n[i][2] = 4
    global.craft_get[i] = "med_wound_1"
    global.craft_get_n[i] = 1
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (18 << 0)
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = (1 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (0 << 0)
    global.craft_req[i][0] = "cristallo_red"
    global.craft_req_n[i][0] = 3
    global.craft_req[i][1] = "scrap_med"
    global.craft_req_n[i][1] = 10
    global.craft_req[i][2] = "injector_vuoto"
    global.craft_req_n[i][2] = 1
    global.craft_get[i] = "injector1"
    global.craft_get_n[i] = 1
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (18 << 0)
    global.craft_req_skill_lvl[i] = 1
    global.craft_req_module_id[i] = (1 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (0 << 0)
    global.craft_req[i][0] = "cristallo_red"
    global.craft_req_n[i][0] = 3
    global.craft_req[i][1] = "scrap_med"
    global.craft_req_n[i][1] = 8
    global.craft_req[i][2] = "scrap_food"
    global.craft_req_n[i][2] = 20
    global.craft_req[i][3] = "injector_vuoto"
    global.craft_req_n[i][3] = 1
    global.craft_get[i] = "injector5"
    global.craft_get_n[i] = 1
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (18 << 0)
    global.craft_req_skill_lvl[i] = 2
    global.craft_req_module_id[i] = (1 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (0 << 0)
    global.craft_req[i][0] = "cristallo_red"
    global.craft_req_n[i][0] = 3
    global.craft_req[i][1] = "scrap_med"
    global.craft_req_n[i][1] = 8
    global.craft_req[i][2] = "pills_anti_rad"
    global.craft_req_n[i][2] = 1
    global.craft_req[i][3] = "injector_vuoto"
    global.craft_req_n[i][3] = 1
    global.craft_get[i] = "injector6"
    global.craft_get_n[i] = 1
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (18 << 0)
    global.craft_req_skill_lvl[i] = 3
    global.craft_req_module_id[i] = (1 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (0 << 0)
    global.craft_req[i][0] = "cristallo_verde"
    global.craft_req_n[i][0] = 2
    global.craft_req[i][1] = "scrap_med"
    global.craft_req_n[i][1] = 16
    global.craft_req[i][2] = "injector_vuoto"
    global.craft_req_n[i][2] = 1
    global.craft_get[i] = "injector2"
    global.craft_get_n[i] = 1
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (18 << 0)
    global.craft_req_skill_lvl[i] = 4
    global.craft_req_module_id[i] = (1 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (0 << 0)
    global.craft_req[i][0] = "cristallo_verde"
    global.craft_req_n[i][0] = 2
    global.craft_req[i][1] = "cristallo_red"
    global.craft_req_n[i][1] = 2
    global.craft_req[i][2] = "scrap_med"
    global.craft_req_n[i][2] = 14
    global.craft_req[i][3] = "injector_vuoto"
    global.craft_req_n[i][3] = 1
    global.craft_get[i] = "injector3"
    global.craft_get_n[i] = 1
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (18 << 0)
    global.craft_req_skill_lvl[i] = 5
    global.craft_req_module_id[i] = (1 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (0 << 0)
    global.craft_req[i][0] = "cristallo_verde"
    global.craft_req_n[i][0] = 2
    global.craft_req[i][1] = "cristallo_red"
    global.craft_req_n[i][1] = 2
    global.craft_req[i][1] = "cristallo_blu"
    global.craft_req_n[i][1] = 1
    global.craft_req[i][2] = "scrap_med"
    global.craft_req_n[i][2] = 18
    global.craft_req[i][3] = "injector_vuoto"
    global.craft_req_n[i][3] = 1
    global.craft_get[i] = "injector4"
    global.craft_get_n[i] = 1
    var kk = 1
    if (global.sk_k[(70 << 0)] == true)
        kk = 1.3
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 30
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 10
    global.craft_get[i] = "ammo_9x18"
    global.craft_get_n[i] = ceil(50 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 3
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 45
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 16
    global.craft_get[i] = "ammo_9x18_pbm"
    global.craft_get_n[i] = ceil(50 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 1
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 35
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 10
    global.craft_get[i] = "ammo_9x19"
    global.craft_get_n[i] = ceil(50 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 35
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 10
    global.craft_get[i] = "ammo_9x19_sub"
    global.craft_get_n[i] = ceil(50 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 4
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 50
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 16
    global.craft_get[i] = "ammo_9x19_ap"
    global.craft_get_n[i] = ceil(50 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 30
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 10
    global.craft_get[i] = "ammo_762x25"
    global.craft_get_n[i] = ceil(50 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 3
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 45
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 16
    global.craft_get[i] = "ammo_762x25_pst"
    global.craft_get_n[i] = ceil(50 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 1
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 30
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 10
    global.craft_get[i] = "ammo_57x28"
    global.craft_get_n[i] = ceil(40 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 30
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 10
    global.craft_get[i] = "ammo_57x28_sub"
    global.craft_get_n[i] = ceil(40 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 3
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 52
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 16
    global.craft_get[i] = "ammo_57x28_ss190"
    global.craft_get_n[i] = ceil(40 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 2
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 30
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 10
    global.craft_get[i] = "ammo_45"
    global.craft_get_n[i] = ceil(40 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 4
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 45
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 15
    global.craft_get[i] = "ammo_45_ap"
    global.craft_get_n[i] = ceil(40 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 3
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 22
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 9
    global.craft_get[i] = "ammo_9x39"
    global.craft_get_n[i] = ceil(30 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 5
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 42
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 14
    global.craft_get[i] = "ammo_9x39_bp"
    global.craft_get_n[i] = ceil(30 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 15
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 4
    global.craft_get[i] = "ammo_545x39_hp"
    global.craft_get_n[i] = ceil(30 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 15
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 4
    global.craft_get[i] = "ammo_545x39_sub"
    global.craft_get_n[i] = ceil(30 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 2
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 20
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 7
    global.craft_get[i] = "ammo_545x39"
    global.craft_get_n[i] = ceil(30 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 4
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 38
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 15
    global.craft_get[i] = "ammo_545x39_bt"
    global.craft_get_n[i] = ceil(30 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 1
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 18
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 6
    global.craft_get[i] = "ammo_762x39_hp"
    global.craft_get_n[i] = ceil(30 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 1
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 18
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 6
    global.craft_get[i] = "ammo_762x39_sub"
    global.craft_get_n[i] = ceil(30 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 2
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 25
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 8
    global.craft_get[i] = "ammo_762x39"
    global.craft_get_n[i] = ceil(30 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 5
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 37
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 10
    global.craft_get[i] = "ammo_762x39_bp"
    global.craft_get_n[i] = ceil(30 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 1
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 18
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 6
    global.craft_get[i] = "ammo_556x45_hp"
    global.craft_get_n[i] = ceil(30 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 18
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 6
    global.craft_get[i] = "ammo_556x45_sub"
    global.craft_get_n[i] = ceil(30 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 3
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 24
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 8
    global.craft_get[i] = "ammo_556x45"
    global.craft_get_n[i] = ceil(30 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 5
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 40
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 12
    global.craft_get[i] = "ammo_556x45_m995"
    global.craft_get_n[i] = ceil(30 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 2
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 35
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 10
    global.craft_get[i] = "ammo_762x54R"
    global.craft_get_n[i] = ceil(30 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 5
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 60
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 15
    global.craft_get[i] = "ammo_762x54R_snb"
    global.craft_get_n[i] = ceil(30 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 2
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 30
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 10
    global.craft_get[i] = "ammo_762x51_hp"
    global.craft_get_n[i] = ceil(30 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 4
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 38
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 13
    global.craft_get[i] = "ammo_762x51"
    global.craft_get_n[i] = ceil(30 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 5
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 60
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 20
    global.craft_get[i] = "ammo_762x51_m61"
    global.craft_get_n[i] = ceil(30 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 2
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 30
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 10
    global.craft_get[i] = "ammo_127x55_hp"
    global.craft_get_n[i] = ceil(30 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 4
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 38
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 13
    global.craft_get[i] = "ammo_127x55_ps"
    global.craft_get_n[i] = ceil(30 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 5
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 60
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 20
    global.craft_get[i] = "ammo_127x55_bp"
    global.craft_get_n[i] = ceil(30 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 1
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 20
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 10
    global.craft_get[i] = "ammo_12x70"
    global.craft_get_n[i] = ceil(20 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 2
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 28
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 13
    global.craft_get[i] = "ammo_12x70_slug"
    global.craft_get_n[i] = ceil(20 * kk)
    i++
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (22 << 0)
    global.craft_req_skill_lvl[i] = 4
    global.craft_req_module_id[i] = (12 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (1 << 0)
    global.craft_req[i][0] = "scrap_ammo"
    global.craft_req_n[i][0] = 38
    global.craft_req[i][1] = "scrap_material"
    global.craft_req_n[i][1] = 17
    global.craft_get[i] = "ammo_12x70_slug_ap"
    global.craft_get_n[i] = ceil(20 * kk)
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (2 << 0)
    global.craft_req[i][j] = "bread_rotten"
    global.craft_req_n[i][j] = 2
    j++
    global.craft_get[i] = "bread"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (2 << 0)
    global.craft_req[i][j] = "water_bottle_rotten"
    global.craft_req_n[i][j] = 2
    j++
    global.craft_get[i] = "water_bottle"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = (5 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (2 << 0)
    global.craft_req[i][j] = "water_bottle_rotten"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "carbone"
    global.craft_req_n[i][j] = 5
    j++
    global.craft_get[i] = "water_bottle"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (2 << 0)
    global.craft_req[i][j] = "meat_cooked"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "bread"
    global.craft_req_n[i][j] = 2
    global.craft_get[i] = "sandwich_meat"
    global.craft_get_n[i] = 2
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (2 << 0)
    global.craft_req[i][j] = "butter"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "bread"
    global.craft_req_n[i][j] = 1
    global.craft_get[i] = "sandwich_butter"
    global.craft_get_n[i] = 2
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (2 << 0)
    global.craft_req[i][j] = "salame"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "bread"
    global.craft_req_n[i][j] = 1
    global.craft_get[i] = "sandwich_salame"
    global.craft_get_n[i] = 2
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (2 << 0)
    global.craft_req[i][j] = "wurstel"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "bread"
    global.craft_req_n[i][j] = 1
    global.craft_get[i] = "sandwich_wurstel"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = (5 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (2 << 0)
    global.craft_req[i][j] = "egg"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "carbone"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "water_bottle"
    global.craft_req_n[i][j] = 1
    global.craft_get[i] = "egg_boiled"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = (5 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (2 << 0)
    global.craft_req[i][j] = "scrap_food"
    global.craft_req_n[i][j] = 7
    j++
    global.craft_req[i][j] = "carbone"
    global.craft_req_n[i][j] = 4
    j++
    global.craft_req[i][j] = "water_bottle"
    global.craft_req_n[i][j] = 1
    global.craft_get[i] = "pasta"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = (5 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (2 << 0)
    global.craft_req[i][j] = "pasta"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "carbone"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "water_bottle"
    global.craft_req_n[i][j] = 1
    global.craft_get[i] = "pasta_cooked"
    global.craft_get_n[i] = 2
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = (5 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (2 << 0)
    global.craft_req[i][j] = "raw_meat"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "carbone"
    global.craft_req_n[i][j] = 1
    global.craft_get[i] = "meat_cooked"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = (5 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (2 << 0)
    global.craft_req[i][j] = "raw_meat"
    global.craft_req_n[i][j] = 2
    j++
    global.craft_req[i][j] = "canned_beans"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "carbone"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "water_bottle"
    global.craft_req_n[i][j] = 1
    global.craft_get[i] = "stew_meat_beans"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = (5 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (2 << 0)
    global.craft_req[i][j] = "water_bottle"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "carbone"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "coffee"
    global.craft_req_n[i][j] = 1
    global.craft_get[i] = "cup_coffee"
    global.craft_get_n[i] = 3
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = (5 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (2 << 0)
    global.craft_req[i][j] = "water_bottle"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "tea_bag"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "carbone"
    global.craft_req_n[i][j] = 1
    global.craft_get[i] = "cup_tea"
    global.craft_get_n[i] = 2
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_req_skill_id[i] = (20 << 0)
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = (5 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_name[i] = ""
    global.craft_cost[i] = 0
    global.craft_type[i] = (2 << 0)
    global.craft_req[i][j] = "raw_meat"
    global.craft_req_n[i][j] = 2
    j++
    global.craft_req[i][j] = "salt"
    global.craft_req_n[i][j] = 3
    j++
    global.craft_req[i][j] = "pepper"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "carbone"
    global.craft_req_n[i][j] = 1
    global.craft_get[i] = "meatballs"
    global.craft_get_n[i] = 3
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = (20 << 0)
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = (5 << 0)
    global.craft_req_module_lvl[i] = 1
    global.craft_cost[i] = 0
    global.craft_type[i] = (2 << 0)
    global.craft_req[i][j] = "egg"
    global.craft_req_n[i][j] = 3
    j++
    global.craft_req[i][j] = "carbone"
    global.craft_req_n[i][j] = 3
    j++
    global.craft_req[i][j] = "salt"
    global.craft_req_n[i][j] = 2
    j++
    global.craft_req[i][j] = "pepper"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_get[i] = "egg_cooked"
    global.craft_get_n[i] = 3
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (6 << 0)
    global.craft_req[i][j] = "scrap_material"
    global.craft_req_n[i][j] = 35
    j++
    global.craft_req[i][j] = "screw_nut"
    global.craft_req_n[i][j] = 10
    j++
    global.craft_req[i][j] = "nail"
    global.craft_req_n[i][j] = 10
    j++
    global.craft_req[i][j] = "hammer"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "screwdriver"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "wrench"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "dutch_tape"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "metal_pipe"
    global.craft_req_n[i][j] = 2
    global.craft_get[i] = "base_storage_1"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (6 << 0)
    global.craft_req[i][j] = "pillow"
    global.craft_req_n[i][j] = 4
    j++
    global.craft_req[i][j] = "scrap_material"
    global.craft_req_n[i][j] = 60
    j++
    global.craft_req[i][j] = "screw_nut"
    global.craft_req_n[i][j] = 30
    j++
    global.craft_req[i][j] = "nail"
    global.craft_req_n[i][j] = 30
    j++
    global.craft_req[i][j] = "hammer"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "screwdriver"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "dutch_tape"
    global.craft_req_n[i][j] = 2
    j++
    global.craft_req[i][j] = "metal_pipe"
    global.craft_req_n[i][j] = 4
    j++
    global.craft_req[i][j] = "bulb"
    global.craft_req_n[i][j] = 2
    global.craft_get[i] = "base_bed_1"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (6 << 0)
    global.craft_req[i][j] = "pot_cooking"
    global.craft_req_n[i][j] = 4
    j++
    global.craft_req[i][j] = "scrap_material"
    global.craft_req_n[i][j] = 50
    j++
    global.craft_req[i][j] = "screw_nut"
    global.craft_req_n[i][j] = 15
    j++
    global.craft_req[i][j] = "nail"
    global.craft_req_n[i][j] = 15
    j++
    global.craft_req[i][j] = "hammer"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "screwdriver"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "dutch_tape"
    global.craft_req_n[i][j] = 2
    j++
    global.craft_req[i][j] = "metal_pipe"
    global.craft_req_n[i][j] = 4
    j++
    global.craft_req[i][j] = "fork"
    global.craft_req_n[i][j] = 6
    j++
    global.craft_req[i][j] = "spoon"
    global.craft_req_n[i][j] = 6
    j++
    global.craft_req[i][j] = "knife"
    global.craft_req_n[i][j] = 6
    j++
    global.craft_req[i][j] = "bulb"
    global.craft_req_n[i][j] = 2
    global.craft_get[i] = "base_kitchen_1"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (6 << 0)
    global.craft_req[i][j] = "scrap_material"
    global.craft_req_n[i][j] = 60
    j++
    global.craft_req[i][j] = "screw_nut"
    global.craft_req_n[i][j] = 15
    j++
    global.craft_req[i][j] = "nail"
    global.craft_req_n[i][j] = 15
    j++
    global.craft_req[i][j] = "screwdriver"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "metal_pipe"
    global.craft_req_n[i][j] = 4
    j++
    global.craft_req[i][j] = "bulb"
    global.craft_req_n[i][j] = 2
    j++
    global.craft_req[i][j] = "scrap_med"
    global.craft_req_n[i][j] = 25
    j++
    global.craft_req[i][j] = "soap"
    global.craft_req_n[i][j] = 3
    j++
    global.craft_req[i][j] = "acqua_ossigenata"
    global.craft_req_n[i][j] = 2
    j++
    global.craft_req[i][j] = "pillow"
    global.craft_req_n[i][j] = 1
    global.craft_get[i] = "base_infirmary_1"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (6 << 0)
    global.craft_req[i][j] = "scrap_material"
    global.craft_req_n[i][j] = 80
    j++
    global.craft_req[i][j] = "screw_nut"
    global.craft_req_n[i][j] = 10
    j++
    global.craft_req[i][j] = "nail"
    global.craft_req_n[i][j] = 25
    j++
    global.craft_req[i][j] = "hammer"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "screwdriver"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "dutch_tape"
    global.craft_req_n[i][j] = 2
    j++
    global.craft_req[i][j] = "metal_pipe"
    global.craft_req_n[i][j] = 4
    j++
    global.craft_req[i][j] = "hose"
    global.craft_req_n[i][j] = 2
    j++
    global.craft_req[i][j] = "scrap_food"
    global.craft_req_n[i][j] = 40
    global.craft_get[i] = "base_garden_1"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (6 << 0)
    global.craft_req[i][j] = "scrap_material"
    global.craft_req_n[i][j] = 50
    j++
    global.craft_req[i][j] = "screw_nut"
    global.craft_req_n[i][j] = 35
    j++
    global.craft_req[i][j] = "nail"
    global.craft_req_n[i][j] = 35
    j++
    global.craft_req[i][j] = "hammer"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "drill"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "wrench"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "screwdriver"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "bulb"
    global.craft_req_n[i][j] = 4
    j++
    global.craft_req[i][j] = "scrap_weapon"
    global.craft_req_n[i][j] = 60
    global.craft_get[i] = "base_workshop_1"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (6 << 0)
    global.craft_req[i][j] = "scrap_material"
    global.craft_req_n[i][j] = 20
    j++
    global.craft_req[i][j] = "bulb"
    global.craft_req_n[i][j] = 5
    j++
    global.craft_req[i][j] = "dumbell"
    global.craft_req_n[i][j] = 4
    j++
    global.craft_req[i][j] = "fan"
    global.craft_req_n[i][j] = 3
    global.craft_get[i] = "base_gym_1"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (6 << 0)
    global.craft_req[i][j] = "scrap_material"
    global.craft_req_n[i][j] = 60
    j++
    global.craft_req[i][j] = "screw_nut"
    global.craft_req_n[i][j] = 20
    j++
    global.craft_req[i][j] = "nail"
    global.craft_req_n[i][j] = 20
    j++
    global.craft_req[i][j] = "hammer"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "screwdriver"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "dutch_tape"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "metal_pipe"
    global.craft_req_n[i][j] = 6
    j++
    global.craft_req[i][j] = "scrap_ammo"
    global.craft_req_n[i][j] = 150
    j++
    global.craft_req[i][j] = "scrap_weapon"
    global.craft_req_n[i][j] = 60
    global.craft_get[i] = "base_shooting_range_1"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (6 << 0)
    global.craft_req[i][j] = "scrap_material"
    global.craft_req_n[i][j] = 40
    j++
    global.craft_req[i][j] = "screw_nut"
    global.craft_req_n[i][j] = 25
    j++
    global.craft_req[i][j] = "nail"
    global.craft_req_n[i][j] = 25
    j++
    global.craft_req[i][j] = "carbone"
    global.craft_req_n[i][j] = 15
    j++
    global.craft_req[i][j] = "hammer"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "screwdriver"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "dutch_tape"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "metal_pipe"
    global.craft_req_n[i][j] = 4
    j++
    global.craft_req[i][j] = "scrap_ammo"
    global.craft_req_n[i][j] = 300
    global.craft_get[i] = "base_ammo_1"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (6 << 0)
    global.craft_req[i][j] = "scrap_material"
    global.craft_req_n[i][j] = 100
    j++
    global.craft_req[i][j] = "scrap_ammo"
    global.craft_req_n[i][j] = 100
    j++
    global.craft_req[i][j] = "scrap_med"
    global.craft_req_n[i][j] = 25
    j++
    global.craft_req[i][j] = "scrap_food"
    global.craft_req_n[i][j] = 30
    j++
    global.craft_req[i][j] = "scrap_weapon"
    global.craft_req_n[i][j] = 50
    global.craft_get[i] = "base_recycling_1"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (6 << 0)
    global.craft_req[i][j] = "scrap_material"
    global.craft_req_n[i][j] = 120
    j++
    global.craft_req[i][j] = "screw_nut"
    global.craft_req_n[i][j] = 30
    j++
    global.craft_req[i][j] = "nail"
    global.craft_req_n[i][j] = 30
    j++
    global.craft_req[i][j] = "carbone"
    global.craft_req_n[i][j] = 30
    j++
    global.craft_req[i][j] = "drill"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "screwdriver"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "hammer"
    global.craft_req_n[i][j] = 2
    global.craft_get[i] = "base_forge_1"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (6 << 0)
    global.craft_req[i][j] = "water_bottle"
    global.craft_req_n[i][j] = 8
    j++
    global.craft_req[i][j] = "vodka"
    global.craft_req_n[i][j] = 5
    j++
    global.craft_req[i][j] = "coke"
    global.craft_req_n[i][j] = 3
    j++
    global.craft_req[i][j] = "bread"
    global.craft_req_n[i][j] = 10
    j++
    global.craft_req[i][j] = "tushonka_meat"
    global.craft_req_n[i][j] = 5
    j++
    global.craft_req[i][j] = "coffee"
    global.craft_req_n[i][j] = 2
    j++
    global.craft_req[i][j] = "tea_bag"
    global.craft_req_n[i][j] = 2
    j++
    global.craft_req[i][j] = "pasta"
    global.craft_req_n[i][j] = 3
    j++
    global.craft_req[i][j] = "gameboy"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_get[i] = "base_scavenger_1"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (7 << 0)
    global.craft_req[i][j] = "scrap_material"
    global.craft_req_n[i][j] = 80
    j++
    global.craft_req[i][j] = "screw_nut"
    global.craft_req_n[i][j] = 40
    j++
    global.craft_req[i][j] = "nail"
    global.craft_req_n[i][j] = 40
    j++
    global.craft_req[i][j] = "hammer"
    global.craft_req_n[i][j] = 2
    j++
    global.craft_req[i][j] = "screwdriver"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "wrench"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "drill"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "dutch_tape"
    global.craft_req_n[i][j] = 2
    j++
    global.craft_req[i][j] = "metal_pipe"
    global.craft_req_n[i][j] = 4
    global.craft_get[i] = "base_storage_2"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (3 << 0)
    global.craft_req[i][j] = "scrap_material"
    global.craft_req_n[i][j] = 10
    j++
    global.craft_req[i][j] = "scrap_weapon"
    global.craft_req_n[i][j] = 15
    j++
    global.craft_req[i][j] = "dutch_tape"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "pliers"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "screwdriver"
    global.craft_req_n[i][j] = 1
    global.craft_get[i] = "repair_weapon1_high"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (3 << 0)
    global.craft_req[i][j] = "scrap_material"
    global.craft_req_n[i][j] = 50
    j++
    global.craft_req[i][j] = "dutch_tape"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "pliers"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "screwdriver"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "hammer"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_get[i] = "repair_armor_high"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (3 << 0)
    global.craft_req[i][j] = "scrap_material"
    global.craft_req_n[i][j] = 15
    j++
    global.craft_req[i][j] = "scrap_weapon"
    global.craft_req_n[i][j] = 25
    j++
    global.craft_req[i][j] = "dutch_tape"
    global.craft_req_n[i][j] = 2
    j++
    global.craft_req[i][j] = "pliers"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "screwdriver"
    global.craft_req_n[i][j] = 1
    global.craft_get[i] = "repair_weapon2_high"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (3 << 0)
    global.craft_req[i][j] = "scrap_material"
    global.craft_req_n[i][j] = 20
    j++
    global.craft_req[i][j] = "scrap_weapon"
    global.craft_req_n[i][j] = 30
    j++
    global.craft_req[i][j] = "dutch_tape"
    global.craft_req_n[i][j] = 2
    j++
    global.craft_req[i][j] = "pliers"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "screwdriver"
    global.craft_req_n[i][j] = 1
    global.craft_get[i] = "repair_weapon3_high"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (3 << 0)
    global.craft_req[i][j] = "scrap_material"
    global.craft_req_n[i][j] = 35
    j++
    global.craft_req[i][j] = "scrap_weapon"
    global.craft_req_n[i][j] = 55
    j++
    global.craft_req[i][j] = "dutch_tape"
    global.craft_req_n[i][j] = 3
    j++
    global.craft_req[i][j] = "pliers"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "drill"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "screwdriver"
    global.craft_req_n[i][j] = 1
    global.craft_get[i] = "repair_weapon1_low"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (3 << 0)
    global.craft_req[i][j] = "scrap_material"
    global.craft_req_n[i][j] = 45
    j++
    global.craft_req[i][j] = "scrap_weapon"
    global.craft_req_n[i][j] = 65
    j++
    global.craft_req[i][j] = "dutch_tape"
    global.craft_req_n[i][j] = 3
    j++
    global.craft_req[i][j] = "pliers"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "drill"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "screwdriver"
    global.craft_req_n[i][j] = 1
    global.craft_get[i] = "repair_weapon2_low"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (3 << 0)
    global.craft_req[i][j] = "scrap_material"
    global.craft_req_n[i][j] = 60
    j++
    global.craft_req[i][j] = "scrap_weapon"
    global.craft_req_n[i][j] = 80
    j++
    global.craft_req[i][j] = "dutch_tape"
    global.craft_req_n[i][j] = 4
    j++
    global.craft_req[i][j] = "pliers"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "wrench"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "drill"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "screwdriver"
    global.craft_req_n[i][j] = 1
    global.craft_get[i] = "repair_weapon3_low"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (3 << 0)
    global.craft_req[i][j] = "scrap_material"
    global.craft_req_n[i][j] = 100
    j++
    global.craft_req[i][j] = "dutch_tape"
    global.craft_req_n[i][j] = 2
    j++
    global.craft_req[i][j] = "pliers"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "screwdriver"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "drill"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "bolt_cutter"
    global.craft_req_n[i][j] = 1
    global.craft_get[i] = "repair_armor_low"
    global.craft_get_n[i] = 1
    i++
    j = 0
    global.craft_id[i] = i
    global.craft_name[i] = ""
    global.craft_req_skill_id[i] = false
    global.craft_req_skill_lvl[i] = 0
    global.craft_req_module_id[i] = -1
    global.craft_req_module_lvl[i] = 0
    global.craft_cost[i] = 0
    global.craft_type[i] = (8 << 0)
    global.craft_req[i][j] = "car_battery"
    global.craft_req_n[i][j] = 1
    j++
    global.craft_req[i][j] = "bulb"
    global.craft_req_n[i][j] = 24
    j++
    global.craft_req[i][j] = "wires"
    global.craft_req_n[i][j] = 10
    j++
    global.craft_req[i][j] = "relay"
    global.craft_req_n[i][j] = 5
    j++
    global.craft_req[i][j] = "multi_plug"
    global.craft_req_n[i][j] = 2
    j++
    global.craft_req[i][j] = "power_outlet"
    global.craft_req_n[i][j] = 5
    j++
    global.craft_get[i] = "natale_luci_kit"
    global.craft_get_n[i] = 1
    global.last_stastic_craft = i + 1
    for (var m = 0; m < global.last_stastic_craft; m++)
        global.craft_track[m] = false
    scr_load_tracked_craft()
    gml_Script_mm_init_lista()
    if (ds_list_size(global.lista_repair_id) > 0)
    {
        for (j = 0; j < ds_list_size(global.lista_repair_id); j++)
        {
            i++
            global.craft_id[i] = i
            global.craft_name[i] = ""
            global.craft_cost[i] = 0
            global.craft_req_skill_id[i] = false
            global.craft_req_skill_lvl[i] = 0
            global.craft_req_module_id[i] = -1
            global.craft_req_module_lvl[i] = 0
            global.craft_type[i] = (4 << 0)
            global.craft_req[i][0] = "scrap_weapon"
            global.craft_req_n[i][0] = ds_list_find_value(global.lista_repair_qnt, j)
            global.craft_req[i][1] = "scrap_material"
            global.craft_req_n[i][1] = ceil((ds_list_find_value(global.lista_repair_qnt, j)) * 0.4)
            global.craft_get[i] = ds_list_find_value(global.lista_repair_id, j)
            global.craft_get_n[i] = 1
            global.craft_get_dur[i] = ds_list_find_value(global.lista_repair_dur, j)
        }
    }
    if (ds_list_size(global.lista_mod_id) > 0)
    {
        for (var k = 0; k < ds_list_size(global.lista_mod_id); k++)
        {
            i++
            global.craft_id[i] = i
            global.craft_name[i] = ""
            global.craft_req_skill_id[i] = false
            global.craft_req_skill_lvl[i] = 0
            global.craft_req_module_id[i] = -1
            global.craft_req_module_lvl[i] = 0
            global.craft_cost[i] = 0
            global.craft_type[i] = (5 << 0)
            global.craft_req[i][0] = "scrap_weapon"
            global.craft_req_n[i][0] = 1
            global.craft_get[i] = ds_list_find_value(global.lista_mod_id, k)
            global.craft_get_n[i] = 1
        }
    }
}

