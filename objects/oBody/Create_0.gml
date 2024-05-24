//Initial Movement On the Conveyer Belt

event_inherited()

target_x = 240 - (sprite_width / 2)
x = -(sprite_width / 2)
y = room_height / 2

body_state = PBodyState.conveyer

hair_index = choose(-1, 0)

info = choose(
	"John Smith, a farmer, died from a heart attack",
	"Sarah Johnson, a detective, died from a gunshot wound",
	"David White, a scientist, died from a poisonous snake bite",
	"Emily Brown, a chef, died from food poisoning",
	"Michael Jones, a firefighter, died in a building collapse",
	"Rachel Williams, a lawyer, died from a car accident",
	"Thomas Davis, a soldier, died in combat",
	"Jessica Martinez, a nurse, died from a medical error",
	"James Taylor, a mechanic, died in a workplace accident",
	"Samantha Miller, a teacher, died from a terminal illness",
)