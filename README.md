# XIIIOUSZ

## README

### SETUP

---

add the command in .bahsrc file to create global variable called XIIIOUSZ mapped to xiiious.sh

`export XIIIOUSZ=$HOME/Documents/GitHub/xiiiousz/xiiiousz/xiiiousz.sh`

`export XIIIOUSZ_HOME=$HOME/Documents/GitHub/xiiiousz/xiiiousz`

execute the command below to execute changes in bahsrc file

`source ~/.bashrc`

check whether changes has been applied to the .bashrc file

`echo "$XIIIOUSZ"`

`echo "$XIIIOUSZ"_HOME`

`chmod -R +rx $XIIIOUSZ_HOME `

to use, put the below code at the top of your newly created bash script

`source "$XIIIOUSZ"`

change directories, theme and others in user folder

`ie. directories.sh, theme.sh, functions.sh, other.sh`

---

### PACKAGE

---

#### USE All

---

must add on top of bash file
`source "$XIIIOUSZ"`
`xiiiousz "~"`

---

#### xiiiousz_bashful

---

##### Package in xiiiousz_bashful

###### xiiiousz_ui

[colours](./xiiiousz/bashful/ui/package/colours.sh)

[fonts](./xiiiousz/bashful/ui/package/fonts.sh)

[list](./xiiiousz/bashful/ui/package/list.sh)

[loading_animation](./xiiiousz/bashful/ui/package/loading_animation.sh)

[menu](./xiiiousz/bashful/ui/package/menu.sh)

[others](./xiiiousz/bashful/ui/package/others.sh)

[progress](./xiiiousz/bashful/ui/package/progress.sh)

[tittle](./xiiiousz/bashful/ui/package/title.sh)

---

###### xiiiousz_utils

[array_utils](./xiiiousz/bashful/utils/package/array_utils.sh)

[common_utils](./xiiiousz/bashful/utils/package/common_utils.sh)

[date_utils](./xiiiousz/bashful/utils/package/date_utils.sh)

[excel_utils](./xiiiousz/bashful/utils/package/excel_utils.sh)

[file_utils](./xiiiousz/bashful/utils/package/file_utils.sh)

[input_validator](./xiiiousz/bashful/utils/package/input_validator.sh)

[object_utils](./xiiiousz/bashful/utils/package/object_utils.sh)

[others](./xiiiousz/bashful/utils/package/others.sh)

[string_utils](./xiiiousz/bashful/utils/package/string_utils.sh)

---

##### TO USE

---

1. must add on top of bash file
   `source "$XIIIOUSZ"`
   `xiiiousz "bashful"`
2. import all (`xiiiousz_bashful` should be on top of import by its subsequent package)
   `xiiiousz_bashful "~"` or by package `xiiiousz_bashful "ui" "utils"`

if import by package, you can:-

1. import based on what sub-package you are using. example: ui
   `xiiiousz_bashful_ui "colours" "loading_animation"`
2. import all in package utils.
   `xiiiousz_bashful_utils "~"`

...
