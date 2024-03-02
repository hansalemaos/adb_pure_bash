#!/usr/bin/env sh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
yesnofile=$SCRIPTPATH/yesno.sh

if (sh "$yesnofile" "ACTION_DOWN"); then
    input keyevent ACTION_DOWN
fi

if (sh "$yesnofile" "ACTION_MULTIPLE"); then
    input keyevent ACTION_MULTIPLE
fi

if (sh "$yesnofile" "ACTION_UP"); then
    input keyevent ACTION_UP
fi

if (sh "$yesnofile" "FLAG_CANCELED"); then
    input keyevent FLAG_CANCELED
fi

if (sh "$yesnofile" "FLAG_CANCELED_LONG_PRESS"); then
    input keyevent FLAG_CANCELED_LONG_PRESS
fi

if (sh "$yesnofile" "FLAG_EDITOR_ACTION"); then
    input keyevent FLAG_EDITOR_ACTION
fi

if (sh "$yesnofile" "FLAG_FALLBACK"); then
    input keyevent FLAG_FALLBACK
fi

if (sh "$yesnofile" "FLAG_FROM_SYSTEM"); then
    input keyevent FLAG_FROM_SYSTEM
fi

if (sh "$yesnofile" "FLAG_KEEP_TOUCH_MODE"); then
    input keyevent FLAG_KEEP_TOUCH_MODE
fi

if (sh "$yesnofile" "FLAG_LONG_PRESS"); then
    input keyevent FLAG_LONG_PRESS
fi

if (sh "$yesnofile" "FLAG_SOFT_KEYBOARD"); then
    input keyevent FLAG_SOFT_KEYBOARD
fi

if (sh "$yesnofile" "FLAG_TRACKING"); then
    input keyevent FLAG_TRACKING
fi

if (sh "$yesnofile" "FLAG_VIRTUAL_HARD_KEY"); then
    input keyevent FLAG_VIRTUAL_HARD_KEY
fi

if (sh "$yesnofile" "KEYCODE_0"); then
    input keyevent KEYCODE_0
fi

if (sh "$yesnofile" "KEYCODE_1"); then
    input keyevent KEYCODE_1
fi

if (sh "$yesnofile" "KEYCODE_11"); then
    input keyevent KEYCODE_11
fi

if (sh "$yesnofile" "KEYCODE_12"); then
    input keyevent KEYCODE_12
fi

if (sh "$yesnofile" "KEYCODE_2"); then
    input keyevent KEYCODE_2
fi

if (sh "$yesnofile" "KEYCODE_3"); then
    input keyevent KEYCODE_3
fi

if (sh "$yesnofile" "KEYCODE_3D_MODE"); then
    input keyevent KEYCODE_3D_MODE
fi

if (sh "$yesnofile" "KEYCODE_4"); then
    input keyevent KEYCODE_4
fi

if (sh "$yesnofile" "KEYCODE_5"); then
    input keyevent KEYCODE_5
fi

if (sh "$yesnofile" "KEYCODE_6"); then
    input keyevent KEYCODE_6
fi

if (sh "$yesnofile" "KEYCODE_7"); then
    input keyevent KEYCODE_7
fi

if (sh "$yesnofile" "KEYCODE_8"); then
    input keyevent KEYCODE_8
fi

if (sh "$yesnofile" "KEYCODE_9"); then
    input keyevent KEYCODE_9
fi

if (sh "$yesnofile" "KEYCODE_A"); then
    input keyevent KEYCODE_A
fi

if (sh "$yesnofile" "KEYCODE_ALL_APPS"); then
    input keyevent KEYCODE_ALL_APPS
fi

if (sh "$yesnofile" "KEYCODE_ALT_LEFT"); then
    input keyevent KEYCODE_ALT_LEFT
fi

if (sh "$yesnofile" "KEYCODE_ALT_RIGHT"); then
    input keyevent KEYCODE_ALT_RIGHT
fi

if (sh "$yesnofile" "KEYCODE_APOSTROPHE"); then
    input keyevent KEYCODE_APOSTROPHE
fi

if (sh "$yesnofile" "KEYCODE_APP_SWITCH"); then
    input keyevent KEYCODE_APP_SWITCH
fi

if (sh "$yesnofile" "KEYCODE_ASSIST"); then
    input keyevent KEYCODE_ASSIST
fi

if (sh "$yesnofile" "KEYCODE_AT"); then
    input keyevent KEYCODE_AT
fi

if (sh "$yesnofile" "KEYCODE_AVR_INPUT"); then
    input keyevent KEYCODE_AVR_INPUT
fi

if (sh "$yesnofile" "KEYCODE_AVR_POWER"); then
    input keyevent KEYCODE_AVR_POWER
fi

if (sh "$yesnofile" "KEYCODE_B"); then
    input keyevent KEYCODE_B
fi

if (sh "$yesnofile" "KEYCODE_BACK"); then
    input keyevent KEYCODE_BACK
fi

if (sh "$yesnofile" "KEYCODE_BACKSLASH"); then
    input keyevent KEYCODE_BACKSLASH
fi

if (sh "$yesnofile" "KEYCODE_BOOKMARK"); then
    input keyevent KEYCODE_BOOKMARK
fi

if (sh "$yesnofile" "KEYCODE_BREAK"); then
    input keyevent KEYCODE_BREAK
fi

if (sh "$yesnofile" "KEYCODE_BRIGHTNESS_DOWN"); then
    input keyevent KEYCODE_BRIGHTNESS_DOWN
fi

