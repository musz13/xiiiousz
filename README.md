# XIIIOUSZ

## README

### SETUP

---

add the command in .bahsrc file to create global variable called XIIIOUSZ mapped to xiiious.sh

`export XIIIOUSZ=$HOME/Documents/GitHub/xiiiousz/xiiiousz/xiiiousz.sh`

`export XIIIOUSZ_HOME=$HOME/Documents/GitHub/xiiiousz`

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

"colours"

"loading_animation"

"menu""list"

---

###### xiiiousz_utils

"input_validator"E/Documents/log-files/Mobilelife/current/Production/2024/02_February/2024-02-16"
GREPFUL_OUTPUT_DIRECTORY="$XIIIOUSZ_HOME/grepful/file/output"

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
