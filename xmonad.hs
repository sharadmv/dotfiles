import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Prompt
import XMonad.Prompt.Man
import XMonad.Prompt.Shell
import XMonad.Prompt.Ssh
import System.IO
import XMonad.Actions.CycleWS

setDefaultCursor xC_left_ptr
 
myManageHook = composeAll
    [ className =? "Gimp"      --> doFloat
    , className =? "Vncviewer" --> doFloat
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

main = do
    {-xmproc <- spawnPipe "xscreensaver -nosplash"-}
    {-xmproc <- spawnPipe "nautilus -n &"-}
    {-xmproc <- spawnPipe "~/.killxmobar.sh; ~/.cabal/bin/xmobar ~/.xmobarrc"-}

    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook -- make sure to include myManageHook definition from above
                        <+> manageHook defaultConfig
        , layoutHook = customLayout
        , modMask = mod4Mask
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        ,  terminal = "gnome-terminal"
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((mod4Mask, xK_r), shellPrompt defaultXPConfig) --man prompt
        , ((mod4Mask, xK_s), sshPrompt defaultXPConfig) --man prompt
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        , ((mod4Mask .|. shiftMask, xK_l),  nextWS)
        , ((mod4Mask .|. shiftMask, xK_h),  prevWS)
        , ((mod4Mask .|. shiftMask, xK_Up),    shiftToPrev)
        , ((mod4Mask,               xK_Right), nextScreen)
        , ((mod4Mask,               xK_Left),  prevScreen)
        , ((mod4Mask .|. shiftMask, xK_Right), shiftNextScreen)
        , ((mod4Mask .|. shiftMask, xK_Left),  shiftPrevScreen)
        , ((mod4Mask,               xK_Tab),     toggleWS)
        , ((mod4Mask .|. shiftMask, xK_b), sendMessage ToggleStruts)
        , ((0, 0x1008ff11), spawn "amixer set Master 2-")
        , ((0, 0x1008ff13), spawn "amixer set Master 2+")
        , ((0, 0x1008ff12), spawn "amixer set Master toggle")
        ]

