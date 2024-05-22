
event_inherited()

dialog_tree = {
    text: "[Text exapmle: I'll need this back at the morgue]",
    options: {
        "Take 1 pill": {
            text: "[Like a doctor says]",
            options: {
                "Go to bed": "[end]",
            },
            call: function() {
                global.pills_taken = 1
            }
        },
        "Take 2 pills": {
            text: "[Let's boost the productivity]",
            options: {
                "Go to bed": "[end]",
            },
            call: function() {
                global.pills_taken = 2
            }
        },
        "Take none": {
            text: "[I just don't feel like taking meds]",
            options: {
                "Go to bed": "[end]",
            },
            call: function() {
                global.pills_taken = 0
            }
        }
    }
}
