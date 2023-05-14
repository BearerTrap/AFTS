#NoEnv ; Prevents adding any environment variables to the script
#SingleInstance force ; Ensures only one instance of the script is running

; Define variables
global autoClick := false
global xCoord := 0
global yCoord := 0
global colorToCheck := "FF0000" ; Replace with your desired color code

; Set up hotkeys
F1::
    autoClick := !autoClick
    if (autoClick) {
        SetTimer, ClickLoop, 10
    } else {
        SetTimer, ClickLoop, Off
    }
return

F2:: ; Set the location to click
    MouseGetPos, xCoord, yCoord
return

; Define the ClickLoop subroutine
ClickLoop:
    PixelGetColor, pixelColor, %xCoord%, %yCoord%
    if (pixelColor = colorToCheck) {
        autoClick := false
        SetTimer, ClickLoop, Off
    } else {
        Click %xCoord%, %yCoord%
    }
return
