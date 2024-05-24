event_inherited()

dialog_tree = {
    text: "Why, if it isn't my favorite human in the whole wide world!",
    options: {
        "How was your day?": "Just the usual spot of spring cleaning here and there.\nI spent time with the kids so I can't really complain. ",

        "Have you been taking some time for yourself?": "I'm fine, I promise. But it's nice to know you care.\nI'm here for you too pookie. ",

        "What's for dinner?": "I maaaay have cooked your favorite…surprise!\nThere's nothing like a good pie, am I right? ",

        "Can I talk to you about work?": {
            text: "Of course hun, what's up?",
            options: {
                "Do you think it's what they would have wanted? To be dolled up on their deathbeds like that?":
				    "I know it is.\nAnd hey, god forbid the grim reaper caught me with my bare face on,\nI might just SCARE THE LIFE OUTTA HIM…get it?! Ah, forget it.  ",

                "How about a vacation?": {
                    text: "Hmm, whisking away to a tropical paradise does sound nice but…shouldn't we consider our responsibilities first? You're doing such great work pookie. ",
                    options: {
                        "Huh, I remember the days Sharon would make up just about any excuse to go on holiday…]": "[end]"
                    },
                    event: NarrativeEvents.asked_sharon_about_vacation
                }
            }
        }
    }
}

dialog_family_photo = {
    text: "Hi honey",
    options: {
        "You used to love the mountains. Remember?": {
            text: "Oh... yes of course. I prefer the cold, silly me.\n"
                  + "How about I que up some location videos for us.\n"
                  + "They'll make us feel like we're right there again, I promise!",
            options: {
                "How could you just…forget something like that? I bet she's overworking herself again.]":
                    "[end]"
            }
        }
    },
    event: NarrativeEvents.showed_photo_to_sharon
}

function interact(item) {
    if item.object_index == oFamilyPhoto {
        startDialog(dialog_family_photo)
    }
    instance_destroy(item)
}
