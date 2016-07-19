on run {profile,helperProfile,cmd}
    tell application "iTerm"
        activate
        set _Windows to windows
        copy windows to _Windows
        set hasVimWindow to false
        set hasHelperWindow to false
        repeat with aWindow in _Windows
            if name of aWindow contains profile then
                set vimWindow to aWindow
                set hasVimWindow to true
            end if
            if name of aWindow contains helperProfile then
                set helperWindow to aWindow
                set hasHelperWindow to true
            end if
        end repeat
        if not hasVimWindow then
            set vimWindow to (create window with profile profile)
            tell current session of vimWindow to write text cmd
        else
            --这种方式运行有点慢，但是不用建帮助窗口
            do shell script cmd
        end if
        --else if not hasHelperWindow then
        --    set helperWindow to (create window with profile helperProfile)
        --    tell current session of helperWindow to write text cmd
        --else
        --    tell current session of helperWindow to write text cmd
        --end if
        select vimWindow
    end tell
end run
