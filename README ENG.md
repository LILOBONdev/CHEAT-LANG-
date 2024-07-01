![To](https://cdn.discordapp.com/attachments/1172143899284885535/1257269963279040583/CheatLangTo.png?ex=6683cb66&is=668279e6&hm=702303628e6e9f3ac2cda4f3a3cdb36a5644a8cac0f5deef208c1f39a0b08a7d&)
# UPDATE V.1 - CHEAT LANG
* Template engine version 1, added basic mathematics, basic functionality, etc., read the documentation in the "BASE" section
* loadstring(game:HttpGet('https://raw.githubusercontent.com/LILOBONdev/CHEAT-LANG-/main/MainInCode.lua'))()

* ⛔ The `aipath` library is damaged in this version, but its code has already been fixed and will be uploaded to the git hub after a while.

# FAST INFA
* Updates every Sunday, patches - new libraries, new commands, etc. Everything is done by me alone, use the script via loadstring. Because I don’t think everyone will want to copy this hulk and paste it into an injector.
* The language is templated and made for small tasks, like WallHack, etc. Also, over time, libraries will be added that can be imported, for example the library: CheatPackCounterBlox.
* Read the documentation, it is your only assistant, and for individual bugs and questions write here: nl1754 DISCORD or https://discord.gg/SYACB5DCZd. - Studio server where the developer is located.


# CheatLang is a template engine for performing modest tasks. :books:
**Base**
It is a small terminal for entering commands or for writing code; command injection is recognized by pressing `LeftAlt`. Code commands are written using the prefix: `/`. Basic mathematics is built into the engine, here are all the operators: `+` `-` `/` `*` `<` `>`. To calculate, you do not need to write a prefix command. Example: 2 + 2. Be sure to put a space after each argument!

**syntax**
For example, take the command: /print. It prints out the 2nd argument, but you can replace the argument with a function. List of basic functions:
* `placeversion` - shows the version of the place where you are currently located;
* `placeid` - shows the identifier of the place where you are currently located;
* `aboutlocal` - displays information about the local player;
* `commands` - shows a list of basic commands.

These functions may also be needed when you write code using the command: /script

**Start Coding**
Starting position for writing code: `game`. With this piece of code you get access to the game and directly to the object-oriented syntax.

__:loadasett__ - Loads everything in your game with a stop interval of 0.1 seconds. At this point, the process cannot be stopped; you need to wait until the assets are loaded. Not recommended for use during a gaming session where objects exceed +30K.

__:getplayers__ - Gets all current players in the game. If you use this function, you need to specify parameters and code islands. Example below: `/script game :getplayers {fromcharacter} filter: isn't-me-teamcolor instance sound rbxassetid://4809574295 10 play`

As we see, we get players as Character and using the function: `filter:` we filter ourselves and the players in our team, and for players not from our team we add `sound` and set the volume to 10 and play it.


# CheatLang - page: 2 :clipboard:
**Methods**
All arguments in {curly braces} are called methods; methods are the basis of coding in CheatLang. Using methods you can construct the code as you need, list of CheatLang methods:
* `{fromcharacter}` - Gets player-players as Character ;
* `{fromplayer}` - Gets player-players ;
* `{fromplayername}` - Gets the name of the 1st player;

**features with game package**
As on the first page, I will continue to list the functions that come after `game`:
__:getstuctures__ - Gets access to the structures of the entire game, depending on the object filter: `filter:`. If you filter all the desks, then: `filter: allparts`. If all mesh desks, then: `filter: allmesh`. In this beta of the engine you can change the transparency of filtered objects. Example:

`/script game :getstuctures filter: allparts 0 true` - The argument after filtering is transparency.

__:spawn__ - Spawns an object by type part, etc. Example: `/script game :spawn part`. The object will spawn relative to your position; the beta version does not yet provide multitasking for object spawning.


# CheatLang - page 3 :clipboard:
**Import libraries**/
The engine is gradually adding libraries, here is the method for getting the library using the `/script` command. To begin with, you import the library using the `importlibrary` function, then comes the name of the library and after all the specified arguments you include it using the `true` value. But it is possible that you can also disable the included library using the value `false`. Example code: ` /script importlibrary pathai true` >> short-term loading >> you've loaded the library, congratulations!

**Bind your favorite command-code**
Using the `bind` command will save you time since you specify the command name and its initial code in the 3rd argument. The team name can be anything. Example: `/bind mycommandn
ame print lol` >> `/mycommandname` >> `print lol`. Remember to follow the engine syntax, write everything in lowercase letters.

:warning: - There is only 1 bind command, unfortunately, this will gradually change with the availability of updates. Also, when the bind of your command works, you must remove 1 extra space at the very beginning of the code. Sorry for the inconvenience :frowning:

© CHEAT LANG™ - All rights reserved.
