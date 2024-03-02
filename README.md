# dump items

## get a fragment dump 
```sh
sh /sdcard/fragmentparser/awkparser.sh
ELEMENT_INDEX   CLASSNAME       MID     VISIBILITY      FOCUSABLE       ENABLED DRAWN   SCROLLBARS_HORIZONTAL   SCROLLBARS_VERTICAL     CLICKABLE       LONG_CLICKABLE  CONTEXT_CLICKABLE       PFLAG_IS_ROOT_NAMESPACE PFLAG_FOCUSED   PFLAG_SELECTED  PFLAG_PREPRESSED        PFLAG_HOVERED   PFLAG_ACTIVATED PFLAG_INVALIDATED       PFLAG_DIRTY_MASK        START_X_RELATIVE        START_Y_RELATIVE        END_X_RELATIVE  END_Y_RELATIVE  HASHCODE        ELEMENT_ID      IS_ACTIVE       PARENTSINDEX    START_X START_Y END_X   END_Y   WIDTH   HEIGHT  AREA    CENTER_X        CENTER_Y
1       android.widget.LinearLayout     b0890e3 V       .       E       .       .       .       .       .       .       .       .       .       .       .       .       .       .       0       0       900     1600    NADA    NADA    8               0       0       900     1600    900     1600    1440000 450     800
2       android.view.ViewStub   15d0ae0 G
...
```

## get a fragment dump with pretty print 
```sh
sh /sdcard/fragmentparser/awkparser.sh  | awk -f /sdcard/printer/awk_pretty_print.awk
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ELEMENT_INDEX | CLASSNAME                                         | MID     | VISIBILITY | FOCUSABLE | ENABLED | DRAWN | SCROLLBARS_HORIZONTAL | SCROLLBARS_VERTICAL | CLICKABLE | LONG_CLICKABLE | CONTEXT_CLICKABLE | PFLAG_IS_ROOT_NAMESPACE | PFLAG_FOCUSED | PFLAG_SELECTED | PFLAG_PREPRESSED | PFLAG_HOVERED | PFLAG_ACTIVATED | PFLAG_INVALIDATED | PFLAG_DIRTY_MASK | START_X_RELATIVE | START_Y_RELATIVE | END_X_RELATIVE | END_Y_RELATIVE | HASHCODE  | ELEMENT_ID                      | IS_ACTIVE | PARENTSINDEX                  | START_X | START_Y | END_X | END_Y | WIDTH | HEIGHT | AREA    | CENTER_X | CENTER_Y |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | android.widget.LinearLayout                       | b0890e3 | V          | .         | E       | .     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 0                | 0                | 900            | 1600           | NADA      | NADA                            | 8         |                               | 0       | 0       | 900   | 1600  | 900   | 1600   | 1440000 | 450      | 800      |
2             | android.view.ViewStub                             | 15d0ae0 | G          | .         | E       | .     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | I                 | .                | 0                | 0                | 0              | 0              | #10201af  | android:id/action_mode_bar_stub | 10        | 1                             | 0       | 0       | 0     | 0     | 0     | 0      | 0       | 0        | 0        |
3             | android.widget.FrameLayout                        | 72e1199 | V          | .         | E       | .     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 0                | 0                | 900            | 1600           | #1020002  | android:id/content              | 10        | 1                             | 0       | 0       | 900   | 1600  | 900   | 1600   | 1440000 | 450      | 800      |
4             | android.widget.FrameLayout                        | d504c5e | V          | .         | E       | .     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 0                | 0                | 900            | 1600           | NADA      | NADA                            | 12        | 1|3                           | 0       | 0       | 900   | 1600  | 900   | 1600   | 1440000 | 450      | 800      |
5             | androidx.drawerlayout.widget.DrawerLayout         | 129583f | V          | F         | E       | .     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 0                | 36               | 900            | 1600           | #7f0800af | app:id/drawer_layout            | 14        | 1|3|4                         | 0       | 36      | 900   | 1600  | 900   | 1564   | 1407600 | 450      | 818      |
...
12            | android.widget.EditText                           | 6238936 | V          | F         | E       | D     | .                     | .                   | C         | L              | .                 | .                       | F             | .              | .                | .             | .               | .                 | .                | 37               | 0                | 561            | 49             | #7f080131 | app:id/searchEditText           | 22        | 1|3|4|5|6|7|9                 | 188     | 117     | 712   | 166   | 524   | 49     | 25676   | 450      | 141      |
....
```

## get a fragment dump with pretty print and limit the max print width to 15
```sh
sh /sdcard/fragmentparser/awkparser.sh  | awk -f /sdcard/printer/awk_pretty_print.awk -v m=15

ELEMENT_INDEX | CLASSNAME       | MID     | VISIBILITY | FOCUSABLE | ENABLED | DRAWN | SCROLLBARS_HORI | SCROLLBARS_VERT | CLICKABLE | LONG_CLICKABLE | CONTEXT_CLICKAB | PFLAG_IS_ROOT_N | PFLAG_FOCUSED | PFLAG_SELECTED | PFLAG_PREPRESSE | PFLAG_HOVERED | PFLAG_ACTIVATED | PFLAG_INVALIDAT | PFLAG_DIRTY_MAS | START_X_RELATIV | START_Y_RELATIV | END_X_RELATIVE | END_Y_RELATIVE | HASHCODE  | ELEMENT_ID      | IS_ACTIVE | PARENTSINDEX    | START_X | START_Y | END_X | END_Y | WIDTH | HEIGHT | AREA    | CENTER_X | CENTER_Y |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | android.widget. | b0890e3 | V          | .         | E       | .     | .               | .               | .         | .              | .               | .               | .             | .              | .               | .             | .               | .               | .               | 0               | 0               | 900            | 1600           | NADA      | NADA            | 8         |                 | 0       | 0       | 900   | 1600  | 900   | 1600   | 1440000 | 450      | 800      |
2             | android.view.Vi | 15d0ae0 | G          | .         | E       | .     | .               | .               | .         | .              | .               | .               | .             | .              | .               | .             | .               | I               | .               | 0               | 0               | 0              | 0              | #10201af  | android:id/acti | 10        | 1               | 0       | 0       | 0     | 0     | 0     | 0      | 0       | 0        | 0        |
3             | android.widget. | 72e1199 | V          | .         | E       | .     | .               | .               | .         | .              | .               | .               | .             | .              | .               | .             | .               | .               | .               | 0               | 0               | 900            | 1600           | #1020002  | android:id/cont | 10        | 1               | 0       | 0       | 900   | 1600  | 900   | 1600   | 1440000 | 450      | 800      |
4             | android.widget. | d504c5e | V          | .         | E       | .     | .               | .               | .         | .              | .               | .               | .             | .              | .               | .             | .               | .               | .               | 0               | 0               | 900            | 1600           | NADA      | NADA            | 12        | 1|3             | 0       | 0       | 900   | 1600  | 900   | 1600   | 1440000 | 450      | 800      |
5             | androidx.drawer | 129583f | V          | F         | E       | .     | .               | .               | .         | .              | .               | .               | .             | .              | .               | .             | .               | .               | .               | 0               | 36              | 900            | 1600           | #7f0800af | app:id/drawer_l | 14        | 1|3|4           | 0       | 36      | 900   | 1600  | 900   | 1564   | 1407600 | 450      | 818      |
...
11            | android.widget. | 3775ad1 | V          | F         | E       | D     | .               | .               | C         | .              | .               | .               | .             | .              | .               | .             | .               | .               | .               | 561             | 14              | 580            | 33             | #7f080132 | app:id/searchIc | 22        | 1|3|4|5|6|7|9   | 712     | 131     | 731   | 150   | 19    | 19     | 361     | 721      | 140      |
...
```

## get uiautomator dump with 10 seconds timeout (default to 60)
```sh
sh /sdcard/elementparser/elementparser.sh 10

element_index   index   text    resource-id     class   package content-desc    checkable       checked clickable       enabled focusable       focused scrollable      long-clickable  password        selected        startx  endx    starty  endy    centerx centery area    width   height
1       0                       android.widget.FrameLayout      com.bluestacks.launcher         false   false   false   true    false   false   false   false   false   false   0       900     0       1600    450     800     1440000 900     1600
2       0                       android.widget.LinearLayout     com.bluestacks.launcher         false   false   false   true    false   false   false   false   false   false   0       900     0       1600    450     800     1440000 900     1600
3       0               android:id/content      android.widget.FrameLayout      com.bluestacks.launcher         false   false   false   true    false   false   false   false   false   false   0       900     0       1600    450     800     1440000 900     1600
```

