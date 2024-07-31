/*
This script is developed by Tris the Kitten. 

This script combines the "Null Movement script" which works the same as current trending "Snap Tap" feature which enhances keyboard movement controls , providing a smoother and more responsive experience useful for games like CS2 where quick direction changes and fluid movement are crucial and my own Auto-CounterStrafe Feature which works like DKS in wooting keyboards which will do Counter Strafing automatically without the user need to master the technique at all. 

This is a macro script written using AHK script and using macros in online games can cause you a ban , so use it at your own risk !!!

This script may consume a considerable amount of system resources since it is checking each input keystrokes every specified ms. So, if this is unstable to use, please don't use it. 

This script is not perfect and may have some bugs. If you find any bugs, please let me know.
*/


#SingleInstance force
SetWorkingDir A_ScriptDir
A_MaxHotkeysPerInterval := 99000000
A_HotkeyInterval := 0

global left_pressed := 0
global right_pressed := 0
global up_pressed := 0
global down_pressed := 0

global left_active := 0
global right_active := 0
global up_active := 0
global down_active := 0

global last_direction := ""

*$a::
{   
    global left_pressed, right_pressed, left_active, right_active, last_direction
    left_pressed := 1
    last_direction := "a"
    
    if right_active
    { 
        right_active := 0
        Send "{Blind}{d up}"
    }
    
    if !left_active
    {
        left_active := 1
        Send "{Blind}{a down}"
    }
}

*$a up::
{    
    global left_pressed, right_pressed, left_active, right_active, last_direction
    left_pressed := 0
    
    if left_active
    {
        left_active := 0
        Send "{Blind}{a up}"
        if (last_direction == "a")
        {
            Send "{Blind}{d down}"
            Sleep 10
            Send "{Blind}{d up}"
        }
    }
        
    if right_pressed && !right_active
    {
        right_active := 1
        Send "{Blind}{d down}"
    }
}

*$d::
{    
    global left_pressed, right_pressed, left_active, right_active, last_direction
    right_pressed := 1
    last_direction := "d"
    
    if left_active
    {
        left_active := 0
        Send "{Blind}{a up}"
    }
    
    if !right_active
    {
        right_active := 1
        Send "{Blind}{d down}"
    }
}

*$d up::
{    
    global left_pressed, right_pressed, left_active, right_active, last_direction
    right_pressed := 0
    
    if right_active
    {
        right_active := 0
        Send "{Blind}{d up}"
        if (last_direction == "d")
        {
            Send "{Blind}{a down}"
            Sleep 10
            Send "{Blind}{a up}"
        }
    }
    
    if left_pressed && !left_active
    {
        left_active := 1
        Send "{Blind}{a down}"
    }
}

*$w::
{    
    global up_pressed, down_pressed, up_active, down_active, last_direction
    up_pressed := 1
    last_direction := "w"
    
    if down_active 
    {
        down_active := 0
        Send "{Blind}{s up}"
    }
    if !up_active 
    {
        up_active := 1
        Send "{Blind}{w down}"
    }
}

*$w up::
{    
    global up_pressed, down_pressed, up_active, down_active, last_direction
    up_pressed := 0
    
    if up_active
    {
        up_active := 0
        Send "{Blind}{w up}"
        if (last_direction == "w")
        {
            Send "{Blind}{s down}"
            Sleep 10
            Send "{Blind}{s up}"
        }
    }
    if down_pressed && !down_active 
    {
        down_active := 1
        Send "{Blind}{s down}"
    }
}

*$s::
{    
    global up_pressed, down_pressed, up_active, down_active, last_direction
    down_pressed := 1
    last_direction := "s"
    
    if up_active 
    {
        up_active := 0
        Send "{Blind}{w up}"
    }
    if !down_active 
    {
        down_active := 1
        Send "{Blind}{s down}"
    }
}

*$s up::
{    
    global up_pressed, down_pressed, up_active, down_active, last_direction
    down_pressed := 0
    
    if down_active 
    {
        down_active := 0
        Send "{Blind}{s up}"
        if (last_direction == "s")
        {
            Send "{Blind}{w down}"
            Sleep 10
            Send "{Blind}{w up}"
        }
    }
    if up_pressed && !up_active 
    {
        up_active := 1
        Send "{Blind}{w down}"
    }
}