if (sh "$yesnofile" "KEYCODE_BRIGHTNESS_UP"); then
    input keyevent KEYCODE_BRIGHTNESS_UP
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_1"); then
    input keyevent KEYCODE_BUTTON_1
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_10"); then
    input keyevent KEYCODE_BUTTON_10
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_11"); then
    input keyevent KEYCODE_BUTTON_11
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_12"); then
    input keyevent KEYCODE_BUTTON_12
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_13"); then
    input keyevent KEYCODE_BUTTON_13
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_14"); then
    input keyevent KEYCODE_BUTTON_14
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_15"); then
    input keyevent KEYCODE_BUTTON_15
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_16"); then
    input keyevent KEYCODE_BUTTON_16
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_2"); then
    input keyevent KEYCODE_BUTTON_2
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_3"); then
    input keyevent KEYCODE_BUTTON_3
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_4"); then
    input keyevent KEYCODE_BUTTON_4
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_5"); then
    input keyevent KEYCODE_BUTTON_5
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_6"); then
    input keyevent KEYCODE_BUTTON_6
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_7"); then
    input keyevent KEYCODE_BUTTON_7
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_8"); then
    input keyevent KEYCODE_BUTTON_8
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_9"); then
    input keyevent KEYCODE_BUTTON_9
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_A"); then
    input keyevent KEYCODE_BUTTON_A
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_B"); then
    input keyevent KEYCODE_BUTTON_B
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_C"); then
    input keyevent KEYCODE_BUTTON_C
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_L1"); then
    input keyevent KEYCODE_BUTTON_L1
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_L2"); then
    input keyevent KEYCODE_BUTTON_L2
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_MODE"); then
    input keyevent KEYCODE_BUTTON_MODE
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_R1"); then
    input keyevent KEYCODE_BUTTON_R1
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_R2"); then
    input keyevent KEYCODE_BUTTON_R2
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_SELECT"); then
    input keyevent KEYCODE_BUTTON_SELECT
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_START"); then
    input keyevent KEYCODE_BUTTON_START
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_THUMBL"); then
    input keyevent KEYCODE_BUTTON_THUMBL
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_THUMBR"); then
    input keyevent KEYCODE_BUTTON_THUMBR
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_X"); then
    input keyevent KEYCODE_BUTTON_X
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_Y"); then
    input keyevent KEYCODE_BUTTON_Y
fi

if (sh "$yesnofile" "KEYCODE_BUTTON_Z"); then
    input keyevent KEYCODE_BUTTON_Z
fi

if (sh "$yesnofile" "KEYCODE_C"); then
    input keyevent KEYCODE_C
fi

if (sh "$yesnofile" "KEYCODE_CALCULATOR"); then
    input keyevent KEYCODE_CALCULATOR
fi

if (sh "$yesnofile" "KEYCODE_CALENDAR"); then
    input keyevent KEYCODE_CALENDAR
fi

if (sh "$yesnofile" "KEYCODE_CALL"); then
    input keyevent KEYCODE_CALL
fi

if (sh "$yesnofile" "KEYCODE_CAMERA"); then
    input keyevent KEYCODE_CAMERA
fi

if (sh "$yesnofile" "KEYCODE_CAPS_LOCK"); then
    input keyevent KEYCODE_CAPS_LOCK
fi

if (sh "$yesnofile" "KEYCODE_CAPTIONS"); then
    input keyevent KEYCODE_CAPTIONS
fi

if (sh "$yesnofile" "KEYCODE_CHANNEL_DOWN"); then
    input keyevent KEYCODE_CHANNEL_DOWN
fi

if (sh "$yesnofile" "KEYCODE_CHANNEL_UP"); then
    input keyevent KEYCODE_CHANNEL_UP
fi

if (sh "$yesnofile" "KEYCODE_CLEAR"); then
    input keyevent KEYCODE_CLEAR
fi

if (sh "$yesnofile" "KEYCODE_COMMA"); then
    input keyevent KEYCODE_COMMA
fi

if (sh "$yesnofile" "KEYCODE_CONTACTS"); then
    input keyevent KEYCODE_CONTACTS
fi

if (sh "$yesnofile" "KEYCODE_COPY"); then
    input keyevent KEYCODE_COPY
fi

if (sh "$yesnofile" "KEYCODE_CTRL_LEFT"); then
    input keyevent KEYCODE_CTRL_LEFT
fi

if (sh "$yesnofile" "KEYCODE_CTRL_RIGHT"); then
    input keyevent KEYCODE_CTRL_RIGHT
fi

if (sh "$yesnofile" "KEYCODE_CUT"); then
    input keyevent KEYCODE_CUT
fi

if (sh "$yesnofile" "KEYCODE_D"); then
    input keyevent KEYCODE_D
fi

if (sh "$yesnofile" "KEYCODE_DEL"); then
    input keyevent KEYCODE_DEL
fi

if (sh "$yesnofile" "KEYCODE_DEMO_APP_1"); then
    input keyevent KEYCODE_DEMO_APP_1
fi

if (sh "$yesnofile" "KEYCODE_DEMO_APP_2"); then
    input keyevent KEYCODE_DEMO_APP_2
fi

if (sh "$yesnofile" "KEYCODE_DEMO_APP_3"); then
    input keyevent KEYCODE_DEMO_APP_3
fi

if (sh "$yesnofile" "KEYCODE_DEMO_APP_4"); then
    input keyevent KEYCODE_DEMO_APP_4
fi

if (sh "$yesnofile" "KEYCODE_DPAD_CENTER"); then
    input keyevent KEYCODE_DPAD_CENTER
fi

if (sh "$yesnofile" "KEYCODE_DPAD_DOWN"); then
    input keyevent KEYCODE_DPAD_DOWN
fi

if (sh "$yesnofile" "KEYCODE_DPAD_DOWN_LEFT"); then
    input keyevent KEYCODE_DPAD_DOWN_LEFT
fi

if (sh "$yesnofile" "KEYCODE_DPAD_DOWN_RIGHT"); then
    input keyevent KEYCODE_DPAD_DOWN_RIGHT
fi

if (sh "$yesnofile" "KEYCODE_DPAD_LEFT"); then
    input keyevent KEYCODE_DPAD_LEFT
fi

if (sh "$yesnofile" "KEYCODE_DPAD_RIGHT"); then
    input keyevent KEYCODE_DPAD_RIGHT
fi