## get uiautomator dump with pretty print 
```sh
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/printer/awk_pretty_print.awk
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height |
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   |
...
11            | 1     |                            | com.bluestacks.launcher:id/searchEditText       | android.widget.EditText                   | com.bluestacks.launcher |              | false     | false   | true      | true    | true      | true    | false      | true           | false    | false    | 188    | 712  | 117    | 166  | 450     | 141     | 25676   | 524   | 49     |
...
```

# localize items 

## query uiautomator
```sh
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/loc/aloc.awk -v query="width>>300|height>>90|class~~view" -v sep="|" -v and=1 | awk -f /sdcard/printer/awk_pretty_print.awk
# width >> 300: Selects rows where the value in the "width" column is greater than 300.
# height >> 90: Selects rows where the value in the "height" column is greater than 90.
# class ~~ view: Selects rows where the "class" column matches the regular expression "view".
# and=1: all conditions must be true
# sep="|": to separate the query

# All operators 
#">=" == GE
#"<=" == LE
#"!=" == NE
#">>" == GT
#"<<" == LT
#"==" == EQ
#"~~" == REGEX
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text | resource-id                               | class                       | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height |
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
7             | 0     |      |                                           | android.view.View           | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   |
8             | 1     |      |                                           | android.view.ViewGroup      | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   |
13            | 1     |      | com.bluestacks.launcher:id/desktop        | androidx.viewpager.widget.b | com.bluestacks.launcher |              | false     | false   | false     | true    | true      | false   | false      | false          | false    | false    | 44     | 856  | 202    | 1290 | 450     | 746     | 883456  | 812   | 1088   |
14            | 0     |      |                                           | android.view.ViewGroup      | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 44     | 856  | 202    | 1290 | 450     | 746     | 883456  | 812   | 1088   |
37            | 1     |      | com.bluestacks.launcher:id/viewBackground | android.view.View           | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 1484   | 1600 | 450     | 1542    | 104400  | 900   | 116    |
```

## piped query uiautomator
```sh

sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/loc/aloc.awk -v query="width>>300|height>>90|class~~view" -v sep="|" -v and=1 | awk -f /sdcard/loc/aloc.awk -v query="startx>>41#starty<<100" -v and=0 | awk -f /sdcard/printer/awk_pretty_print.awk

# awk -f /sdcard/loc/aloc.awk -v query="startx>>41#starty<<100" -v and=0
# and=0 means that either startx>41 or starty<100 must be true
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text | resource-id                        | class                       | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height |
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
7             | 0     |      |                                    | android.view.View           | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   |
8             | 1     |      |                                    | android.view.ViewGroup      | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   |
13            | 1     |      | com.bluestacks.launcher:id/desktop | androidx.viewpager.widget.b | com.bluestacks.launcher |              | false     | false   | false     | true    | true      | false   | false      | false          | false    | false    | 44     | 856  | 202    | 1290 | 450     | 746     | 883456  | 812   | 1088   |
14            | 0     |      |                                    | android.view.ViewGroup      | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 44     | 856  | 202    | 1290 | 450     | 746     | 883456  | 812   | 1088   |
```

## query fragments 
```sh
sh /sdcard/fragmentparser/awkparser.sh | awk -f /sdcard/loc/aloc.awk -v query="VISIBILITY==V#CLASSNAME~~.*View$" -v and=1 | awk -f /sdcard/printer/awk_pretty_print.awk

# query where VISIBILITY==V and CLASSNAME matches the regex *View$

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ELEMENT_INDEX | CLASSNAME                                     | MID     | VISIBILITY | FOCUSABLE | ENABLED | DRAWN | SCROLLBARS_HORIZONTAL | SCROLLBARS_VERTICAL | CLICKABLE | LONG_CLICKABLE | CONTEXT_CLICKABLE | PFLAG_IS_ROOT_NAMESPACE | PFLAG_FOCUSED | PFLAG_SELECTED | PFLAG_PREPRESSED | PFLAG_HOVERED | PFLAG_ACTIVATED | PFLAG_INVALIDATED | PFLAG_DIRTY_MASK | START_X_RELATIVE | START_Y_RELATIVE | END_X_RELATIVE | END_Y_RELATIVE | HASHCODE  | ELEMENT_ID               | IS_ACTIVE | PARENTSINDEX                  | START_X | START_Y | END_X | END_Y | WIDTH | HEIGHT | AREA    | CENTER_X | CENTER_Y |
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
6             | com.bluestacks.launcher.widget.ItemOptionView | 737f50c | V          | F         | E       | D     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 0                | 0                | 900            | 1564           | #7f0800dd | app:id/item_option       | 16        | 1|3|4|5                       | 0       | 36      | 900   | 1600  | 900   | 1564   | 1407600 | 450      | 818      |
10            | android.widget.ImageView                      | 9f555f8 | V          | .         | E       | D     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 19               | 14               | 38             | 33             | #7f080133 | app:id/searchPlayIcon    | 22        | 1|3|4|5|6|7|9                 | 170     | 131     | 189   | 150   | 19    | 19     | 361     | 179      | 140      |
11            | android.widget.ImageView                      | 3775ad1 | V          | F         | E       | D     | .                     | .                   | C         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 561              | 14               | 580            | 33             | #7f080132 | app:id/searchIcon        | 22        | 1|3|4|5|6|7|9                 | 712     | 131     | 731   | 150   | 19    | 19     | 361     | 721      | 140      |
24            | android.widget.TextView                       | 42f56c5 | V          | .         | E       | D     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | I                 | .                | 35               | 4                | 159            | 25             | #7f0800da | app:id/installingGame    | 22        | 1|3|4|5|6|7|22                | 401     | 1310    | 525   | 1331  | 124   | 21     | 2604    | 463      | 1320     |
26            | android.widget.TextView                       | 8232f4b | V          | .         | E       | D     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 0                | 9                | 1208           | 34             | #7f080119 | app:id/popular_gam       | 22        | 1|3|4|5|6|7|25                | -153    | 1376    | 1055  | 1401  | 1208  | 25     | 30200   | 451      | 1388     |
...
59            | android.widget.TextView                       | 65f5f88 | V          | F         | E       | D     | .                     | .                   | C         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 25               | 20               | 779            | 63             | #7f0800c4 | app:id/group_popup_label | 26        | 1|3|4|5|6|7|56|57|58          | 31      | 62      | 785   | 105   | 754   | 43     | 32422   | 408      | 83       |

```

## piped query fragments
```sh
 sh /sdcard/fragmentparser/awkparser.sh | awk -f /sdcard/loc/aloc.awk -v query="VISIBILITY==V#CLASSNAME~~.*View$" -v and=1 | awk -f /sdcard/loc/aloc.awk -v query="HEIGHT>>100#WIDTH<<100" -v and=0 | awk -f /sdcard/printer/awk_pretty_print.awk

# query where VISIBILITY==V and CLASSNAME matches the regex *View$
# and where HEIGHT is greater than 100 or WIDTH is less than 100

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ELEMENT_INDEX | CLASSNAME                                     | MID     | VISIBILITY | FOCUSABLE | ENABLED | DRAWN | SCROLLBARS_HORIZONTAL | SCROLLBARS_VERTICAL | CLICKABLE | LONG_CLICKABLE | CONTEXT_CLICKABLE | PFLAG_IS_ROOT_NAMESPACE | PFLAG_FOCUSED | PFLAG_SELECTED | PFLAG_PREPRESSED | PFLAG_HOVERED | PFLAG_ACTIVATED | PFLAG_INVALIDATED | PFLAG_DIRTY_MASK | START_X_RELATIVE | START_Y_RELATIVE | END_X_RELATIVE | END_Y_RELATIVE | HASHCODE  | ELEMENT_ID               | IS_ACTIVE | PARENTSINDEX                  | START_X | START_Y | END_X | END_Y | WIDTH | HEIGHT | AREA    | CENTER_X | CENTER_Y |
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
6             | com.bluestacks.launcher.widget.ItemOptionView | 737f50c | V          | F         | E       | D     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 0                | 0                | 900            | 1564           | #7f0800dd | app:id/item_option       | 16        | 1|3|4|5                       | 0       | 36      | 900   | 1600  | 900   | 1564   | 1407600 | 450      | 818      |
10            | android.widget.ImageView                      | 9f555f8 | V          | .         | E       | D     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 19               | 14               | 38             | 33             | #7f080133 | app:id/searchPlayIcon    | 22        | 1|3|4|5|6|7|9                 | 170     | 131     | 189   | 150   | 19    | 19     | 361     | 179      | 140      |
11            | android.widget.ImageView                      | 3775ad1 | V          | F         | E       | D     | .                     | .                   | C         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 561              | 14               | 580            | 33             | #7f080132 | app:id/searchIcon        | 22        | 1|3|4|5|6|7|9                 | 712     | 131     | 731   | 150   | 19    | 19     | 361     | 721      | 140      |
28            | android.view.View                             | 8339a41 | V          | .         | E       | D     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 0                | 83               | 1208           | 199            | #7f08017c | app:id/viewBackground    | 24        | 1|3|4|5|6|7|25|27             | -153    | 1484    | 1055  | 1600  | 1208  | 116    | 140128  | 451      | 1542     |
34            | android.widget.ImageView                      | 8983cc3 | V          | .         | E       | D     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 65               | 3                | 88             | 26             | #7f08011c | app:id/popup_image_one   | 32        | 1|3|4|5|6|7|25|27|29|31|32|33 | 153     | 1417    | 176   | 1440  | 23    | 23     | 529     | 164      | 1428     |
...
61            | android.view.View                             | 4821546 | V          | .         | E       | D     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 44               | 166              | 82             | 1254           | #7f0800e4 | app:id/leftDragHandle    | 20        | 1|3|4|5|6|7                   | 44      | 202     | 82    | 1290  | 38    | 1088   | 41344   | 63       | 746      |

```

