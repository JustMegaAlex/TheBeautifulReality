event_inherited()

function setActive(value) {
    is_active = value
    image_index = value ? 1 : 0
	var test = true
}

image_speed = 0

setActive(false)

function triggerEndGame(choice) {
    var transition = oRoomSwitch
    transition.target_room = rmEnding
    transition.switchRoom()
    global.ending_version = choice
}

dialog_tree = {
    text: "CONGRATULATIONS HIRELING! YOU YES YOU, HAVE BEEN SELECTED OUT OF THOUSANDS AS THIS YEAR'S EMPLOYEE OF THE MONTH, AND HAVE EARNED YOURSELF A ONCE IN A LIFETIME TOP TIER PROMOTION!",
    options: {
        "ACCEPT": {
            text: "[end]",
            call: function() {
                oPie.triggerEndGame(0)
            }
        },
        "DECLINE": {
            text: "[end]",
            call: function() {
                oPie.triggerEndGame(1)
            }
        }
    }
}
