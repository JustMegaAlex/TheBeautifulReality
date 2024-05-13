
event_inherited()

/*

SHARON ANDERSON
Why, if it isn’t my favorite human in the whole wide world. 

ROBIN
Hey Sharon, how was your day? 
Oh Robin, I had the most delightful time with the kids! And the house is sparkling clean of course…thanks to my trusty hard work. You’re such a lucky man to have me, you know. 

Have you been taking some time for yourself? 
What a considerate, handsomely tall and caring husband I have. You know sometimes I feel like I was made to be a mother, I don’t need time off from the kids silly. Their time is my time.

What’s for dinner?
You should know, it's your favorite. There’s nothing like a good pie. 

Can I talk to you about work? 
Of course sweetie, what’s on your mind? 
---
Do you think it’s what they would have wanted? To be dolled up on their deathbeds like that? 
I certainly would. God forbid the grim reaper caught me with my bare face on, I might just SCARE THE LIFE OUTTA HIM…get it?! Oh who am I kiddin’. 
---
How about a vacation? 
B. A family vacation? Oh Robin. As much as I’d love to whisk the kids away to a tropical paradise, we should really consider our responsibilities. After all, you have such important work to do, and it wouldn't be fair to leave it all behind, would it? 
[Huh, I remember the days Sharon would make up just about any excuse to go on holiday…]
*/

dialog_tree = {
    text: "Why, if it isn’t my favorite human in the whole wide world!",
    options: {
        "Hey Sharon, how was your day?":
                "Oh Robin, I had the most delightful time with the kids!"
                + "\nAnd the house is sparkling clean of course…thanks to my trusty hard work."
                + "\nYou’re such a lucky man to have me, you know.",

        "Have you been taking some time for yourself?": 
                "What a considerate, handsomely tall and caring husband I have."
                + "\nYou know sometimes I feel like I was made to be a mother,"
                + "\nI don’t need time off from the kids silly. Their time is my time.",
        
        
        "What’s for dinner?":
            "\nYou should know, it's your favorite. There’s nothing like a good pie.",

        "Can I talk to you about work? ": {
            text: "Of course sweetie, what’s on your mind? ",
            options: {
                "Do you think it’s what they would have wanted? To be dolled up on their deathbeds like that?":
                    "I certainly would. God forbid the grim reaper caught me with my bare face on,"
                    + "\nI might just SCARE THE LIFE OUTTA HIM…get it?! Oh who am I kiddin’.",
 
                "How about a vacation?": {
                    text: "A family vacation? Oh Robin."
                        + "\nAs much as I’d love to whisk the kids away to a tropical paradise,"
                        + "\nwe should really consider our responsibilities. After all, "
                        + "\nyou have such important work to do, and it wouldn't be fair to leave it all behind, would it?",
                    options: {
                        "Huh, I remember the days Sharon would make up just about any excuse to go on holiday…]": "[end]"
                    }
                }
            }
        }
            

    }
}