## more examples 
```sh
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/loc/aloc.awk -v query="width>>300#height>>90#class~~view#enabled==false#area>=0#starty<=10000" | awk -f /sdcard/printer/awk_pretty_print.awk
# Selects rows meeting one of these # conditions: width > 300, height > 90, class ~ view, enabled == false, area >= 0, starty <= 10000
# default separator (#) is used between conditions.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height |
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   |
...
13            | 1     |                            | com.bluestacks.launcher:id/desktop              | androidx.viewpager.widget.b               | com.bluestacks.launcher |              | false     | false   | false     | true    | true      | false   | false      | false          | false    | false    | 44     | 856  | 202    | 1290 | 450     | 746     | 883456  | 812   | 1088   |




sh /sdcard/fragmentparser/awkparser.sh | awk -f /sdcard/loc/aloc.awk -v query="CLASSNAME~~.*widget.*|HEIGHT>>90|VISIBILITY==V" -v sep="|" -v and=1 | awk -f /sdcard/printer/awk_pretty_print.awk
# CLASSNAME ~~ widget: Selects rows where the "CLASSNAME" column matches the regular expression ".*widget.*".
# HEIGHT >> 90: Selects rows where the value in the "HEIGHT" column is greater than 90.
# VISIBILITY == V: Selects rows where the value in the "VISIBILITY" column is equal to "V".
# and=1: all conditions must be met
# and=0: any condition must be met
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ELEMENT_INDEX | CLASSNAME                                         | MID     | VISIBILITY | FOCUSABLE | ENABLED | DRAWN | SCROLLBARS_HORIZONTAL | SCROLLBARS_VERTICAL | CLICKABLE | LONG_CLICKABLE | CONTEXT_CLICKABLE | PFLAG_IS_ROOT_NAMESPACE | PFLAG_FOCUSED | PFLAG_SELECTED | PFLAG_PREPRESSED | PFLAG_HOVERED | PFLAG_ACTIVATED | PFLAG_INVALIDATED | PFLAG_DIRTY_MASK | START_X_RELATIVE | START_Y_RELATIVE | END_X_RELATIVE | END_Y_RELATIVE | HASHCODE  | ELEMENT_ID                  | IS_ACTIVE | PARENTSINDEX               | START_X | START_Y | END_X | END_Y | WIDTH | HEIGHT | AREA    | CENTER_X | CENTER_Y |
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | android.widget.LinearLayout                       | b0890e3 | V          | .         | E       | .     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 0                | 0                | 900            | 1600           | NADA      | NADA                        | 8         |                            | 0       | 0       | 900   | 1600  | 900   | 1600   | 1440000 | 450      | 800      |
3             | android.widget.FrameLayout                        | 72e1199 | V          | .         | E       | .     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 0                | 0                | 900            | 1600           | #1020002  | android:id/content          | 10        | 1                          | 0       | 0       | 900   | 1600  | 900   | 1600   | 1440000 | 450      | 800      |
4             | android.widget.FrameLayout                        | d504c5e | V          | .         | E       | .     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 0                | 0                | 900            | 1600           | NADA      | NADA                        | 12        | 1|3                        | 0       | 0       | 900   | 1600  | 900   | 1600   | 1440000 | 450      | 800      |
5             | androidx.drawerlayout.widget.DrawerLayout         | 129583f | V          | F         | E       | .     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 0                | 36               | 900            | 1600           | #7f0800af | app:id/drawer_layout        | 14        | 1|3|4                      | 0       | 36      | 900   | 1600  | 900   | 1564   | 1407600 | 450      | 818      |
6             | com.bluestacks.launcher.widget.ItemOptionView     | 737f50c | V          | F         | E       | D     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 0                | 0                | 900            | 1564           | #7f0800dd | app:id/item_option          | 16        | 1|3|4|5                    | 0       | 36      | 900   | 1600  | 900   | 1564   | 1407600 | 450      | 818      |
...
25            | android.widget.LinearLayout                       | 5f6281a | V          | .         | E       | .     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | -153             | 1331             | 1055           | 1564           | #7f0800a5 | app:id/dock                 | 20        | 1|3|4|5|6|7                | -153    | 1367    | 1055  | 1600  | 1208  | 233    | 281464  | 451      | 1483     |

sh /sdcard/fragmentparser/awkparser.sh | awk -f /sdcard/loc/aloc.awk -v query="CLASSNAME~~.*widget.*|HEIGHT>>90|VISIBILITY==V" -v sep="|" -v and=0 | awk -f /sdcard/printer/awk_pretty_print.awk
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ELEMENT_INDEX | CLASSNAME                                         | MID     | VISIBILITY | FOCUSABLE | ENABLED | DRAWN | SCROLLBARS_HORIZONTAL | SCROLLBARS_VERTICAL | CLICKABLE | LONG_CLICKABLE | CONTEXT_CLICKABLE | PFLAG_IS_ROOT_NAMESPACE | PFLAG_FOCUSED | PFLAG_SELECTED | PFLAG_PREPRESSED | PFLAG_HOVERED | PFLAG_ACTIVATED | PFLAG_INVALIDATED | PFLAG_DIRTY_MASK | START_X_RELATIVE | START_Y_RELATIVE | END_X_RELATIVE | END_Y_RELATIVE | HASHCODE  | ELEMENT_ID                     | IS_ACTIVE | PARENTSINDEX                  | START_X | START_Y | END_X | END_Y | WIDTH | HEIGHT | AREA    | CENTER_X | CENTER_Y |
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | android.widget.LinearLayout                       | b0890e3 | V          | .         | E       | .     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 0                | 0                | 900            | 1600           | NADA      | NADA                           | 8         |                               | 0       | 0       | 900   | 1600  | 900   | 1600   | 1440000 | 450      | 800      |
3             | android.widget.FrameLayout                        | 72e1199 | V          | .         | E       | .     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 0                | 0                | 900            | 1600           | #1020002  | android:id/content             | 10        | 1                             | 0       | 0       | 900   | 1600  | 900   | 1600   | 1440000 | 450      | 800      |
4             | android.widget.FrameLayout                        | d504c5e | V          | .         | E       | .     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 0                | 0                | 900            | 1600           | NADA      | NADA                           | 12        | 1|3                           | 0       | 0       | 900   | 1600  | 900   | 1600   | 1440000 | 450      | 800      |
5             | androidx.drawerlayout.widget.DrawerLayout         | 129583f | V          | F         | E       | .     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 0                | 36               | 900            | 1600           | #7f0800af | app:id/drawer_layout           | 14        | 1|3|4                         | 0       | 36      | 900   | 1600  | 900   | 1564   | 1407600 | 450      | 818      |
6             | com.bluestacks.launcher.widget.ItemOptionView     | 737f50c | V          | F         | E       | D     | .                     | .                   | .         | .              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 0                | 0                | 900            | 1564           | #7f0800dd | app:id/item_option             | 16        | 1|3|4|5                       | 0       | 36      | 900   | 1600  | 900   | 1564   | 1407600 | 450      | 818      |
...
17            | d1.b                                              | faf78d3 | V          | F         | E       | D     | .                     | .                   | C         | L              | .                 | .                       | .             | .              | .                | .             | .               | .                 | .                | 270              | 0                | 540            | 272            | NADA      | NADA                           | 24        | 1|3|4|5|6|7|13|14             | 314     | 202     | 584   | 474   | 270   | 272    | 73440   | 449      | 338      |


```

# apply 

## some pandas styled apply scripts