if (sh "$yesnofile" "KEYCODE_DPAD_UP"); then
    input keyevent KEYCODE_DPAD_UP
fi

if (sh "$yesnofile" "KEYCODE_DPAD_UP_LEFT"); then
    input keyevent KEYCODE_DPAD_UP_LEFT
fi

if (sh "$yesnofile" "KEYCODE_DPAD_UP_RIGHT"); then
    input keyevent KEYCODE_DPAD_UP_RIGHT
fi

if (sh "$yesnofile" "KEYCODE_DVR"); then
    input keyevent KEYCODE_DVR
fi

if (sh "$yesnofile" "KEYCODE_E"); then
    input keyevent KEYCODE_E
fi

if (sh "$yesnofile" "KEYCODE_EISU"); then
    input keyevent KEYCODE_EISU
fi

if (sh "$yesnofile" "KEYCODE_ENDCALL"); then
    input keyevent KEYCODE_ENDCALL
fi

if (sh "$yesnofile" "KEYCODE_ENTER"); then
    input keyevent KEYCODE_ENTER
fi

if (sh "$yesnofile" "KEYCODE_ENVELOPE"); then
    input keyevent KEYCODE_ENVELOPE
fi

if (sh "$yesnofile" "KEYCODE_EQUALS"); then
    input keyevent KEYCODE_EQUALS
fi

if (sh "$yesnofile" "KEYCODE_ESCAPE"); then
    input keyevent KEYCODE_ESCAPE
fi

if (sh "$yesnofile" "KEYCODE_EXPLORER"); then
    input keyevent KEYCODE_EXPLORER
fi

if (sh "$yesnofile" "KEYCODE_F"); then
    input keyevent KEYCODE_F
fi

if (sh "$yesnofile" "KEYCODE_F1"); then
    input keyevent KEYCODE_F1
fi

if (sh "$yesnofile" "KEYCODE_F10"); then
    input keyevent KEYCODE_F10
fi

if (sh "$yesnofile" "KEYCODE_F11"); then
    input keyevent KEYCODE_F11
fi

if (sh "$yesnofile" "KEYCODE_F12"); then
    input keyevent KEYCODE_F12
fi

if (sh "$yesnofile" "KEYCODE_F2"); then
    input keyevent KEYCODE_F2
fi

if (sh "$yesnofile" "KEYCODE_F3"); then
    input keyevent KEYCODE_F3
fi

if (sh "$yesnofile" "KEYCODE_F4"); then
    input keyevent KEYCODE_F4
fi

if (sh "$yesnofile" "KEYCODE_F5"); then
    input keyevent KEYCODE_F5
fi

if (sh "$yesnofile" "KEYCODE_F6"); then
    input keyevent KEYCODE_F6
fi

if (sh "$yesnofile" "KEYCODE_F7"); then
    input keyevent KEYCODE_F7
fi

if (sh "$yesnofile" "KEYCODE_F8"); then
    input keyevent KEYCODE_F8
fi

if (sh "$yesnofile" "KEYCODE_F9"); then
    input keyevent KEYCODE_F9
fi

if (sh "$yesnofile" "KEYCODE_FEATURED_APP_1"); then
    input keyevent KEYCODE_FEATURED_APP_1
fi

if (sh "$yesnofile" "KEYCODE_FEATURED_APP_2"); then
    input keyevent KEYCODE_FEATURED_APP_2
fi

if (sh "$yesnofile" "KEYCODE_FEATURED_APP_3"); then
    input keyevent KEYCODE_FEATURED_APP_3
fi

if (sh "$yesnofile" "KEYCODE_FEATURED_APP_4"); then
    input keyevent KEYCODE_FEATURED_APP_4
fi

if (sh "$yesnofile" "KEYCODE_FOCUS"); then
    input keyevent KEYCODE_FOCUS
fi

if (sh "$yesnofile" "KEYCODE_FORWARD"); then
    input keyevent KEYCODE_FORWARD
fi

if (sh "$yesnofile" "KEYCODE_FORWARD_DEL"); then
    input keyevent KEYCODE_FORWARD_DEL
fi

if (sh "$yesnofile" "KEYCODE_FUNCTION"); then
    input keyevent KEYCODE_FUNCTION
fi

if (sh "$yesnofile" "KEYCODE_G"); then
    input keyevent KEYCODE_G
fi

if (sh "$yesnofile" "KEYCODE_GRAVE"); then
    input keyevent KEYCODE_GRAVE
fi

if (sh "$yesnofile" "KEYCODE_GUIDE"); then
    input keyevent KEYCODE_GUIDE
fi

if (sh "$yesnofile" "KEYCODE_H"); then
    input keyevent KEYCODE_H
fi

if (sh "$yesnofile" "KEYCODE_HEADSETHOOK"); then
    input keyevent KEYCODE_HEADSETHOOK
fi

if (sh "$yesnofile" "KEYCODE_HELP"); then
    input keyevent KEYCODE_HELP
fi

if (sh "$yesnofile" "KEYCODE_HENKAN"); then
    input keyevent KEYCODE_HENKAN
fi

if (sh "$yesnofile" "KEYCODE_HOME"); then
    input keyevent KEYCODE_HOME
fi

if (sh "$yesnofile" "KEYCODE_I"); then
    input keyevent KEYCODE_I
fi

if (sh "$yesnofile" "KEYCODE_INFO"); then
    input keyevent KEYCODE_INFO
fi

if (sh "$yesnofile" "KEYCODE_INSERT"); then
    input keyevent KEYCODE_INSERT
fi

if (sh "$yesnofile" "KEYCODE_J"); then
    input keyevent KEYCODE_J
fi

if (sh "$yesnofile" "KEYCODE_K"); then
    input keyevent KEYCODE_K
fi

if (sh "$yesnofile" "KEYCODE_KANA"); then
    input keyevent KEYCODE_KANA
fi

if (sh "$yesnofile" "KEYCODE_KATAKANA_HIRAGANA"); then
    input keyevent KEYCODE_KATAKANA_HIRAGANA
fi

