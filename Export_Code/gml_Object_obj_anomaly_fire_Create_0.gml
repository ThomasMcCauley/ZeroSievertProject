event_inherited()
collision = false
active = false
damage = 1
var x1 = x div 8
var y1 = y div 8
mp_grid_add_cell(global.grid_move, x1, y1)
mp_grid_add_cell(global.grid_move, (x1 + 1), y1)
mp_grid_add_cell(global.grid_move, x1, (y1 + 1))
mp_grid_add_cell(global.grid_move, (x1 + 1), (y1 + 1))
my_emitter = audio_emitter_create()
audio_emitter_falloff(my_emitter, 32, 128, 1)
audio_emitter_position(my_emitter, x, y, 0)
my_sound = undefined
