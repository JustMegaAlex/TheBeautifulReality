### Codestyle
#### Namings:
- PascalCase for global functions
- camelCase for object and struct functions
- python_case for variables
- SCREAM_CASE for global variables and macros
#### Spaces and braces
- use collapsed braces
- put spaces after arguments in function definitions and calls
- files should end with a newline
- don't use semicolons (they are useless in GM 99% of time)
- wrap lines bigger that 80 symbols for better readabiltiy  

A good example of code:  
```
if yes {
    DoStuff("good", 1, false)
} else {
    DoOtherStuff(
        SomeLongFunctionCall(),
        SomeLongFunctionCall(),
        SomeLongFunctionCall(),
        SomeLongFunctionCall(),
    )
}
```
Or simply use autoformatter https://beautifier.io/ 😉

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
  

### Variable definitions
Use varialbe definitions only if these vars are supposed to be editable in room editor
