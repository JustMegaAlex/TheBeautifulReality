### Codestyle
- PascalCase for global functions
- camelCase for object and struct functions
- python_case for variables
- SCREAM_CASE for global variables and macros

### Code structure
Separate code into systems. A system can be and object, a bunch of global functions or a combo of both.
To communicate with system use interface functions, as opposed to using its variables directly. Let's say we have oSoundSystem and we want to use it to play some audio.
Do:  
    `oSoundSystem.playAudio(sndBgMusic)`  
Don't do:  
    `oSoundSystem.current_audio = sndBgMusic`

Here's a more common case for GM. Let's say you want to shoot a cutscene. It animates the player itself, so you don't want the player object to be drawn during the cutscene. You also want to turn off all the player inputs.
Instead of doing smth like this:  
    `oPlayer.visible = false`  
    `oPlayer.had_control = false`  
Just incapsulate that into a separate function:  
    `oPlayer.setInactive()`  

Why:
- we can easily split the work among us
- a code structured in this way is more easy to backtrace and debug
- it gives a better readability understanding of how a system should be used
  

### Varialbe definitions
Use varialbe definitions only if these vars are supposed to be editable in room editor