if (sh "$yesnofile" "KEYCODE_KEYBOARD_BACKLIGHT_DOWN"); then
    input keyevent KEYCODE_KEYBOARD_BACKLIGHT_DOWN
fi

if (sh "$yesnofile" "KEYCODE_KEYBOARD_BACKLIGHT_TOGGLE"); then
    input keyevent KEYCODE_KEYBOARD_BACKLIGHT_TOGGLE
fi

if (sh "$yesnofile" "KEYCODE_KEYBOARD_BACKLIGHT_UP"); then
    input keyevent KEYCODE_KEYBOARD_BACKLIGHT_UP
fi

if (sh "$yesnofile" "KEYCODE_L"); then
    input keyevent KEYCODE_L
fi

if (sh "$yesnofile" "KEYCODE_LANGUAGE_SWITCH"); then
    input keyevent KEYCODE_LANGUAGE_SWITCH
fi

if (sh "$yesnofile" "KEYCODE_LAST_CHANNEL"); then
    input keyevent KEYCODE_LAST_CHANNEL
fi

if (sh "$yesnofile" "KEYCODE_LEFT_BRACKET"); then
    input keyevent KEYCODE_LEFT_BRACKET
fi

if (sh "$yesnofile" "KEYCODE_M"); then
    input keyevent KEYCODE_M
fi

if (sh "$yesnofile" "KEYCODE_MACRO_1"); then
    input keyevent KEYCODE_MACRO_1
fi

if (sh "$yesnofile" "KEYCODE_MACRO_2"); then
    input keyevent KEYCODE_MACRO_2
fi

if (sh "$yesnofile" "KEYCODE_MACRO_3"); then
    input keyevent KEYCODE_MACRO_3
fi

if (sh "$yesnofile" "KEYCODE_MACRO_4"); then
    input keyevent KEYCODE_MACRO_4
fi

if (sh "$yesnofile" "KEYCODE_MANNER_MODE"); then
    input keyevent KEYCODE_MANNER_MODE
fi

if (sh "$yesnofile" "KEYCODE_MEDIA_AUDIO_TRACK"); then
    input keyevent KEYCODE_MEDIA_AUDIO_TRACK
fi

if (sh "$yesnofile" "KEYCODE_MEDIA_CLOSE"); then
    input keyevent KEYCODE_MEDIA_CLOSE
fi

if (sh "$yesnofile" "KEYCODE_MEDIA_EJECT"); then
    input keyevent KEYCODE_MEDIA_EJECT
fi

if (sh "$yesnofile" "KEYCODE_MEDIA_FAST_FORWARD"); then
    input keyevent KEYCODE_MEDIA_FAST_FORWARD
fi

if (sh "$yesnofile" "KEYCODE_MEDIA_NEXT"); then
    input keyevent KEYCODE_MEDIA_NEXT
fi

if (sh "$yesnofile" "KEYCODE_MEDIA_PAUSE"); then
    input keyevent KEYCODE_MEDIA_PAUSE
fi

if (sh "$yesnofile" "KEYCODE_MEDIA_PLAY"); then
    input keyevent KEYCODE_MEDIA_PLAY
fi

if (sh "$yesnofile" "KEYCODE_MEDIA_PLAY_PAUSE"); then
    input keyevent KEYCODE_MEDIA_PLAY_PAUSE
fi

if (sh "$yesnofile" "KEYCODE_MEDIA_PREVIOUS"); then
    input keyevent KEYCODE_MEDIA_PREVIOUS
fi

if (sh "$yesnofile" "KEYCODE_MEDIA_RECORD"); then
    input keyevent KEYCODE_MEDIA_RECORD
fi

if (sh "$yesnofile" "KEYCODE_MEDIA_REWIND"); then
    input keyevent KEYCODE_MEDIA_REWIND
fi

if (sh "$yesnofile" "KEYCODE_MEDIA_SKIP_BACKWARD"); then
    input keyevent KEYCODE_MEDIA_SKIP_BACKWARD
fi

if (sh "$yesnofile" "KEYCODE_MEDIA_SKIP_FORWARD"); then
    input keyevent KEYCODE_MEDIA_SKIP_FORWARD
fi

if (sh "$yesnofile" "KEYCODE_MEDIA_STEP_BACKWARD"); then
    input keyevent KEYCODE_MEDIA_STEP_BACKWARD
fi

if (sh "$yesnofile" "KEYCODE_MEDIA_STEP_FORWARD"); then
    input keyevent KEYCODE_MEDIA_STEP_FORWARD
fi

if (sh "$yesnofile" "KEYCODE_MEDIA_STOP"); then
    input keyevent KEYCODE_MEDIA_STOP
fi

if (sh "$yesnofile" "KEYCODE_MEDIA_TOP_MENU"); then
    input keyevent KEYCODE_MEDIA_TOP_MENU
fi

if (sh "$yesnofile" "KEYCODE_MENU"); then
    input keyevent KEYCODE_MENU
fi

if (sh "$yesnofile" "KEYCODE_META_LEFT"); then
    input keyevent KEYCODE_META_LEFT
fi

if (sh "$yesnofile" "KEYCODE_META_RIGHT"); then
    input keyevent KEYCODE_META_RIGHT
fi

if (sh "$yesnofile" "KEYCODE_MINUS"); then
    input keyevent KEYCODE_MINUS
fi

if (sh "$yesnofile" "KEYCODE_MOVE_END"); then
    input keyevent KEYCODE_MOVE_END
fi

if (sh "$yesnofile" "KEYCODE_MOVE_HOME"); then
    input keyevent KEYCODE_MOVE_HOME
fi

if (sh "$yesnofile" "KEYCODE_MUHENKAN"); then
    input keyevent KEYCODE_MUHENKAN
fi

if (sh "$yesnofile" "KEYCODE_MUSIC"); then
    input keyevent KEYCODE_MUSIC
fi

if (sh "$yesnofile" "KEYCODE_MUTE"); then
    input keyevent KEYCODE_MUTE
