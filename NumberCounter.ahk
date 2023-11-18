; === IMPORT NUMBER FUNCTIONS FROM https://www.autohotkey.com/board/topic/123215-convert-number-to-text/?p=693512 BEGIN ===
FormatNumber(n) { ; recursive function to spell out the name of a max 36 digit integer, after leading 0s removed
	Static p1=" thousand ",p2=" million ",p3=" billion ",p4=" trillion ",p5=" quadrillion ",p6=" quintillion "
         , p7=" sextillion ",p8=" septillion ",p9=" octillion ",p10=" nonillion ",p11=" decillion "
         , t2="twenty",t3="thirty",t4="forty",t5="fifty",t6="sixty",t7="seventy",t8="eighty",t9="ninety"
         , o0="zero",o1="one",o2="two",o3="three",o4="four",o5="five",o6="six",o7="seven",o8="eight"
         , o9="nine",o10="ten",o11="eleven",o12="twelve",o13="thirteen",o14="fourteen",o15="fifteen"
         , o16="sixteen",o17="seventeen",o18="eighteen",o19="nineteen"

	n :=RegExReplace(n,"^0+(\d)","$1") ; remove leading 0s from n

	If  (11 < d := (StrLen(n)-1)//3)   ; #of digit groups of 3
		Return "Number too big"

	If (d)                             ; more than 3 digits
		Return FormatNumber(SubStr(n,1,-3*d)) p%d% ((s:=SubStr(n,1-3*d)) ? ", " FormatNumber(s) : "")

	i := SubStr(n,1,1)
	If (n > 99)                        ; 3 digits
		Return o%i% " hundred" ((s:=SubStr(n,2)) ? " and " FormatNumber(s) : "")

	If (n > 19)                        ; n = 20..99
		Return t%i% ((o:=SubStr(n,2)) ? "-" o%o% : "")

	Return o%n%                        ; n = 0..19
}

PrettyNumber(n) { ; inserts thousands separators into a number string
	Return RegExReplace( RegExReplace(n,"^0+(\d)","$1"), "\G\d+?(?=(\d{3})+(?:\D|$))", "$0,")
}
; ============================================ IMPORT NUMBER FUNCTIONS END ================================================

;    This small AHK script allows you to easily do the repetetive task of spelling out numbers in multiple games.
;    Copyright (C) 2023  ccuser44
;
;    This program is free software: you can redistribute it and/or modify
;    it under the terms of the GNU General Public License as published by
;    the Free Software Foundation, either version 3 of the License, or
;    (at your option) any later version.
;
;    This program is distributed in the hope that it will be useful,
;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;    GNU General Public License for more details.
;
;    You should have received a copy of the GNU General Public License
;    along with this program.  If not, see <https://www.gnu.org/licenses/>.

msgbox, Ctr + Alt + Z to Open options, Ctr + Alt + X to pause. Copyright (C) 2023  ccuser44

!^z::
Gui, Add, Text, section, Maximum:
Gui, Add, Text, , Minimum:
Gui, Add, Text, , ChatKey:
Gui, Add, Text, , FormattedNumber:
Gui, Add, Text, , Silent:
Gui, Add, Text, , NoJump:
Gui, Add, Text, , Delay (in ms):
Gui, Add, Text, , Rand delay range (in ms):
Gui, Add, Text, , Prefix:
Gui, Add, Text, , Postfix:
Gui, Add, Text, , Completemessage:
Gui, Add, Text, , Is uppercase:

Gui, Add, Edit, vMAXIMUM ys
Gui, Add, Edit, vMINIMUM
Gui, Add, Edit, vCHAT_KEY
Gui, Add, Checkbox, vNUM_IS_FORMATTED
Gui, Add, Checkbox, vIS_SILENT
Gui, Add, Text, ; This exists to fix invalid spacing
Gui, Add, Checkbox, vNO_JUMP
Gui, Add, Edit, vDELAY
Gui, Add, Edit, vRAND_DELAY
Gui, Add, Edit, vPREFIX
Gui, Add, Edit, vPOSTFIX
Gui, Add, Edit, vCOMPLETE_MESSAGE
Gui, Add, Checkbox, vUPPER_CASE
Gui, Add, Button, default, Ok

Gui, Show,, NumberCounter
return

GuiClose:
ButtonOk:
Gui, Submit
msgbox, Will start in 2 seconds
sleep, 2000

SmallWait()
{
	Random rand, 1, 15
	sleep 2 + rand
}

ChatMessage(chatKeyLocal, message)
{
	send %chatKeyLocal%
	SmallWait()

	send %message%
	SmallWait()
	SmallWait()

	send {Enter}
	SmallWait()
}

ChatAndJump(chatKeyLocal, message, isSilent, noJump)
{
	if (vUPPER_CASE == true) {
		StringUpper, message, message
	}

	if (isSilent != true) {
		ChatMessage(chatKeyLocal, message)
	}

	SmallWait()

	if (noJump != true)  {
		send {space down}
		Random rand, 1, 20
		sleep 22 + rand
		send {space up}
	}
	SmallWait()
}

loopcount := MAXIMUM - MINIMUM + 1
count := MINIMUM
RegExMatch(RAND_DELAY, "O)^\s*(\d+);(\d+)+\s*$", regexMatches)
delayMin := (regexMatches[1] ? regexMatches[1] : 50)
delayMax := (regexMatches[2] ? regexMatches[2] : 700)

loop, %loopcount%
{
	ChatAndJump(CHAT_KEY, (PREFIX . (NUM_IS_FORMATTED ? FormatNumber(count) : count) . POSTFIX), IS_SILENT, NO_JUMP)

	Random rand, delayMin, delayMax
	sleep ((DELAY != "" ? DELAY : 2500) + rand)

	count++
}

if (COMPLETE_MESSAGE != "") {
	ChatMessage(CHAT_KEY, COMPLETE_MESSAGE)
}

sleep 500

msgbox, Number counter completed

!^x::
msgbox, Stopped number counter
ExitApp
