//Initial Movement On the Conveyer Belt

event_inherited()

target_x = 240 - (sprite_width / 2)
x = -(sprite_width / 2)
y = room_height / 2

body_state = PBodyState.conveyer

hair_index = choose(-1, 0)

// body's info, displayed on PDA
info = choose(
	"John Smith\noccupation: farmer\ndeath cause: heart attack",
	"David White\noccupation: scientist\ndeath cause: poisonous snake bite",
	"Emily Brown\noccupation: chef\ndeath cause: poisoning",
	"Michael Jones\noccupation: firefighter\ndeath cause: building collapse",
	"Rachel Williams\noccupation: lawyer\ndeath cause: car accident",
	"Thomas Davis\noccupation: soldier\ndeath cause: died in combat",
	"Jessica Martinez\noccupation: nurse\ndeath cause: medical error",
	"James Taylor\noccupation: mechanic\ndeath cause: workplace accident",
	"Samantha Miller\noccupation: teacher\ndeath cause: terminal illness",
)

function setInfoDeathMissingReason() {
	info = "Kimberly Sinclair\n"
            + "occupation: school teacher\n"
            + "death cause: [c_red]null"
}