fi

if (sh "$yesnofile" "KEYCODE_N"); then
    input keyevent KEYCODE_N
fi

if (sh "$yesnofile" "KEYCODE_NAVIGATE_IN"); then
    input keyevent KEYCODE_NAVIGATE_IN
fi

if (sh "$yesnofile" "KEYCODE_NAVIGATE_NEXT"); then
    input keyevent KEYCODE_NAVIGATE_NEXT
fi

if (sh "$yesnofile" "KEYCODE_NAVIGATE_OUT"); then
    input keyevent KEYCODE_NAVIGATE_OUT
fi

if (sh "$yesnofile" "KEYCODE_NAVIGATE_PREVIOUS"); then
    input keyevent KEYCODE_NAVIGATE_PREVIOUS
fi

if (sh "$yesnofile" "KEYCODE_NOTIFICATION"); then
    input keyevent KEYCODE_NOTIFICATION
fi

if (sh "$yesnofile" "KEYCODE_NUM"); then
    input keyevent KEYCODE_NUM
fi

if (sh "$yesnofile" "KEYCODE_NUMPAD_0"); then
    input keyevent KEYCODE_NUMPAD_0
fi

if (sh "$yesnofile" "KEYCODE_NUMPAD_1"); then
    input keyevent KEYCODE_NUMPAD_1
fi

if (sh "$yesnofile" "KEYCODE_NUMPAD_2"); then
    input keyevent KEYCODE_NUMPAD_2
fi

if (sh "$yesnofile" "KEYCODE_NUMPAD_3"); then
    input keyevent KEYCODE_NUMPAD_3
fi

if (sh "$yesnofile" "KEYCODE_NUMPAD_4"); then
    input keyevent KEYCODE_NUMPAD_4
fi

if (sh "$yesnofile" "KEYCODE_NUMPAD_5"); then
    input keyevent KEYCODE_NUMPAD_5
fi

if (sh "$yesnofile" "KEYCODE_NUMPAD_6"); then
    input keyevent KEYCODE_NUMPAD_6
fi

if (sh "$yesnofile" "KEYCODE_NUMPAD_7"); then
    input keyevent KEYCODE_NUMPAD_7
fi

if (sh "$yesnofile" "KEYCODE_NUMPAD_8"); then
    input keyevent KEYCODE_NUMPAD_8
fi

if (sh "$yesnofile" "KEYCODE_NUMPAD_9"); then
    input keyevent KEYCODE_NUMPAD_9
fi

if (sh "$yesnofile" "KEYCODE_NUMPAD_ADD"); then
    input keyevent KEYCODE_NUMPAD_ADD
fi

if (sh "$yesnofile" "KEYCODE_NUMPAD_COMMA"); then
    input keyevent KEYCODE_NUMPAD_COMMA
fi

if (sh "$yesnofile" "KEYCODE_NUMPAD_DIVIDE"); then
    input keyevent KEYCODE_NUMPAD_DIVIDE
fi

if (sh "$yesnofile" "KEYCODE_NUMPAD_DOT"); then
    input keyevent KEYCODE_NUMPAD_DOT
fi

if (sh "$yesnofile" "KEYCODE_NUMPAD_ENTER"); then
    input keyevent KEYCODE_NUMPAD_ENTER
fi

if (sh "$yesnofile" "KEYCODE_NUMPAD_EQUALS"); then
    input keyevent KEYCODE_NUMPAD_EQUALS
fi

if (sh "$yesnofile" "KEYCODE_NUMPAD_LEFT_PAREN"); then
    input keyevent KEYCODE_NUMPAD_LEFT_PAREN
fi

if (sh "$yesnofile" "KEYCODE_NUMPAD_MULTIPLY"); then
    input keyevent KEYCODE_NUMPAD_MULTIPLY
fi

if (sh "$yesnofile" "KEYCODE_NUMPAD_RIGHT_PAREN"); then
    input keyevent KEYCODE_NUMPAD_RIGHT_PAREN
fi

if (sh "$yesnofile" "KEYCODE_NUMPAD_SUBTRACT"); then
    input keyevent KEYCODE_NUMPAD_SUBTRACT
fi

if (sh "$yesnofile" "KEYCODE_NUM_LOCK"); then
    input keyevent KEYCODE_NUM_LOCK
fi

if (sh "$yesnofile" "KEYCODE_O"); then
    input keyevent KEYCODE_O
fi

if (sh "$yesnofile" "KEYCODE_P"); then
    input keyevent KEYCODE_P
fi

if (sh "$yesnofile" "KEYCODE_PAGE_DOWN"); then
    input keyevent KEYCODE_PAGE_DOWN
fi

if (sh "$yesnofile" "KEYCODE_PAGE_UP"); then
    input keyevent KEYCODE_PAGE_UP
fi

if (sh "$yesnofile" "KEYCODE_PAIRING"); then
    input keyevent KEYCODE_PAIRING
fi

if (sh "$yesnofile" "KEYCODE_PASTE"); then
    input keyevent KEYCODE_PASTE
fi

if (sh "$yesnofile" "KEYCODE_PERIOD"); then
    input keyevent KEYCODE_PERIOD
fi

if (sh "$yesnofile" "KEYCODE_PICTSYMBOLS"); then
    input keyevent KEYCODE_PICTSYMBOLS
fi

if (sh "$yesnofile" "KEYCODE_PLUS"); then
    input keyevent KEYCODE_PLUS
fi

if (sh "$yesnofile" "KEYCODE_POUND"); then
    input keyevent KEYCODE_POUND
fi

if (sh "$yesnofile" "KEYCODE_POWER"); then
    input keyevent KEYCODE_POWER
fi

if (sh "$yesnofile" "KEYCODE_PROFILE_SWITCH"); then
    input keyevent KEYCODE_PROFILE_SWITCH
fi

if (sh "$yesnofile" "KEYCODE_PROG_BLUE"); then
    input keyevent KEYCODE_PROG_BLUE
fi

