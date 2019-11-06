# MindustryShortcuts
AutoHotKey Script to enable shortcuts and quick item navigation in Mindustry


Mindustry lacks hotkeys to allow for item shortcuts or even item traversal in an efficient manner.   Until this feature is officially added, I made an attempt to create an AutoHotKey script to do what I could.

This solution is not perfect.  There are minor issues that may cause you to press a key twice to get the desired functionality.  However, in my opinion, the benefits far outweigh the costs.   


## Controls
* <TAB>    -  Go BACK an item category
* Q        -  Go FORWARD an item category
* <SPACE>  -  Go FORWARD an item
* <SHIFT+SPACE>  - Go BACK an item

## Hotkeys
* 1 thru 8
* Activates the item associated with this hotkey

Hotkey items are set in the Mindustry.ahk file in the SHORTCUT CONFIG section by defining the category number and the item number.   The first item in each category/section is zero.   As you unlock new items, previous shortcutted items MAY MOVE AROUND.   This means you may need to re-edit this file to point to the new location.


### Out of the box this script supports two resolution scenarios
* 1920x1080 @ 100% UI scaling
* 4K resolution (4096 x 2160) @ 125% UI scaling

The script relies on the fact that it knows your resolution and can automatically move the mouse to the appropriate positions.   If your resoulution is not configured correctly, it will not work.

You can switch between these two options by uncommenting/commenting the relavent section in the script.

```
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
;#END SCREEN CONFIG 1920x1080 /100% UI
;############## 
 

;##############
;#BEGIN SCREEN CONFIG 4K (3840x2160)/125% UI
;##############
BaseItemX := 3430
BaseItemY := 1830
BaseCategoryX := 3738  
BaseCategoryY := 1830
CategoryStepX := 80
CategoryStepY := 80
;##############
;#END SCREEN CONFIG 4K/125% UI
;############## 
```

In the example above, the 4K section is enabled, and the 1920x1080 section is disabled.    To enable the 1920x1080, remove the semicolon comments in the 1920x1080 section, and then add semicolons before the entries in the 4K config.