```sh

# Some scripts that create a new column, similar to pd.Series.apply
# 0 (false) / 1 (true) is used for Boolean values 

sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="text" -v newcolumn="text2"  | awk -f /sdcard/printer/awk_pretty_print.awk
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="text" -v newcolumn="is_empty" -v is_empty=1  | awk -f /sdcard/printer/awk_pretty_print.awk
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="text" -v newcolumn="length" -v len=1  | awk -f /sdcard/printer/awk_pretty_print.awk
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="centerx" -v newcolumn="centerx_lt" -v lt=1 -v value=700  | awk -f /sdcard/printer/awk_pretty_print.awk
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="centerx" -v newcolumn="centerx_gt" -v gt=1 -v value=700  | awk -f /sdcard/printer/awk_pretty_print.awk
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="centerx" -v newcolumn="centerx_ge" -v ge=1 -v value=700  | awk -f /sdcard/printer/awk_pretty_print.awk
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="centerx" -v newcolumn="centerx_le" -v le=1 -v value=700  | awk -f /sdcard/printer/awk_pretty_print.awk
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="centerx" -v newcolumn="centerx_eq" -v eq=1 -v value=700  | awk -f /sdcard/printer/awk_pretty_print.awk
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="area" -v newcolumn="area_count" -v charcount=1 -v value="1"  | awk -f /sdcard/printer/awk_pretty_print.awk
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="area" -v newcolumn="area_count" -v charcount=1 -v value="0"  | awk -f /sdcard/printer/awk_pretty_print.awk
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="area" -v newcolumn="area_strcontains" -v strcontains=1 -v value="000"  | awk -f /sdcard/printer/awk_pretty_print.awk
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_sorted" -v sortletters=1  | awk -f /sdcard/printer/awk_pretty_print.awk
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_replaced" -v strreplace=1 -v old=andro -v new=BUDU  | awk -f /sdcard/printer/awk_pretty_print.awk
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="area" -v newcolumn="area_abs" -v absolute=1  | awk -f /sdcard/printer/awk_pretty_print.awk
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_leven" -v leven=1 -v str="android.view.View"  | awk -f /sdcard/printer/awk_pretty_print.awk
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_starts" -v strstartswith=1 -v value="android.view"  | awk -f /sdcard/printer/awk_pretty_print.awk
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_ends" -v strendswith=1 -v value="android.view"  | awk -f /sdcard/printer/awk_pretty_print.awk
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_rstrip" -v strrstrip=1 -v value="w"  | awk -f /sdcard/printer/awk_pretty_print.awk
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_lstrip" -v strlstrip=1 -v value="a"  | awk -f /sdcard/printer/awk_pretty_print.awk
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_spacestrip" -v spacestrip=1  | awk -f /sdcard/printer/awk_pretty_print.awk
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_upper" -v strupper=1  | awk -f /sdcard/printer/awk_pretty_print.awk
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_lower" -v strlower=1  | awk -f /sdcard/printer/awk_pretty_print.awk

sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="text" -v newcolumn="text2"  | awk -f /sdcard/printer/awk_pretty_print.awk

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | text2                      |
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   |                            |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   |                            |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   |                            |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   |                            |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   |                            |
...
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three       | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     | Anocris                    |
b0q:/ $ sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="text" -v newcolumn="is_empty" -v is_empty=1  | awk -f /sdcard/printer/awk_pretty_print.awk
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | is_empty |
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 1        |
...
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three       | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     | 0        |
b0q:/ $ sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="text" -v newcolumn="length" -v len=1  | awk -f /sdcard/printer/awk_pretty_print.awk
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | length |
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0      |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0      |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0      |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0      |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 0      |
...
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three       | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     | 7      |
b0q:/ $ sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="centerx" -v newcolumn="centerx_lt" -v lt=1 -v value=700  | awk -f /sdcard/printer/awk_pretty_print.awk
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | centerx_lt |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1          |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1          |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1          |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1          |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 1          |
...
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three       | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     | 0          |
b0q:/ $ sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="centerx" -v newcolumn="centerx_gt" -v gt=1 -v value=700  | awk -f /sdcard/printer/awk_pretty_print.awk
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | centerx_gt |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0          |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0          |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0          |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0          |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 0          |
...
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three       | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     | 1          |
b0q:/ $ sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="centerx" -v newcolumn="centerx_ge" -v ge=1 -v value=700  | awk -f /sdcard/printer/awk_pretty_print.awk
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | centerx_ge |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0          |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0          |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0          |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0          |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 0          |
...
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three       | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     | 1          |
b0q:/ $ sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="centerx" -v newcolumn="centerx_le" -v le=1 -v value=700  | awk -f /sdcard/printer/awk_pretty_print.awk
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | centerx_le |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1          |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1          |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1          |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1          |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 1          |
...
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three       | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     | 0          |
b0q:/ $ sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="centerx" -v newcolumn="centerx_eq" -v eq=1 -v value=700  | awk -f /sdcard/printer/awk_pretty_print.awk
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | centerx_eq |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0          |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0          |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0          |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0          |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 0          |
...
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three       | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     | 0          |
b0q:/ $ sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="area" -v newcolumn="area_count" -v charcount=1 -v value="1"  | awk -f /sdcard/printer/awk_pretty_print.awk
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | area_count |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1          |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1          |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1          |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1          |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 1          |
...
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three       | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     | 1          |
b0q:/ $ sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="area" -v newcolumn="area_count" -v charcount=1 -v value="0"  | awk -f /sdcard/printer/awk_pretty_print.awk
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | area_count |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 4          |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 4          |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 4          |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 4          |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 3          |
...
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three       | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     | 1          |
b0q:/ $ sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="area" -v newcolumn="area_strcontains" -v strcontains=1 -v value="000"  | awk -f /sdcard/printer/awk_pretty_print.awk
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | area_strcontains |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 4                |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 4                |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 4                |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 4                |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 0                |
...
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three       | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     | 0                |
b0q:/ $ sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_sorted" -v sortletters=1  | awk -f /sdcard/printer/awk_pretty_print.awk
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | class_sorted                              |
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | ..FLaaadddeegiimnoorrttuwy                |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | ..LLaaadddeegiiinnoorrttuwy               |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | ..FLaaadddeegiimnoorrttuwy                |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | ..FLaaadddeegiimnoorrttuwy                |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | ...DLaaaaaddddeeegiilnooorrrrrtttuuwwwxyy |
...
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three       | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     | ..TVadddeeegiiinorttwwx                   |
b0q:/ $ sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_replaced" -v strreplace=1 -v old=andro -v new=BUDU  | awk -f /sdcard/printer/awk_pretty_print.awk
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | class_replaced                           |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | BUDUid.widget.FrameLayout                |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | BUDUid.widget.LinearLayout               |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | BUDUid.widget.FrameLayout                |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | BUDUid.widget.FrameLayout                |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | BUDUidx.drawerlayout.widget.DrawerLayout |
...
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three       | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     | BUDUid.widget.TextView                   |
b0q:/ $ sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="area" -v newcolumn="area_abs" -v absolute=1  | awk -f /sdcard/printer/awk_pretty_print.awk
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | area_abs |
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1440000  |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1440000  |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1440000  |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1440000  |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 1407600  |
...
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three       | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     | 18270    |
b0q:/ $ sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_leven" -v leven=1 -v str="android.view.View"  | awk -f /sdcard/printer/awk_pretty_print.awk
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | class_leven |
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 14          |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 14          |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 14          |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 14          |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 28          |
...
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three       | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     | 8           |
b0q:/ $ sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_starts" -v strstartswith=1 -v value="android.view"  | awk -f /sdcard/printer/awk_pretty_print.awk
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | class_starts |
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0            |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0            |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0            |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0            |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 0            |
...
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three       | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     | 0            |
b0q:/ $ sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_ends" -v strendswith=1 -v value="android.view"  | awk -f /sdcard/printer/awk_pretty_print.awk
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | class_ends |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0          |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0          |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0          |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0          |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 0          |
...
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three       | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     | 0          |
b0q:/ $ sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_rstrip" -v strrstrip=1 -v value="w"  | awk -f /sdcard/printer/awk_pretty_print.awk
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | class_rstrip                              |
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | android.widget.FrameLayout                |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | android.widget.LinearLayout               |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | android.widget.FrameLayout                |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | android.widget.FrameLayout                |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | androidx.drawerlayout.widget.DrawerLayout |
...
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three       | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     | android.widget.TextVie                    |
b0q:/ $ sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_lstrip" -v strlstrip=1 -v value="a"  | awk -f /sdcard/printer/awk_pretty_print.awk
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | class_lstrip                             |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | ndroid.widget.FrameLayout                |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | ndroid.widget.LinearLayout               |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | ndroid.widget.FrameLayout                |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | ndroid.widget.FrameLayout                |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | ndroidx.drawerlayout.widget.DrawerLayout |
...
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three       | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     | ndroid.widget.TextView                   |
b0q:/ $ sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_spacestrip" -v spacestrip=1  | awk -f /sdcard/printer/awk_pretty_print.awk
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | class_spacestrip                          |
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | android.widget.FrameLayout                |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | android.widget.LinearLayout               |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | android.widget.FrameLayout                |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | android.widget.FrameLayout                |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | androidx.drawerlayout.widget.DrawerLayout |
...
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three       | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     | android.widget.TextView                   |
b0q:/ $ sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_upper" -v strupper=1  | awk -f /sdcard/printer/awk_pretty_print.awk
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | class_upper                               |
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | ANDROID.WIDGET.FRAMELAYOUT                |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | ANDROID.WIDGET.LINEARLAYOUT               |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | ANDROID.WIDGET.FRAMELAYOUT                |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | ANDROID.WIDGET.FRAMELAYOUT                |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | ANDROIDX.DRAWERLAYOUT.WIDGET.DRAWERLAYOUT |
...
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three       | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     | ANDROID.WIDGET.TEXTVIEW                   |
b0q:/ $ sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_lower" -v strlower=1  | awk -f /sdcard/printer/awk_pretty_print.awk
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | class_lower                               |
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | android.widget.framelayout                |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | android.widget.linearlayout               |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | android.widget.framelayout                |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | android.widget.framelayout                |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | androidx.drawerlayout.widget.drawerlayout |
...
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three       | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     | android.widget.textview                   |
```

