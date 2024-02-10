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

---

### PACKAGE

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

"input_validator"

---

##### TO USE

---

must add on top of bash file

`source "$XIIIOUSZ"`

`xiiiousz"bashful"`

`xiiiousz_bashful "ui" "utils"`

import based on what package you are using. example: ui

`xiiiousz_ui "colours" "loading_animation"`
