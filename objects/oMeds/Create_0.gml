
event_inherited()

dialog_tree = {
    text: "HEY HUN, DON'T FORGET TO TAKE YOUR DAILY DOSE OF ANTIDEPRESSANTS."
          + "\nYOU KNOW HOW CRANKY AND CONFUSED YOU GET WITHOUT THEM!"
          + "\n\nLOVE,\nPOOKIE",
    options: {
        "Take 1 pill": {
            text: "[Better play it safe, gotta long day tomorrow.]",
            options: {
                "Go to bed": "[end]",
            },
            call: function() {
                global.pills_taken = 1
            }
        },
        "Take 2 pills": {
            text: "[Here goes nothing. Merry will be pleased]",
            options: {
                "Go to bed": "[end]",
            },
            call: function() {
                global.pills_taken = 2
            }
        },
        "Take none": {
            text: "[I don't need it today. What's the worst thing that could happen?]",
            options: {
                "Go to bed": "[end]",
            },
            call: function() {
                global.pills_taken = 0
            }
        }
    }
}