# combining loc and apply 

```sh
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/loc/aloc.awk -v query="width>>300#height>>90#class~~view#enabled==false#area>=0#starty<=10000"  | awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_leven" -v leven=1 -v str="android.view.View" | awk -f /sdcard/loc/aloc.awk -v query="class_leven<<10" | awk -f /sdcard/printer/awk_pretty_print.awk

# /sdcard/elementparser/elementparser.sh | awk -f /sdcard/loc/aloc.awk -v query="width>>300#height>>90#class~~view#enabled==false#area>=0#starty<=10000"  -> same query as mentioned above 
# awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_leven" -v leven=1 -v str="android.view.View"  -> add a new column (class_leven) with the Levenshtein string distance (leven=1) to android.view.View from the column class 
# awk -f /sdcard/loc/aloc.awk -v query="class_leven<<10" -> Only show the results where the string distance is less than 10
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                  | class                    | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | class_leven |
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
7             | 0     |                            |                                              | android.view.View        | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 0           |
8             | 1     |                            |                                              | android.view.ViewGroup   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 5           |
10            | 0     |                            | com.bluestacks.launcher:id/searchPlayIcon    | android.widget.ImageView | com.bluestacks.launcher | searchbar    | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 170    | 189  | 131    | 150  | 179     | 140     | 361     | 19    | 19     | 9           |
12            | 2     |                            | com.bluestacks.launcher:id/searchIcon        | android.widget.ImageView | com.bluestacks.launcher | searchbar    | false     | false   | true      | true    | true      | false   | false      | false          | false    | false    | 712    | 731  | 131    | 150  | 721     | 140     | 361     | 19    | 19     | 9           |
14            | 0     |                            |                                              | android.view.ViewGroup   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 44     | 856  | 202    | 1290 | 450     | 746     | 883456  | 812   | 1088   | 5           |
...
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three    | android.widget.TextView  | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     | 8           |

```

```sh
# # finds all elements where text is not an empty string and where centerx is less or equal 700
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="text" -v newcolumn="is_empty" -v is_empty=1 | awk -f /sdcard/loc/aloc.awk -v query="is_empty==1" | awk -f /sdcard/series/seriesapply.awk -v column="centerx" -v newcolumn="centerx_le" -v le=1 -v value=700 | awk -f /sdcard/loc/aloc.awk -v query="centerx_le==1" | awk -f /sdcard/printer/awk_pretty_print.awk
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | is_empty | centerx_le |
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |      |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          |
2             | 0     |      |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          |
3             | 0     |      | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          |
4             | 0     |      |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          |
5             | 0     |      | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 1        | 1          |
...
31            | 0     |      | com.bluestacks.launcher:id/app_image_two        | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 406    | 497  | 1414   | 1505 | 451     | 1459    | 8281    | 91    | 91     | 1        | 1          |
```

```sh
# finds all elements where text is not an empty string and where centerx is less or equal 700 and centery is greater than 100
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="text" -v newcolumn="is_empty" -v is_empty=1 | awk -f /sdcard/loc/aloc.awk -v query="is_empty==1" -v and=1 | awk -f /sdcard/series/seriesapply.awk -v column="centerx" -v newcolumn="centerx_le" -v le=1 -v value=700 | awk -f /sdcard/loc/aloc.awk -v query="centerx_le==1" -v and=1 | awk -f /sdcard/series/seriesapply.awk -v column="centery" -v newcolumn="centery_gt" -v gt=1 -v value=100 |  awk -f /sdcard/loc/aloc.awk -v query="centery_gt==1" -v and=1  | awk -f /sdcard/printer/awk_pretty_print.awk
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | is_empty | centerx_le | centery_gt |
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |      |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 1          |
2             | 0     |      |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 1          |
3             | 0     |      | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 1          |
4             | 0     |      |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 1          |
5             | 0     |      | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 1        | 1          | 1          |
...
31            | 0     |      | com.bluestacks.launcher:id/app_image_two        | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 406    | 497  | 1414   | 1505 | 451     | 1459    | 8281    | 91    | 91     | 1        | 1          | 1          |
b0q:/ $
```

# own apply functions

## apply any function/script you want against any column
```sh
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/awkapply/apply.awk -v column="text" -v newcolumn="text2" -v apply="{printf length(\$0)}" | awk -f /sdcard/printer/awk_pretty_print.awk
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/awkapply/apply.awk -v column="endy" -v newcolumn="endy2" -v apply="{printf (\$0 \> 700)}"  | awk -f /sdcard/printer/awk_pretty_print.awk
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/awkapply/apply.awk -v column="clickable" -v newcolumn="is_clickable" -v apply="{printf (\$0 \~ \"true\")}"  | awk -f /sdcard/printer/awk_pretty_print.awk

# getting the text length
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/awkapply/apply.awk -v column="text" -v newcolumn="text2" -v apply="{printf length(\$0)}" | awk -f /sdcard/printer/awk_pretty_print.awk
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | text2 |
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   |       |
20            | 5     |                            |                                                 | android.view.View                         | com.bluestacks.launcher |              | false     | false   | true      | true    | true      | false   | false      | true           | false    | false    | 584    | 854  | 474    | 746  | 719     | 610     | 73440   | 270   | 272    |       |
21            | 2     |                            | com.bluestacks.launcher:id/dock                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 1367   | 1600 | 450     | 1483    | 209700  | 900   | 233    |       |
22            | 0     | JOGOS POPULARES PARA JOGAR | com.bluestacks.launcher:id/popular_gam          | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 1376   | 1401 | 450     | 1388    | 22500   | 900   | 25     | 26    |
28            | 0     |                            | com.bluestacks.launcher:id/popup_image_one      | android.widget.ImageView                  | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 153    | 176  | 1417   | 1440 | 164     | 1428    | 529     | 23    | 23     |       |
...
35            | 0     |                            | com.bluestacks.launcher:id/popup_image_three    | android.widget.ImageView                  | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 788    | 811  | 1417   | 1440 | 799     | 1428    | 529     | 23    | 23     |       |


sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/awkapply/apply.awk -v column="endy" -v newcolumn="endy2" -v apply="{printf (\$0 \> 700)}"  | awk -f /sdcard/printer/awk_pretty_print.awk
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | endy2 |
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1     |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1     |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1     |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1     |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 1     |
...
10            | 0     |                            | com.bluestacks.launcher:id/searchPlayIcon       | android.widget.ImageView                  | com.bluestacks.launcher | searchbar    | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 170    | 189  | 131    | 150  | 179     | 140     | 361     | 19    | 19     | 0     |


sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/awkapply/apply.awk -v column="clickable" -v newcolumn="is_clickable" -v apply="{printf (\$0 \~ \"true\")}"  | awk -f /sdcard/printer/awk_pretty_print.awk
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | is_clickable |
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0            |
2             | 0     |                            |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0            |
3             | 0     |                            | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0            |
4             | 0     |                            |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 0            |
5             | 0     |                            | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 0            |
...
11            | 1     |                            | com.bluestacks.launcher:id/searchEditText       | android.widget.EditText                   | com.bluestacks.launcher |              | false     | false   | true      | true    | true      | true    | false      | true           | false    | false    | 188    | 712  | 117    | 166  | 450     | 141     | 25676   | 524   | 49     | 1            |
```

# locating colors 


