#NoEnv
SetWorkingDir %A_ScriptDir%			
CoordMode, Mouse, Window
SendMode Input
#SingleInstance Force
SetTitleMatchMode 1
#WinActivateForce
SetControlDelay 1
SetWinDelay 0   		
SetKeyDelay -1
SetMouseDelay -1		
SetBatchLines -1		

CurrentCategory := 0
CurrentItem := 0


;##############
;#BEGIN SCREEN CONFIG 1920x1080 /100% UI
;##############
;BaseItemX := 1650
;BaseItemY := 860
;BaseCategoryX := 1845
;BaseCategoryY := 860
;CategoryStepX := 50
;CategoryStepY := 50
;##############
;#BEGIN SCREEN CONFIG 4K/125% UI
;############## 
 

;##############
;#BEGIN SCREEN CONFIG 4K (3840x2160)/125% UI
;##############
;BaseItemX := 3430
;BaseItemY := 1830
;BaseCategoryX := 3738  
;BaseCategoryY := 1830
;CategoryStepX := 80
;CategoryStepY := 80
;##############
;#BEGIN SCREEN CONFIG 4K/125% UI
;############## 
 
 
 

 
;##############
;#BEGIN SHORTCUT CONFIG
;##############

; base conveyor
1Category := 2
1Item     := 0

; router
2Category := 2
2Item     := 5

; standard drill
3Category := 1
3Item     := 0

; basic turret
4Category := 0
4Item     := 0

; copper wall
5Category := 5
5Item     := 0

6Category := 1
6Item     := 1

7Category := 1
7Item     := 1

8Category := 1
8Item     := 1

;##############
;#END SHORTCUT CONFIG
;############## 
 




MoveCurrentCategory(slot) {
	global BaseCategoryX
	global BaseCategoryY
	global CurrentItem
	global CategoryStepX
	global CategoryStepY
	
	_Clix := BaseCategoryX + (CategoryStepX * Mod(slot, 2))
	_Cliy := BaseCategoryY + (CategoryStepY * (Floor(slot / 2)))
     	
	Sleep, 45
	CoordMode, Mouse, Screen 
	MouseMove, _Clix, _Cliy
	Click Left, Down
	Sleep, 15
	Click, Left, Up
	; MsgBox % "Values " . _Clix
	Return


}

MoveCurrentItem(slot) {

	global BaseItemX
	global BaseItemY
	global CategoryStepX
	global CategoryStepY

	; click item
	_Clix := BaseItemX + (CategoryStepX * Mod(slot, 4))
	_Cliy := BaseItemY + (CategoryStepY * (Floor(slot / 4)))


	Sleep, 15
	CoordMode, Mouse, Screen 
	MouseMove, _Clix, _Cliy
	Click Left, Down
	Sleep, 15
	Click, Left, Up
	; MsgBox % "Values " . _Clix
	Return
}

MoveShortcut(category, item) {

	; capture mouse start pos
	CoordMode, Mouse, Screen 
	MouseGetPos, StartX, StartY


	MoveCurrentCategory(category)
	Sleep, 50


	; move to a DIFF item first, then to the real one -- the toggle off/on effect
	otherItem := 1
	if (item  == 1) {
		otherItem := 0
	}
	MoveCurrentItem(otherItem)
	
	MoveCurrentItem(item)

	
	; re position mouse at start pos
	CoordMode, Mouse, Screen 
	MouseMove, StartX, StartY
	Return
}


;#############
;# SHORTCUT KEYS 
;#############

1::
if (WinActive("Mindustry") == 0) {
	Send {1}
	Return
}  
MoveShortcut(1Category, 1Item)		
Return

2::
if (WinActive("Mindustry") == 0) {
	Send {2}
	Return
}  
MoveShortcut(2Category, 2Item)
Return

3::
if (WinActive("Mindustry") == 0) {
	Send {3}
	Return
}  
MoveShortcut(3Category, 3Item)
Return

4::
if (WinActive("Mindustry") == 0) {
	Send {4}
	Return
}  
MoveShortcut(4Category, 4Item)		
Return

5::
if (WinActive("Mindustry") == 0) {
	Send {5}
	Return
}  
MoveShortcut(5Category, 5Item)
Return

6::
if (WinActive("Mindustry") == 0) {
	Send {6}
	Return
}  
MoveShortcut(6Category, 6Item)
Return

7::
if (WinActive("Mindustry") == 0) {
	Send {7}
	Return
}  
MoveShortcut(7Category, 7Item)		
Return

8::
if (WinActive("Mindustry") == 0) {
	Send {8}
	Return
}  
MoveShortcut(8Category, 8Item)
Return



;#############
;# TAB/SPACE KEYS 
;#############

+Space:: 
if (WinActive("Mindustry") == 0) {
Send {Space}
Return
}  
           
; capture mouse start pos
CoordMode, Mouse, Screen 
MouseGetPos, StartX, StartY

CurrentItem := CurrentItem - 1
if (CurrentItem < 0) {
    CurrentItem := 16
}

MoveCurrentItem(CurrentItem)

; re position mouse at start pos
CoordMode, Mouse, Screen 
MouseMove, StartX, StartY

Return

$Space:: 
if (WinActive("Mindustry") == 0) {
Send {Space}
Return
}      
           
; capture mouse start pos
CoordMode, Mouse, Screen 
MouseGetPos, StartX, StartY

MoveCurrentItem(CurrentItem)

CurrentItem := CurrentItem + 1
if (CurrentItem >= 16) {
    CurrentItem := 0
}

; re position mouse at start pos
CoordMode, Mouse, Screen 
MouseMove, StartX, StartY

Return


q::
if (WinActive("Mindustry") == 0) {
Send {q}
Return
}     
    
; capture mouse start pos
CoordMode, Mouse, Screen 
MouseGetPos, StartX, StartY

CurrentCategory := CurrentCategory + 1

if (CurrentCategory >= 10) {
     CurrentCategory := 0
}

MoveCurrentCategory(CurrentCategory)
  


; reset to first item in this category:
CurrentItem := 0
MoveCurrentItem(CurrentItem)
CurrentItem := CurrentItem + 1
if (CurrentItem >= 16) {
    CurrentItem := 0
}



; re position mouse at start pos
CoordMode, Mouse, Screen 
MouseMove, StartX, StartY

Return


$Tab::
if (WinActive("Mindustry") == 0) {
Send {Tab}
Return
}     
    
; capture mouse start pos
CoordMode, Mouse, Screen 
MouseGetPos, StartX, StartY


CurrentCategory := CurrentCategory - 1

if (CurrentCategory < 0) {
     CurrentCategory := 9
}


MoveCurrentCategory(CurrentCategory)
  


; reset to first item in this category:
CurrentItem := 0
MoveCurrentItem(CurrentItem)
CurrentItem := CurrentItem + 1
if (CurrentItem >= 16) {
    CurrentItem := 0
}



; re position mouse at start pos
CoordMode, Mouse, Screen 
MouseMove, StartX, StartY

Return