if (sh "$yesnofile" "KEYCODE_PROG_GREEN"); then
    input keyevent KEYCODE_PROG_GREEN
fi

if (sh "$yesnofile" "KEYCODE_PROG_RED"); then
    input keyevent KEYCODE_PROG_RED
fi

if (sh "$yesnofile" "KEYCODE_PROG_YELLOW"); then
    input keyevent KEYCODE_PROG_YELLOW
fi

if (sh "$yesnofile" "KEYCODE_Q"); then
    input keyevent KEYCODE_Q
fi

if (sh "$yesnofile" "KEYCODE_R"); then
    input keyevent KEYCODE_R
fi

if (sh "$yesnofile" "KEYCODE_RECENT_APPS"); then
    input keyevent KEYCODE_RECENT_APPS
fi

if (sh "$yesnofile" "KEYCODE_REFRESH"); then
    input keyevent KEYCODE_REFRESH
fi

if (sh "$yesnofile" "KEYCODE_RIGHT_BRACKET"); then
    input keyevent KEYCODE_RIGHT_BRACKET
fi

if (sh "$yesnofile" "KEYCODE_RO"); then
    input keyevent KEYCODE_RO
fi

if (sh "$yesnofile" "KEYCODE_S"); then
    input keyevent KEYCODE_S
fi

if (sh "$yesnofile" "KEYCODE_SCROLL_LOCK"); then
    input keyevent KEYCODE_SCROLL_LOCK
fi

if (sh "$yesnofile" "KEYCODE_SEARCH"); then
    input keyevent KEYCODE_SEARCH
fi

if (sh "$yesnofile" "KEYCODE_SEMICOLON"); then
    input keyevent KEYCODE_SEMICOLON
fi

if (sh "$yesnofile" "KEYCODE_SETTINGS"); then
    input keyevent KEYCODE_SETTINGS
fi

if (sh "$yesnofile" "KEYCODE_SHIFT_LEFT"); then
    input keyevent KEYCODE_SHIFT_LEFT
fi

if (sh "$yesnofile" "KEYCODE_SHIFT_RIGHT"); then
    input keyevent KEYCODE_SHIFT_RIGHT
fi

if (sh "$yesnofile" "KEYCODE_SLASH"); then
    input keyevent KEYCODE_SLASH
fi

if (sh "$yesnofile" "KEYCODE_SLEEP"); then
    input keyevent KEYCODE_SLEEP
fi

if (sh "$yesnofile" "KEYCODE_SOFT_LEFT"); then
    input keyevent KEYCODE_SOFT_LEFT
fi

if (sh "$yesnofile" "KEYCODE_SOFT_RIGHT"); then
    input keyevent KEYCODE_SOFT_RIGHT
fi

if (sh "$yesnofile" "KEYCODE_SOFT_SLEEP"); then
    input keyevent KEYCODE_SOFT_SLEEP
fi

if (sh "$yesnofile" "KEYCODE_SPACE"); then
    input keyevent KEYCODE_SPACE
fi

if (sh "$yesnofile" "KEYCODE_STAR"); then
    input keyevent KEYCODE_STAR
fi

if (sh "$yesnofile" "KEYCODE_STB_INPUT"); then
    input keyevent KEYCODE_STB_INPUT
fi

if (sh "$yesnofile" "KEYCODE_STB_POWER"); then
    input keyevent KEYCODE_STB_POWER
fi

if (sh "$yesnofile" "KEYCODE_STEM_1"); then
    input keyevent KEYCODE_STEM_1
fi

if (sh "$yesnofile" "KEYCODE_STEM_2"); then
    input keyevent KEYCODE_STEM_2
fi

if (sh "$yesnofile" "KEYCODE_STEM_3"); then
    input keyevent KEYCODE_STEM_3
fi

if (sh "$yesnofile" "KEYCODE_STEM_PRIMARY"); then
    input keyevent KEYCODE_STEM_PRIMARY
fi

if (sh "$yesnofile" "KEYCODE_STYLUS_BUTTON_PRIMARY"); then
    input keyevent KEYCODE_STYLUS_BUTTON_PRIMARY
fi

if (sh "$yesnofile" "KEYCODE_STYLUS_BUTTON_SECONDARY"); then
    input keyevent KEYCODE_STYLUS_BUTTON_SECONDARY
fi

if (sh "$yesnofile" "KEYCODE_STYLUS_BUTTON_TAIL"); then
    input keyevent KEYCODE_STYLUS_BUTTON_TAIL
fi

if (sh "$yesnofile" "KEYCODE_STYLUS_BUTTON_TERTIARY"); then
    input keyevent KEYCODE_STYLUS_BUTTON_TERTIARY
fi

if (sh "$yesnofile" "KEYCODE_SWITCH_CHARSET"); then
    input keyevent KEYCODE_SWITCH_CHARSET
fi

if (sh "$yesnofile" "KEYCODE_SYM"); then
    input keyevent KEYCODE_SYM
fi

if (sh "$yesnofile" "KEYCODE_SYSRQ"); then
    input keyevent KEYCODE_SYSRQ
fi

if (sh "$yesnofile" "KEYCODE_SYSTEM_NAVIGATION_DOWN"); then
    input keyevent KEYCODE_SYSTEM_NAVIGATION_DOWN
fi

if (sh "$yesnofile" "KEYCODE_SYSTEM_NAVIGATION_LEFT"); then
    input keyevent KEYCODE_SYSTEM_NAVIGATION_LEFT
fi

if (sh "$yesnofile" "KEYCODE_SYSTEM_NAVIGATION_RIGHT"); then
    input keyevent KEYCODE_SYSTEM_NAVIGATION_RIGHT
fi

if (sh "$yesnofile" "KEYCODE_SYSTEM_NAVIGATION_UP"); then
    input keyevent KEYCODE_SYSTEM_NAVIGATION_UP
fi

if (sh "$yesnofile" "KEYCODE_T"); then
    input keyevent KEYCODE_T
fi