## filter the data first
```sh
# find the elements that you want to analyze, and save the result to a file:
 sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="text" -v newcolumn="is_empty" -v is_empty=1 | awk -f /sdcard/loc/aloc.awk -v query="is_empty==1" | awk -f /sdcard/series/seriesapply.awk -v column="centerx" -v newcolumn="centerx_le" -v le=1 -v value=700 | awk -f /sdcard/loc/aloc.awk -v query="centerx_le==1" > /sdcard/fifi.txt
## get dominant color
```

## one color

### get dominant color
```sh

# get the dominant color in each element
screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=dom_color -v dominant_color=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk
# elements whose size is as big as the whole screen are ignored. To include them, use -v scan_full_size=1
screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v scan_full_size=1 -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=dom_color -v dominant_color=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | is_empty | centerx_le | dom_color_r | dom_color_g | dom_color_b |
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |      |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | -1          | -1          | -1          |
2             | 0     |      |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | -1          | -1          | -1          |
3             | 0     |      | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | -1          | -1          | -1          |
4             | 0     |      |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | -1          | -1          | -1          |
5             | 0     |      | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 1        | 1          | 2           | 6           | 35          |
...
31            | 0     |      | com.bluestacks.launcher:id/app_image_two        | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 406    | 497  | 1414   | 1505 | 451     | 1459    | 8281    | 91    | 91     | 1        | 1          | 7           | 4           | 12          |


screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v scan_full_size=1 -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=dom_color -v dominant_color=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | is_empty | centerx_le | dom_color_r | dom_color_g | dom_color_b |
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |      |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 2           | 6           | 35          |
2             | 0     |      |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 2           | 6           | 35          |
3             | 0     |      | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 2           | 6           | 35          |
4             | 0     |      |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 2           | 6           | 35          |
5             | 0     |      | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 1        | 1          | 2           | 6           | 35          |
...
31            | 0     |      | com.bluestacks.launcher:id/app_image_two        | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 406    | 497  | 1414   | 1505 | 451     | 1459    | 8281    | 91    | 91     | 1        | 1          | 7           | 4           | 12          |

```

### count one color 

```sh

# elements whose size is as big as the whole screen are ignored. To include them, use -v scan_full_size=1

screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=color_count -v rgb=255,255,255 -v count_one_color=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk

# for multiple colors:
screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=color_count -v rgbvalues=24,24,24#25,25,25 -v count_one_color=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | is_empty | centerx_le | color_count |
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |      |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 0           |
2             | 0     |      |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 0           |
3             | 0     |      | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 0           |
4             | 0     |      |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 0           |
5             | 0     |      | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 1        | 1          | 39770       |
...
31            | 0     |      | com.bluestacks.launcher:id/app_image_two        | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 406    | 497  | 1414   | 1505 | 451     | 1459    | 8281    | 91    | 91     | 1        | 1          | 0           |

```

### check if a color is present

```sh

# elements whose size is as big as the whole screen are ignored. To include them, use -v scan_full_size=1
screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=is_there -v rgb=255,255,255 -v is_one_color_there=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk

# for multiple colors 
screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=is_there -v rgbvalues=24,24,24#25,25,25 -v is_one_color_there=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | is_empty | centerx_le | is_there |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |      |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 0        |
2             | 0     |      |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 0        |
3             | 0     |      | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 0        |
4             | 0     |      |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 0        |
5             | 0     |      | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 1        | 1          | 1        |
...
31            | 0     |      | com.bluestacks.launcher:id/app_image_two        | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 406    | 497  | 1414   | 1505 | 451     | 1459    | 8281    | 91    | 91     | 1        | 1          | 0        |
```

### get average coordinates of a color

```sh
# elements whose size is as big as the whole screen are ignored. To include them, use -v scan_full_size=1
screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=avg -v rgb=255,255,255 -v get_avarage_coord=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk
# for multiple colors:
screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=avg -v rgbvalues=24,24,24#25,25,25 -v get_avarage_coord=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | is_empty | centerx_le | avg_x | avg_y |
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |      |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | -1    | -1    |
2             | 0     |      |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | -1    | -1    |
3             | 0     |      | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | -1    | -1    |
4             | 0     |      |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | -1    | -1    |
5             | 0     |      | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 1        | 1          | 417   | 207   |
...
31            | 0     |      | com.bluestacks.launcher:id/app_image_two        | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 406    | 497  | 1414   | 1505 | 451     | 1459    | 8281    | 91    | 91     | 1        | 1          | -1    | -1    |
```

 ### get average color in a region

```sh
# elements whose size is as big as the whole screen are ignored. To include them, use -v scan_full_size=1

screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=avg_color -v average_color=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | is_empty | centerx_le | avg_color_r | avg_color_g | avg_color_b |
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |      |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | -1          | -1          | -1          |
2             | 0     |      |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | -1          | -1          | -1          |
3             | 0     |      | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | -1          | -1          | -1          |
4             | 0     |      |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | -1          | -1          | -1          |
5             | 0     |      | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 1        | 1          | 16          | 20          | 46          |
...
31            | 0     |      | com.bluestacks.launcher:id/app_image_two        | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 406    | 497  | 1414   | 1505 | 451     | 1459    | 8281    | 91    | 91     | 1        | 1          | 136         | 80          | 73          |
```

## color range

### count color range

```sh
# elements whose size is as big as the whole screen are ignored. To include them, use -v scan_full_size=1
rgbrange is red_min, red_max, green_min, green_max, blue_min, blue_max 

screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=color_count -v rgbrange=250,255,250,255,240,255 -v count_one_color=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | is_empty | centerx_le | color_count |
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |      |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 0           |
2             | 0     |      |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 0           |
3             | 0     |      | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 0           |
4             | 0     |      |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 0           |
5             | 0     |      | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 1        | 1          | 40335       |
...
31            | 0     |      | com.bluestacks.launcher:id/app_image_two        | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 406    | 497  | 1414   | 1505 | 451     | 1459    | 8281    | 91    | 91     | 1        | 1          | 0           |
```


### check if a color range is present

```sh
# elements whose size is as big as the whole screen are ignored. To include them, use -v scan_full_size=1

rgbrange is red_min, red_max, green_min, green_max, blue_min, blue_max 
screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=is_there -v rgbrange=250,255,250,255,240,255 -v is_one_color_there=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | is_empty | centerx_le | is_there |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |      |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 0        |
2             | 0     |      |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 0        |
3             | 0     |      | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 0        |
4             | 0     |      |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | 0        |
5             | 0     |      | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 1        | 1          | 1        |
...
31            | 0     |      | com.bluestacks.launcher:id/app_image_two        | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 406    | 497  | 1414   | 1505 | 451     | 1459    | 8281    | 91    | 91     | 1        | 1          | 0        |
```


### average coordinates of a color range

```sh
# elements whose size is as big as the whole screen are ignored. To include them, use -v scan_full_size=1

rgbrange is red_min, red_max, green_min, green_max, blue_min, blue_max 

screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=avg -v rgbrange=250,255,250,255,240,255 -v get_avarage_coord=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | is_empty | centerx_le | avg_x | avg_y |
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1             | 0     |      |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | -1    | -1    |
2             | 0     |      |                                                 | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | -1    | -1    |
3             | 0     |      | android:id/content                              | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | -1    | -1    |
4             | 0     |      |                                                 | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   | 1        | 1          | -1    | -1    |
5             | 0     |      | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 1        | 1          | 417   | 210   |
...
31            | 0     |      | com.bluestacks.launcher:id/app_image_two        | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 406    | 497  | 1414   | 1505 | 451     | 1459    | 8281    | 91    | 91     | 1        | 1          | -1    | -1    |
b0q:/ $
```

# Colors without elements

```sh
# dump rgb data:
sh /sdcard/rgb/fastrgbdump.sh -x0 151 -y0 750 -x1 217 -y1 766
...
183,762,2,6,35 # x, y, r, g, b
184,762,2,6,35
...
# dump rgb data from region with already captured screen
screencap >/sdcard/rgb/capscreen.tmp
sh /sdcard/rgb/fastrgbdump.sh -f /sdcard/rgb/capscreen.tmp -x0 151 -y0 750 -x1 217 -y1 766
...
183,762,2,6,35 # x, y, r, g, b
184,762,2,6,35
...
# hexdump to a file
sh /sdcard/rgb/fastrgbdump.sh --onlyhexdump 1 >/sdcard/rgb/hexdump.tmp
sh /sdcard/rgb/fastrgbdump.sh -x /sdcard/rgb/hexdump.tmp -x0 151 -y0 750 -x1 217 -y1 766
...
183,762,2,6,35 # x, y, r, g, b
184,762,2,6,35
...
# count colors in a region
sh /sdcard/rgb/fastrgbdump.sh --colorcount 1 -x0 151 -y0 750 -x1 217 -y1 766
1056:2,6,35 # qty, r,g, b
# color at coordinate
sh /sdcard/rgb/fastrgbdump.sh -x0 151 -y0 750
151,750,2,6,35 # x, y, r, g, b

# search for colors in a region
sh /sdcard/rgb/fastrgbdump.sh --rgbcolors 255,255,255#2,6,35 -x0 151 -y0 750 -x1 317 -y1 766
2656:2,6,35
# check if any of the colors are in a region (returns 0 for true, 1 for false)
sh /sdcard/rgb/fastrgbdump.sh --inregion 1 --rgbcolors 2,6,35#255,255,255 -x0 151 -y0 750 -x1 317 -y1 766

```

