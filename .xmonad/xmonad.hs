import XMonad
import System.IO
import System.Exit
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.SetWMName
import XMonad.Prompt
import XMonad.Prompt.Man
import XMonad.Prompt.Shell
import XMonad.Prompt.Ssh
import XMonad.Prompt.RunOrRaise (runOrRaisePrompt)
import XMonad.Prompt.AppendFile (appendFilePrompt)
import XMonad.Hooks.EwmhDesktops
import System.IO
import XMonad.Actions.CycleWS
import XMonad.Actions.SimpleDate
import XMonad.Actions.Search(google, wikipedia, selectSearchBrowser, promptSearchBrowser)
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.FadeInactive
import qualified Data.Map as M
import qualified XMonad.StackSet as W

myManageHook = composeAll
    [ className =? "Gimp"      --> doFloat
    , className =? "Vncviewer" --> doFloat
    , className =? "Wine" --> doCenterFloat
    ]
 
customLayout = avoidStruts $ smartBorders tiled ||| Mirror tiled ||| noBorders Full  
    where  
      -- default tiling algorithm partitions the screen into two panes  
      tiled = Tall nmaster delta ratio  
      -- The default number of windows in the master pane  
      nmaster = 1  
      -- Default proportion of screen occupied by master pane  
      ratio = 1/2  
      -- Percent of screen to increment by when resizing panes  
      delta = 3/100


myXmonadBar = "sleep 0.1; dzen2 -x '0' -h '16' -w '500' -ta 'l' -fg '#FFFFFF' -bg '#1B1D1E'"
myStatusBar = "conky -c /home/sharadmv/.xmonad/.conky_dzen | dzen2 -h '16' -ta 'r' -bg '#1B1D1E' -fg '#FFFFFF' -y '0' -ta center"
myTrayer = "killall trayer; trayer --edge top --align right --widthtype request --SetDockType true --SetPartialStrut true --transparent true --alpha 0 --tint 0x1B1D1E --expand true --heighttype pixel --height 16"
myBitmapsDir = "/home/sharadmv/.xmonad/dzen2"

--Bar
myLogHook :: Handle -> X ()
myLogHook h = dynamicLogWithPP $ defaultPP
    -- display current workspace as darkgrey on light grey (opposite of 
    -- default colors)
    { ppCurrent         = dzenColor "#303030" "#909090" . pad 

    -- display other workspaces which contain windows as a brighter grey
    , ppHidden          = dzenColor "#909090" "" . pad 

    -- display other workspaces with no windows as a normal grey
    , ppHiddenNoWindows = dzenColor "#606060" "" . pad 

    -- display the current layout as a brighter grey
    , ppLayout          = dzenColor "#909090" "" . pad 

    -- if a window on a hidden workspace needs my attention, color it so
    , ppUrgent          = dzenColor "#ff0000" "" . pad . dzenStrip

    -- shorten if it goes over 100 characters
    , ppTitle           = shorten 100  

    -- no separator between workspaces
    , ppWsSep           = ""

    -- put a few spaces between each object
    , ppSep             = "  "

    -- output to the handle we were given as an argument
    , ppOutput          = hPutStrLn h
    }
 
