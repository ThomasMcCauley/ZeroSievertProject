audio_emitter_free(emitter_shoot)
audio_emitter_free(emitter_walk)
audio_emitter_free(emitter_talk)
path_delete(path_to_target)
if (lista_path_x != undefined)
{
    ds_list_destroy(lista_path_x)
    lista_path_x = undefined
}
if (lista_path_y != undefined)
{
    ds_list_destroy(lista_path_y)
    lista_path_y = undefined
}
if ds_exists(grid_faction_my, 5)
    ds_grid_destroy(grid_faction_my)
