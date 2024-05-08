//Initial Movement On the Conveyer Belt

event_inherited()

targetX = 240 - (sprite_width/2)
x = -(sprite_width/2)
y = room_height/2

body_state = p_body_state.conveyer

hair_index = choose(-1,0)