; ======================================================================================================================
; This script moves my mouse over the Rocket Order Shortcut of UltraViner
    ; The coordinates are based on 2 1440P Monitors with UV in the upper left corner
    ; This is the location on my home PC as 2025-01-14

    Ultraviner(button_name := "Dismiss_Alert")
    {
        ; Set the name for the Ultraviner window
        uv_window_name := "Ultraviner - Screen 1"

        ; Define offsets based on button name using Switch
        switch button_name
        {
            case "Dismiss_Alert":
                button_x_offset := 95
                button_y_offset := 237
            case "Rocket_Order":
                button_x_offset := 359
                button_y_offset := 401
            default:
                ; Default values if the button name doesn't match
                button_x_offset := 95
                button_y_offset := 237
        }
            
        CoordMode "Mouse", "Screen"
        ; Get mouse current position and window
        MouseGetPos &xpos, &ypos
        o_winid := WinGetID('A') ; Save the current window ID
    
        ; Get windows position of Ultraviner Client
        WinGetPos &win_x, &win_y, &win_width, &win_height, uv_window_name
    
        
        ; Click on the Dismiss Alert Button
        WinActivate(uv_window_name)
        Send "{Esc}"
        DllCall("SetCursorPos", "int", win_x + button_x_offset, "int", win_y + button_y_offset)
        MouseClick("Left")
    
        ; Return mouse to original location
        DllCall("SetCursorPos", "int", xpos, "int", ypos)
        Sleep 200
        WinActivate(o_winid)
    }


            ScrollLock::Ultraviner("Rocket_Order")
            Pause::Ultraviner("Dismiss_Alert")