# sorting

```sh

file="/sdcard/u.txt"
sortby="centery;area" # first centery 
numeric=1
sh /sdcard/elementparser/elementparser.sh | sh /sdcard/sortby/sortbycol.sh "$sortby" "$file" "$numeric" | awk -f /sdcard/printer/awk_pretty_print.awk

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text | resource-id                                        | class                                     | package    | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height |
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
25            | 1     |      | android:id/statusBarBackground                     | android.view.View                         | com.termux |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 36   | 450     | 18      | 32400   | 900   | 36     |
6             | 0     |      | com.termux:id/drawer_layout                        | androidx.drawerlayout.widget.DrawerLayout | com.termux |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 4      | 896  | 36     | 1486 | 450     | 761     | 1293400 | 892   | 1450   |
7             | 0     |      | com.termux:id/terminal_view                        | android.view.View                         | com.termux |              | false     | false   | false     | true    | true      | true    | false      | true           | false    | false    | 4      | 896  | 36     | 1486 | 450     | 761     | 1293400 | 892   | 1450   |
1             | 0     |      |                                                    | android.widget.FrameLayout                | com.termux |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   |
2             | 0     |      |                                                    | android.widget.FrameLayout                | com.termux |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   |
...
22            | 12    | ΓåÆ  |                                                    | android.widget.Button                     | com.termux |              | false     | false   | true      | true    | true      | false   | false      | false          | false    | false    | 641    | 769  | 1542   | 1598 | 705     | 1570    | 7168    | 128   | 56     |
```


# drop duplicates by columns

```sh
sh /sdcard/elementparser/elementparser.sh | awk -f "/sdcard/dropdu/dropdu.awk" -v columns="class" | awk -f /sdcard/printer/awk_pretty_print.awk
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text    | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height |
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
9             | 0     |         | com.bluestacks.launcher:id/searchRelativeLayout | android.widget.RelativeLayout             | com.bluestacks.launcher |              | false     | false   | true      | true    | true      | false   | false      | false          | false    | false    | 151    | 750  | 117    | 166  | 450     | 141     | 29351   | 599   | 49     |
5             | 0     |         | com.bluestacks.launcher:id/drawer_layout        | androidx.drawerlayout.widget.DrawerLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   |
34            | 0     |         | com.bluestacks.launcher:id/app_image_three      | android.widget.FrameLayout                | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 723    | 814  | 1414   | 1505 | 768     | 1459    | 8281    | 91    | 91     |
14            | 0     |         |                                                 | android.view.ViewGroup                    | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 44     | 856  | 202    | 1290 | 450     | 746     | 883456  | 812   | 1088   |
33            | 2     |         | com.bluestacks.launcher:id/appThreeLinearLayout | android.widget.LinearLayout               | com.bluestacks.launcher |              | false     | false   | true      | true    | true      | false   | false      | false          | false    | false    | 610    | 900  | 1401   | 1576 | 755     | 1488    | 50750   | 290   | 175    |
...
35            | 0     |         | com.bluestacks.launcher:id/popup_image_three    | android.widget.ImageView                  | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 788    | 811  | 1417   | 1440 | 799     | 1428    | 529     | 23    | 23     |
sh /sdcard/elementparser/elementparser.sh | awk -f "/sdcard/dropdu/dropdu.awk" -v columns="centerx,centery"  | awk -f /sdcard/printer/awk_pretty_print.awk
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                       | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height |
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
30            | 1     |                            | com.bluestacks.launcher:id/appTwoLinearLayout   | android.widget.LinearLayout | com.bluestacks.launcher |              | false     | false   | true      | true    | true      | false   | false      | false          | false    | false    | 293    | 610  | 1401   | 1576 | 451     | 1488    | 55475   | 317   | 175    |
35            | 0     |                            | com.bluestacks.launcher:id/popup_image_three    | android.widget.ImageView    | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 788    | 811  | 1417   | 1440 | 799     | 1428    | 529     | 23    | 23     |
20            | 5     |                            |                                                 | android.view.View           | com.bluestacks.launcher |              | false     | false   | true      | true    | true      | false   | false      | true           | false    | false    | 584    | 854  | 474    | 746  | 719     | 610     | 73440   | 270   | 272    |
25            | 0     |                            | com.bluestacks.launcher:id/allappsLinearLayout  | android.widget.LinearLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 1401   | 1576 | 450     | 1488    | 157500  | 900   | 175    |
32            | 1     | Primon Legion              | com.bluestacks.launcher:id/app_name_two         | android.widget.TextView     | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 293    | 610  | 1513   | 1576 | 451     | 1544    | 19971   | 317   | 63     |
...
21            | 2     |                            | com.bluestacks.launcher:id/dock                 | android.widget.LinearLayout | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 1367   | 1600 | 450     | 1483    | 209700  | 900   | 233    |
sh /sdcard/elementparser/elementparser.sh | awk -f "/sdcard/dropdu/dropdu.awk" -v columns="area,width" | awk -f /sdcard/printer/awk_pretty_print.awk
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                         | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height |
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
21            | 2     |                            | com.bluestacks.launcher:id/dock                 | android.widget.LinearLayout   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 1367   | 1600 | 450     | 1483    | 209700  | 900   | 233    |
14            | 0     |                            |                                                 | android.view.ViewGroup        | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 44     | 856  | 202    | 1290 | 450     | 746     | 883456  | 812   | 1088   |
37            | 1     |                            | com.bluestacks.launcher:id/viewBackground       | android.view.View             | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 1484   | 1600 | 450     | 1542    | 104400  | 900   | 116    |
36            | 1     | Anocris                    | com.bluestacks.launcher:id/app_name_three       | android.widget.TextView       | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 610    | 900  | 1513   | 1576 | 755     | 1544    | 18270   | 290   | 63     |
4             | 0     |                            |                                                 | android.widget.FrameLayout    | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 0      | 1600 | 450     | 800     | 1440000 | 900   | 1600   |
...
12            | 2     |                            | com.bluestacks.launcher:id/searchIcon           | android.widget.ImageView      | com.bluestacks.launcher | searchbar    | false     | false   | true      | true    | true      | false   | false      | false          | false    | false    | 712    | 731  | 131    | 150  | 721     | 140     | 361     | 19    | 19     |
```


# Interacting with elements 

## click / tap  
```sh
# click and random click
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="centerx" -v newcolumn="centerx_lt" -v lt=1 -v value=700 > /sdcard/resultsquery.txt
# click on the first element in the results 
sh /sdcard/interactions/tap_first_center_coords.sh --filename /sdcard/resultsquery.txt
# click on a random element in the results 
sh /sdcard/interactions/tap_first_center_coords.sh --filename /sdcard/resultsquery.txt --random 1

```

## typing 

```sh
# accents are replaced, newlines can be used 
sh /sdcard/interactions/inputtext.sh --text "Hello my friend\nbibi\nddx"
sh /sdcard/interactions/inputtext.sh --text "Hello my friend\nbibi\nddx" --min 100 --max 200 # default delay between 100 and 200 ms
sh /sdcard/interactions/inputtext.sh --text "Hello my friend\nbibi\nddx" --min 100 --max 200 --lettermin 1 --lettermax 3 # write between 1 and 3 letters at once 
```

## typing2

```sh
sh /sdcard/inevents/inputtextnatural.sh "Hoje vou sair!"
```

# shuffle stuff 

## shuffle results 

