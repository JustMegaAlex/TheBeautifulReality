//Initial Movement On the Conveyer Belt

event_inherited()

target_x = oConveyerBelt.bbox_right - 100

function setConveyorY() {
    y = oConveyerBelt.y - 150
}

function setConveyorCoords() {
    x = -(sprite_width / 2)
    setConveyorY()
}

function setTableCoords() {
    x = oTable.x - sprite_width * 0.5
    y = oTable.y - 150
}

setConveyorCoords()

body_parts_scale = 0.25
sprite_index = choose(sBodyFace1, sBodyFace2, sBodyFace3)
image_xscale = body_parts_scale
image_yscale = body_parts_scale
body_parts = [
    choose(sBodyHair1, sBodyHair3, sBodyHair2),
    choose(sBodyNose1, sBodyNose2),
    choose(sBodyLips1, sBodyLips2),
    choose(sBodyEyebrows1, sBodyEyebrows2),
]

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

props_names = []
//How many items needed
props_count = choose(1,2,3)

//How many items the body currently has
props_current = 0

function moveToOutConveyor() {
    x = oConveyerBeltOut.bbox_left + 50
    y = oConveyerBeltOut.y
}


function setInfoDeathMissingReason() {
	info = "Kimberly Sinclair\n"
            + "occupation: reliable team player with attention to details\n"
            + "death cause:"
}

function setInfoMitchel() {
    info = "Name:  David Mitchel\n\nAge: 35-40 yrs\n\nOccupation: ~~Mortician~~  Efficient Multi-tasker!"
            + "\n\nCause of Death: Unknown"
}

//Props
props_list_names = 
[
	"Flowers",
	"ModelPlane", 
	"Camera", 
	"Knitting",
	"Necklace", 
	"Book", 
	"Flask", 
	"TeddyBear"
]

props_list_sprites =
[
	sInventoryItemFlowers,
	sInventoryItemModelPlane,
	sInventoryItemCamera,
	sInventoryItemKnitting,
	sInventoryItemNecklace,
	sInventoryItemBook,
	sInventoryItemFlask,
	sInventoryItemTeddyBear
]


var _size = array_length(props_list_names)

for (var i = 0; i < props_count; i ++) {
	var _choice = irandom_range(0, (_size - 1))

    array_push(props_names, props_list_names[_choice])

	with instance_create_layer(oConveyerBelt.bbox_left + 100, oConveyerBelt.bbox_top + (i * 40), "Instances", oInventoryItem) {
		sprite_index = other.props_list_sprites[_choice]

		//Temporary, until final assets
		image_xscale = 0.3
		image_yscale = 0.3
	}
}