if (sh "$yesnofile" "KEYCODE_TAB"); then
    input keyevent KEYCODE_TAB
fi

if (sh "$yesnofile" "KEYCODE_THUMBS_DOWN"); then
    input keyevent KEYCODE_THUMBS_DOWN
fi

if (sh "$yesnofile" "KEYCODE_THUMBS_UP"); then
    input keyevent KEYCODE_THUMBS_UP
fi

if (sh "$yesnofile" "KEYCODE_TV"); then
    input keyevent KEYCODE_TV
fi

if (sh "$yesnofile" "KEYCODE_TV_ANTENNA_CABLE"); then
    input keyevent KEYCODE_TV_ANTENNA_CABLE
fi

if (sh "$yesnofile" "KEYCODE_TV_AUDIO_DESCRIPTION"); then
    input keyevent KEYCODE_TV_AUDIO_DESCRIPTION
fi

if (sh "$yesnofile" "KEYCODE_TV_AUDIO_DESCRIPTION_MIX_DOWN"); then
    input keyevent KEYCODE_TV_AUDIO_DESCRIPTION_MIX_DOWN
fi

if (sh "$yesnofile" "KEYCODE_TV_AUDIO_DESCRIPTION_MIX_UP"); then
    input keyevent KEYCODE_TV_AUDIO_DESCRIPTION_MIX_UP
fi

if (sh "$yesnofile" "KEYCODE_TV_CONTENTS_MENU"); then
    input keyevent KEYCODE_TV_CONTENTS_MENU
fi

if (sh "$yesnofile" "KEYCODE_TV_DATA_SERVICE"); then
    input keyevent KEYCODE_TV_DATA_SERVICE
fi

if (sh "$yesnofile" "KEYCODE_TV_INPUT"); then
    input keyevent KEYCODE_TV_INPUT
fi

if (sh "$yesnofile" "KEYCODE_TV_INPUT_COMPONENT_1"); then
    input keyevent KEYCODE_TV_INPUT_COMPONENT_1
fi

if (sh "$yesnofile" "KEYCODE_TV_INPUT_COMPONENT_2"); then
    input keyevent KEYCODE_TV_INPUT_COMPONENT_2
fi

if (sh "$yesnofile" "KEYCODE_TV_INPUT_COMPOSITE_1"); then
    input keyevent KEYCODE_TV_INPUT_COMPOSITE_1
fi

if (sh "$yesnofile" "KEYCODE_TV_INPUT_COMPOSITE_2"); then
    input keyevent KEYCODE_TV_INPUT_COMPOSITE_2
fi

if (sh "$yesnofile" "KEYCODE_TV_INPUT_HDMI_1"); then
    input keyevent KEYCODE_TV_INPUT_HDMI_1
fi

if (sh "$yesnofile" "KEYCODE_TV_INPUT_HDMI_2"); then
    input keyevent KEYCODE_TV_INPUT_HDMI_2
fi

if (sh "$yesnofile" "KEYCODE_TV_INPUT_HDMI_3"); then
    input keyevent KEYCODE_TV_INPUT_HDMI_3
fi

if (sh "$yesnofile" "KEYCODE_TV_INPUT_HDMI_4"); then
    input keyevent KEYCODE_TV_INPUT_HDMI_4
fi

if (sh "$yesnofile" "KEYCODE_TV_INPUT_VGA_1"); then
    input keyevent KEYCODE_TV_INPUT_VGA_1
fi

if (sh "$yesnofile" "KEYCODE_TV_MEDIA_CONTEXT_MENU"); then
    input keyevent KEYCODE_TV_MEDIA_CONTEXT_MENU
fi

if (sh "$yesnofile" "KEYCODE_TV_NETWORK"); then
    input keyevent KEYCODE_TV_NETWORK
fi

if (sh "$yesnofile" "KEYCODE_TV_NUMBER_ENTRY"); then
    input keyevent KEYCODE_TV_NUMBER_ENTRY
fi

if (sh "$yesnofile" "KEYCODE_TV_POWER"); then
    input keyevent KEYCODE_TV_POWER
fi

if (sh "$yesnofile" "KEYCODE_TV_RADIO_SERVICE"); then
    input keyevent KEYCODE_TV_RADIO_SERVICE
fi

if (sh "$yesnofile" "KEYCODE_TV_SATELLITE"); then
    input keyevent KEYCODE_TV_SATELLITE
fi

if (sh "$yesnofile" "KEYCODE_TV_SATELLITE_BS"); then
    input keyevent KEYCODE_TV_SATELLITE_BS
fi

if (sh "$yesnofile" "KEYCODE_TV_SATELLITE_CS"); then
    input keyevent KEYCODE_TV_SATELLITE_CS
fi

if (sh "$yesnofile" "KEYCODE_TV_SATELLITE_SERVICE"); then
    input keyevent KEYCODE_TV_SATELLITE_SERVICE
fi

if (sh "$yesnofile" "KEYCODE_TV_TELETEXT"); then
    input keyevent KEYCODE_TV_TELETEXT
fi

if (sh "$yesnofile" "KEYCODE_TV_TERRESTRIAL_ANALOG"); then
    input keyevent KEYCODE_TV_TERRESTRIAL_ANALOG
fi

if (sh "$yesnofile" "KEYCODE_TV_TERRESTRIAL_DIGITAL"); then
    input keyevent KEYCODE_TV_TERRESTRIAL_DIGITAL
fi

if (sh "$yesnofile" "KEYCODE_TV_TIMER_PROGRAMMING"); then
    input keyevent KEYCODE_TV_TIMER_PROGRAMMING
fi

if (sh "$yesnofile" "KEYCODE_TV_ZOOM_MODE"); then
    input keyevent KEYCODE_TV_ZOOM_MODE
fi

if (sh "$yesnofile" "KEYCODE_U"); then
    input keyevent KEYCODE_U
fi

if (sh "$yesnofile" "KEYCODE_UNKNOWN"); then
    input keyevent KEYCODE_UNKNOWN
