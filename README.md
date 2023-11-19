# Number Counter

Are you tired and of those (Roblox) military games that make you repetitively type numbers by counting up or down by attempting to badly "simulate" pushups? Would like a magic solution to it?
Well you have come to the right place my friend. Introducing Number Counter.

Number Counter is a simple AHK script that allows you to do the repetitive task of spelling out numbers and jumping completely automatically.
You probably shouldn't be playing such games in the first place but if you ever do then this script will remove all the useless cruft.
The script is also useful for any task that requires any repetitive typing of numbers including Excel spreadsheets etc.

No person should ever do such tasks, not only is it very frustrating but also will probably give you carpal tunnel.
Not only does this script attempt to make life easier but also make the gamedevs re-think bad game design.
Instead of making the players repetitively type stuff on their keyboards they could actually make people do pushups IRL with VR headseats or phones. That would actually be cool, fun and useful.

![A showcase of the script in game](Showcase.gif)

## Downloading

1. Download the [AutoHotkey program](https://www.autohotkey.com/) on your computer.
2. Download the [raw file](https://github.com/ccuser44/Number-Counter/raw/main/NumberCounter.ahk) anywhere on your computer so it is easily accessible.

## Usage

1. You must first open the file by double clicking it.
2. You will get a startup notification. Click `Ok` to close it.
3. Press `Ctrl + Alt + Z` to open the settings panel.
4. Configure the settings
	- Maximum - *(Required)* - The maximum number that the counter will count up to.
	- Minimum - *(Required)* -The number that the counter will start from. If this is higher than the maximum the counter will count downwards.
	- FormattedNumber - *(Optional)* - yes/no toggle if the number is pretty formatted instead of the raw numeral. On=`one`, Off=`1`.
	- Silent - *(Optional)* - yes/no toggle if the script will not chat any messages.
	- NoJump - *(Optional)* - yes/no toggle if the script will not jump.
	- Delay - *(Optional)* - Delay in milliseconds between counting of each number.
	- Rand delay range - *(Optional)* - Number range in miliseconds waited before each action. Example `10;35`
	- Prefix - *(Optional)* - Message that is appended before each number.
	- Postfix - *(Optional)* - Message that is appended after each number.
	- Completemessage - *(Optional)* - Message that is told after all numbers have been counted.
	- Is uppercase - *(Optional)* - If pretty printed numbers are uppercase.
5. Once you are done click `Ok` on the settings panel.
6. A notification will appear. Close it by clicking `Ok`.
7. You are done, just wait for the script to complete.

If you want to stop the number counter before it's finished press `Ctrl + Alt + X`.

## License

This AHK script is licensed under the [GPL V3 license](LICENSE).

---

I had made this script at least half a year ago but almost forgot about it. Now I'm releasing it.