keys' conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
        [ 
        --Music
          ((controlMask .|. shiftMask, xK_Left      ), spawn "music prev")
        , ((controlMask .|. shiftMask, xK_Right     ), spawn "music next")
        , ((controlMask .|. shiftMask, xK_space     ), spawn "music toggle")
        , ((controlMask .|. shiftMask, xK_Up        ), spawn "music volup")
        , ((controlMask .|. shiftMask, xK_Down      ), spawn "music voldown")
        , ((0, 0x1008ff11), spawn "amixer set Master 2-")
        , ((0, 0x1008ff13), spawn "amixer set Master 2+")
        , ((0, 0x1008ff12), spawn "amixer set Master toggle")
        --Prompts
        , ((modMask .|. shiftMask, xK_z             ), spawn "xscreensaver-command -lock")
        , ((modMask, xK_r                           ), shellPrompt greenXPConfig) --man prompt
        , ((modMask, xK_s                           ), selectSearchBrowser "chrome" google) --man prompt
        , ((modMask, xK_g                           ), promptSearchBrowser greenXPConfig "chrome" google) --man prompt
        --Layout control
        , ((modMask .|. shiftMask,      xK_l             ), nextWS)
        , ((modMask .|. shiftMask,      xK_h             ), prevWS)
        , ((modMask .|. shiftMask,      xK_Up            ), shiftToPrev)
        , ((modMask,                    xK_Right         ), nextScreen)
        , ((modMask,                    xK_Left     ), prevScreen)
        , ((modMask,                    xK_d        ), date)
        , ((modMask .|. shiftMask,      xK_Right    ), shiftNextScreen)
        , ((modMask .|. shiftMask,      xK_Left     ), shiftPrevScreen)
        , ((modMask,                    xK_Tab      ), toggleWS)
        , ((modMask .|. shiftMask,      xK_Return   ), spawn $ XMonad.terminal conf)
        , ((modMask .|. shiftMask,      xK_b        ), sendMessage ToggleStruts)
        , ((modMask,                    xK_space    ), sendMessage NextLayout)
        , ((modMask .|. shiftMask,      xK_space    ), setLayout $ XMonad.layoutHook conf)          -- reset layout on current desktop to default
        , ((modMask,                    xK_b        ), sendMessage ToggleStruts)
        , ((modMask,                    xK_n        ), refresh)
        , ((modMask,                    xK_j        ), windows W.focusDown)
        , ((modMask,                    xK_k        ), windows W.focusUp  )
        , ((modMask .|. shiftMask,      xK_j        ), windows W.swapDown)                          -- swap the focused window with the next window
        , ((modMask .|. shiftMask,      xK_k        ), windows W.swapUp)                            -- swap the focused window with the previous window
        , ((modMask,                    xK_Return   ), windows W.swapMaster)
        , ((modMask,                    xK_t        ), withFocused $ windows . W.sink)              -- Push window back into tiling
        , ((modMask,                    xK_h        ), sendMessage Shrink)                          -- %! Shrink a master area
        , ((modMask,                    xK_l        ), sendMessage Expand)                          -- %! Expand a master area
        , ((modMask,                    xK_comma    ), sendMessage (IncMasterN 1))
        , ((modMask,                    xK_period   ), sendMessage (IncMasterN (-1)))
        , ((modMask,                    xK_q        ), spawn "killall conky dzen2 && /home/sharadmv/.cabal/bin/xmonad --recompile && /home/sharadmv/.cabal/bin/xmonad --restart")
        , ((modMask .|. shiftMask,      xK_c        ), kill)
        , ((modMask .|. shiftMask,      xK_q        ), io (exitWith ExitSuccess))
        --Screenshot
        , ((controlMask, xK_Print                   ), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print                             ), spawn "scrot")
        ]
        ++
        -- mod-[1..9] %! Switch to workspace N
        -- mod-shift-[1..9] %! Move client to workspace N
        [((m .|. modMask, k), windows $ f i)
            | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
            , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
        ++
        [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e] [1, 0]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

main = do
    dRight <- spawnPipe myStatusBar
    tray <- spawnPipe myTrayer  
    dLeft <- spawnPipe myXmonadBar
    xmonad  $ withUrgencyHook dzenUrgencyHook { args = ["-bg", "darkgreen", "-xs", "1"] }
            $ defaultConfig
        { manageHook = manageDocks <+> myManageHook -- make sure to include myManageHook definition from above
                        <+> manageHook defaultConfig
        , layoutHook = customLayout
        , modMask = mod4Mask
        , keys = keys'
        , handleEventHook = fullscreenEventHook
        , startupHook = setWMName "LG3D"
        , logHook = myLogHook dLeft >> fadeInactiveLogHook 0xdddddddd
        ,  terminal = "terminator"
        } 