fi

if (sh "$yesnofile" "KEYCODE_V"); then
    input keyevent KEYCODE_V
fi

if (sh "$yesnofile" "KEYCODE_VIDEO_APP_1"); then
    input keyevent KEYCODE_VIDEO_APP_1
fi

if (sh "$yesnofile" "KEYCODE_VIDEO_APP_2"); then
    input keyevent KEYCODE_VIDEO_APP_2
fi

if (sh "$yesnofile" "KEYCODE_VIDEO_APP_3"); then
    input keyevent KEYCODE_VIDEO_APP_3
fi

if (sh "$yesnofile" "KEYCODE_VIDEO_APP_4"); then
    input keyevent KEYCODE_VIDEO_APP_4
fi

if (sh "$yesnofile" "KEYCODE_VIDEO_APP_5"); then
    input keyevent KEYCODE_VIDEO_APP_5
fi

if (sh "$yesnofile" "KEYCODE_VIDEO_APP_6"); then
    input keyevent KEYCODE_VIDEO_APP_6
fi

if (sh "$yesnofile" "KEYCODE_VIDEO_APP_7"); then
    input keyevent KEYCODE_VIDEO_APP_7
fi

if (sh "$yesnofile" "KEYCODE_VIDEO_APP_8"); then
    input keyevent KEYCODE_VIDEO_APP_8
fi

if (sh "$yesnofile" "KEYCODE_VOICE_ASSIST"); then
    input keyevent KEYCODE_VOICE_ASSIST
fi

if (sh "$yesnofile" "KEYCODE_VOLUME_DOWN"); then
    input keyevent KEYCODE_VOLUME_DOWN
fi

if (sh "$yesnofile" "KEYCODE_VOLUME_MUTE"); then
    input keyevent KEYCODE_VOLUME_MUTE
fi

if (sh "$yesnofile" "KEYCODE_VOLUME_UP"); then
    input keyevent KEYCODE_VOLUME_UP
fi

if (sh "$yesnofile" "KEYCODE_W"); then
    input keyevent KEYCODE_W
fi

if (sh "$yesnofile" "KEYCODE_WAKEUP"); then
    input keyevent KEYCODE_WAKEUP
fi

if (sh "$yesnofile" "KEYCODE_WINDOW"); then
    input keyevent KEYCODE_WINDOW
fi

if (sh "$yesnofile" "KEYCODE_X"); then
    input keyevent KEYCODE_X
fi

if (sh "$yesnofile" "KEYCODE_Y"); then
    input keyevent KEYCODE_Y
fi

if (sh "$yesnofile" "KEYCODE_YEN"); then
    input keyevent KEYCODE_YEN
fi

if (sh "$yesnofile" "KEYCODE_Z"); then
    input keyevent KEYCODE_Z
fi

if (sh "$yesnofile" "KEYCODE_ZENKAKU_HANKAKU"); then
    input keyevent KEYCODE_ZENKAKU_HANKAKU
fi

if (sh "$yesnofile" "KEYCODE_ZOOM_IN"); then
    input keyevent KEYCODE_ZOOM_IN
fi

if (sh "$yesnofile" "KEYCODE_ZOOM_OUT"); then
    input keyevent KEYCODE_ZOOM_OUT
fi

if (sh "$yesnofile" "MAX_KEYCODE"); then
    input keyevent MAX_KEYCODE
fi

if (sh "$yesnofile" "META_ALT_LEFT_ON"); then
    input keyevent META_ALT_LEFT_ON
fi

if (sh "$yesnofile" "META_ALT_MASK"); then
    input keyevent META_ALT_MASK
fi

if (sh "$yesnofile" "META_ALT_ON"); then
    input keyevent META_ALT_ON
fi

if (sh "$yesnofile" "META_ALT_RIGHT_ON"); then
    input keyevent META_ALT_RIGHT_ON
fi

if (sh "$yesnofile" "META_CAPS_LOCK_ON"); then
    input keyevent META_CAPS_LOCK_ON
fi

if (sh "$yesnofile" "META_CTRL_LEFT_ON"); then
    input keyevent META_CTRL_LEFT_ON
fi

if (sh "$yesnofile" "META_CTRL_MASK"); then
    input keyevent META_CTRL_MASK
fi

if (sh "$yesnofile" "META_CTRL_ON"); then
    input keyevent META_CTRL_ON
fi

if (sh "$yesnofile" "META_CTRL_RIGHT_ON"); then
    input keyevent META_CTRL_RIGHT_ON
fi

if (sh "$yesnofile" "META_FUNCTION_ON"); then
    input keyevent META_FUNCTION_ON
fi

if (sh "$yesnofile" "META_META_LEFT_ON"); then
    input keyevent META_META_LEFT_ON
fi

if (sh "$yesnofile" "META_META_MASK"); then
    input keyevent META_META_MASK
fi

if (sh "$yesnofile" "META_META_ON"); then
    input keyevent META_META_ON
fi

if (sh "$yesnofile" "META_META_RIGHT_ON"); then
    input keyevent META_META_RIGHT_ON
fi

if (sh "$yesnofile" "META_NUM_LOCK_ON"); then
    input keyevent META_NUM_LOCK_ON
fi

if (sh "$yesnofile" "META_SCROLL_LOCK_ON"); then
    input keyevent META_SCROLL_LOCK_ON
fi

if (sh "$yesnofile" "META_SHIFT_LEFT_ON"); then
    input keyevent META_SHIFT_LEFT_ON
fi

if (sh "$yesnofile" "META_SHIFT_MASK"); then
    input keyevent META_SHIFT_MASK
fi

if (sh "$yesnofile" "META_SHIFT_ON"); then
    input keyevent META_SHIFT_ON
fi

if (sh "$yesnofile" "META_SHIFT_RIGHT_ON"); then
    input keyevent META_SHIFT_RIGHT_ON
fi

if (sh "$yesnofile" "META_SYM_ON"); then
    input keyevent META_SYM_ON
fi