```sh
sh /sdcard/elementparser/elementparser.sh | awk -f /sdcard/series/seriesapply.awk -v column="centerx" -v newcolumn="centerx_lt" -v lt=1 -v value=700 > /sdcard/resultsquery.txt

sh /sdcard/useful/shufflestuff.sh --file /sdcard/resultsquery.txt --skipfirst 1 | awk -f /sdcard/printer/awk_pretty_print.awk # skips the header
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
element_index | index | text                       | resource-id                                     | class                                     | package                 | content-desc | checkable | checked | clickable | enabled | focusable | focused | scrollable | long-clickable | password | selected | startx | endx | starty | endy | centerx | centery | area    | width | height | centerx_lt |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
12            | 2     |                            | com.bluestacks.launcher:id/searchIcon           | android.widget.ImageView                  | com.bluestacks.launcher | searchbar    | false     | false   | true      | true    | true      | false   | false      | false          | false    | false    | 712    | 731  | 131    | 150  | 721     | 140     | 361     | 19    | 19     | 0          |
32            | 1     | Primon Legion              | com.bluestacks.launcher:id/app_name_two         | android.widget.TextView                   | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 293    | 610  | 1513   | 1576 | 451     | 1544    | 19971   | 317   | 63     | 1          |
7             | 0     |                            |                                                 | android.view.View                         | com.bluestacks.launcher |              | false     | false   | false     | true    | false     | false   | false      | false          | false    | false    | 0      | 900  | 36     | 1600 | 450     | 818     | 1407600 | 900   | 1564   | 1          |
16            | 1     |                            |                                                 | android.view.View                         | com.bluestacks.launcher |              | false     | false   | true      | true    | true      | false   | false      | true           | false    | false    | 314    | 584  | 202    | 474  | 449     | 338     | 73440   | 270   | 272    | 1          |
17            | 2     |                            |                                                 | android.view.View                         | com.bluestacks.launcher |              | false     | false   | true      | true    | true      | false   | false      | true           | false    | false    | 584    | 854  | 202    | 474  | 719     | 338     | 73440   | 270   | 272    | 0          |


sh /sdcard/useful/shufflestuff.sh --file /sdcard/resultsquery.txt --skipfirst 0 | awk -f /sdcard/printer/awk_pretty_print.awk
```

## get true / false of a certain percentage 

```sh
# returns 30% 0 and 70% 1
sh /sdcard/useful/shufflestuff.sh --percentage 30 
```


## non greedy regex  (kind of)
```sh
string="oioioibabapooiba"
regularexpression="oi.*ba"
findshortest=0
sh /sdcard/regex/regexnongreedy.sh "$regularexpression" "$findshortest" "$string"
# oioioiba
string="oioioibabapooiba"
regularexpression="oi.*ba"
findshortest=1
sh /sdcard/regex/regexnongreedy.sh "$regularexpression" "$findshortest" "$string"
# oiba
```

## sendevent tap 

```sh
# fromn the second time on, it is faster when you use the same config
awk -f /sdcard/interactions/sendeventtap.awk -v x=212 -v y=126 -v devi=event4 -v m=32767 -v w=1600 -v h=900

# if you don't know m (takes a little longer)
awk -f /sdcard/interactions/sendeventtap.awk -v x=212 -v y=126 -v devi=event4 -v w=1600 -v h=900

# if you don't know m, w, h (takes a little longer)
awk -f /sdcard/interactions/sendeventtap.awk -v x=214 -v y=126 -v devi=event4
```

## sendevent keyboard

```sh
awk -f /sdcard/interactions/sendeventkeys.awk -v event="EV_KEY" -v keycode="KEY_Q" -v devi="/dev/input/event3" -v duration=1
awk -f /sdcard/interactions/sendeventkeys.awk -v event="EV_KEY" -v keycode="KEY_A" -v devi="/dev/input/event3" -v duration=1
```



## random swipe
```sh
# everything in percent except the last 4 values 
sh /sdcard/inevents/swipe_randomly.sh 70 80 45 47 30 40 45 47 1000 3000 5 10
# the values that have to be passed: "$start_height1" "$start_height2" "$start_width1" "$start_width2" "$end_height1" "$end_height2" "$end_width1" "$end_width2" "$swipemintime" "$swipemaxtime" "$min_repeat" "$max_repeat"
```

## random swipe with check
```sh
# checks if still can be scrolled, changes direction if it is not possible anymore
i=0
while [ "$i" -lt 10 ]; do
    sh /sdcard/showscrolls/swipewithcheck.sh 70 80 45 47 30 40 45 47 1000 3000 5 10 8
    sh /sdcard/showscrolls/swipewithcheck.sh 30 40 45 47 70 80 45 47 1000 3000 5 10 8
    i=$((i + 1))
    sleep 1
done
```

## grant / revoke permissions
```sh
sh /sdcard/useful/grantrevoke.sh --package com.termux --grant 0
sh /sdcard/useful/grantrevoke.sh --package com.termux --grant 1
```

## firefox autoinstall + permissions
```sh
sh /sdcard/ffox/installfirefox.sh
```

## firefox downloader
```sh
# file + timeout
sh /sdcard/firefoxdownload.sh https://github.com/hansalemaos/Magisk_collection/raw/main/TotalCommander_3.42beta5-1183_minAPI8_arm64-v8a.apk 60
```

## array contains

```sh
array_of_numbers=( "1" "2" "3" )
needle1="3"
sh /sdcard/useful/array_contains.sh "1" "${array_of_numbers[@]}"
```

## join array

```sh
array_of_numbers=( "1" "2" "3" )
sh /sdcard/useful/array_to_string.sh ", " "${array_of_numbers[@]}"
```

## get random number between

```sh
sh /sdcard/useful/get_random_number_between.sh 100 200
```

## Generate regex for numbers

```sh
sh /sdcard/useful/get_range.sh 100 2000
```

## join str with one char
```sh
sh /sdcard/useful/joinsinglechar.sh /sdcard/u.txt "X"
```

## remove charset from string
```sh
sh /sdcard/useful/remove_charset_from_string.sh "The Quick Brown Fox" "[aeiou]"
```

## strip quotes
```sh
sh /sdcard/useful/strip_quotes.sh ""sdfsdfsd'""
```

## split at delimiter
```sh
sh /sdcard/useful/split_string_at.sh "baba,bddd,ba" ","
```

## trim string
```sh
sh /sdcard/useful/trim_string.sh "bbdsa "
```

## maketouch
```sh
sh /sdcard/useful/make_touch.sh /sdcard/bibi/baba/sh
```

## get display height/width
```sh
read width height <<< $(sh /sdcard/useful/getwidthheight.sh)
```


## check internet connection
```sh
if result > 0 -> working

sh /sdcard/useful/internetconnectioncheck.sh
```

## get random line from file
```sh
sh /sdcard/useful/randomlinefromfile.sh /sdcard/u.txt
```

## get line from file (starting at 1)
```sh
sh /sdcard/useful/get_line_from_file.sh 1 /sdcard/u.txt
```

## generate password
```sh
sh /sdcard/useful/generatepassword.sh 16
# )H0HUt$S+4*&rOx*
```

## check if keyboard shown
```sh
returns 0 if shown, else 1

sh /sdcard/inevents/iskeyboardshown.sh
```

## common and different lines in 2 files
```sh
sh  /sdcard/uniqueandcommon.sh /sdcard/u.sh /sdcard/p.txt
```

## generate email 

```sh
saveinfile="/sdcard/emailaccount.txt"
lastnames="/sdcard/lastnames.csv"
firstnames_male="/sdcard/firstnames_male.csv"
firstnames_female="/sdcard/firstnames_female.txt"
sh generateemail "$saveinfile" "$lastnames" "$firstnames_male" "$firstnames_female"
```

## analyze elements - find element changes 

```sh
# arguments: first capture / second capture / difference / parser 
sh /sdcard/printer/getelementdifference.sh /sdcard/ele1.txt /sdcard/ele2.txt /sdcard/elediff2.txt /sdcard/fragmentparser/awkparser.sh
cat /sdcard/elediff2.txt

sh /sdcard/printer/getelementdifference.sh /sdcard/ele1.txt /sdcard/ele2.txt /sdcard/elediff3.txt sh /sdcard/elementparser/elementparser.sh
cat /sdcard/elediff3.txt
```

## random sleep
```sh
# sleeps 10 times between 0.0 and 0.2 seconds
sh /sdcard/useful/randomsleep.sh 10
```

## check top activity 

```sh
sh /sdcard/useful/topactivitycontains.sh instagram
```

## test keyevents 

```sh
# return/y/Y == yes
sh /sdcard/useful/testkeyevents.sh
```

## template - awk get path of executed script 
```sh
awk -f /sdcard/useful/templateawkgetownpath.awk
```

## execute python scripts using termux 
```python
# copy to /sdcard/testpycommand.py
from time import sleep
i=0
while True:
    print (f"test {i}")
    sleep(.1)
    i+=1
    if i>10:
        break
```

```sh
# execute in termux
sh /sdcard/termuxstuff/termuxexe.sh --termux 1 --sleep 1 --split "#"

# execute in the shell
sh /sdcard/termuxstuff/termuxexe.sh --termux 0 --sleep 1 --split "#" --pythonscript testpycommand.py
```
