#!/bin/bash

USER_DEFAULT_DIRECTORIES="$HOME/Desktop"
USER_DEFAULT_OUTPUT_DIRECTORIES="$HOME/Desktop"
GREPFUL_SOURCE_DIRECTORY="$HOME/Documents/log-files/Mobilelife/current/Production/2024/02_February/2024-02-16"
GREPFUL_OUTPUT_DIRECTORY="$XIIIOUSZ_HOME/grepful/file/output"
XIIIOUSZ_DEFAULT_INPUT_DIRECTORY="$HOME/Documents/log-files/Mobilelife/current/Production/2024/02_February"
XIIIOUSZ_DEFAULT_OUTPUT_DIRECTORY="$HOME/Documents/Bugs/MOBILELIFE/PROD-ISSUE/optimistic-locking/output"
CURRENT_DATE=$(date +"%d-%m-%Y")

# info: CBP
# Created Bundle
CBP_CREATE_BUNDLE_OUTPUT="$HOME/Desktop/bundle/output"
CBP_CREATE_BUNDLE_INPUT="$HOME/Desktop/bundle/input"
# Generate .war file
CBP_CREATE_WAR_OUTPUT="$HOME/Desktop/Deploy/output"
CBP_CREATE_WAR_INPUT="$HOME/Desktop/Deploy/input"
# Copy log files
CBP_LOG_OUTPUT="$HOME/Desktop/logs/output"

MY_CBP_EXTERNAL_CONFIG="$HOME/etc/cbp/"
CBP_UTILS_BASH_DIR="$HOME/Documents/GitHub/iMocha/CBP/bash-script/CBP-UTILS"

# MBIB
MBIB_PATH="$HOME/workspace/cbp/mbib"
ALL_MBIB_REPO=("$MBIB_PATH/ibs" "$MBIB_PATH/ibutils" "$MBIB_PATH/core" "$MBIB_PATH/rib" "$MBIB_PATH/bo" "$MBIB_PATH/deployment" "$MBIB_PATH/notification" "$MBIB_PATH/helocbp")

# CIB
CIB_PATH="$HOME/workspace/cbp/cib"
ALL_CIB_REPO=("$CIB_PATH/ibs" "$CIB_PATH/cib" "$CIB_PATH/bo" "$CIB_PATH/vizardry/bo" "$CIB_PATH/vizardry/bpm" "$CIB_PATH/vizardry/core" "$CIB_PATH/vizardry/ddbo" "$CIB_PATH/vizardry/ddsvc" "$CIB_PATH/vizardry/entrust" "$CIB_PATH/vizardry/ezmcom" "$CIB_PATH/vizardry/filemapper" "$CIB_PATH/vizardry/hsm" "$CIB_PATH/vizardry/ibs" "$CIB_PATH/vizardry/ibutils" "$CIB_PATH/vizardry/report" "$CIB_PATH/vizardry/soa" "$CIB_PATH/vizardry/ui-commons" "$CIB_PATH/deployment" "$CIB_PATH/helobiz")

# info: EMPOWERPLUS
EP_UTILS_BASH_DIR="$HOME/Documents/GitHub/WORK/HATIO/SCRIPTS/EmpowerPlus"
