#!/bin/bash

# Colorize and add text parameters
red=$(tput setaf 1)             #  red
grn=$(tput setaf 2)             #  green
cya=$(tput setaf 6)             #  cyan
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) #  red
bldgrn=${txtbld}$(tput setaf 2) #  green
bldblu=${txtbld}$(tput setaf 4) #  blue
bldcya=${txtbld}$(tput setaf 6) #  cyan
txtrst=$(tput sgr0)             # Reset

DEVICE="$1"
SYNC="$2"
THREADS="$3"
CLEAN="$4"

# Build Date/Version
VERSION=`date +%Y%m%d`


# Time of build startup
res1=$(date +%s.%N)

echo -e "${cya}Building ${bldcya}Vanilla NovaGen Nightly-$VERSION ${txtrst}";
echo -e ""
echo -e ""
echo -e "${bldred}**************************************"
echo -e "*                                    *"
echo -e "* n    n                             *"
echo -e "* nn   n   oooo   v       v    a     *"
echo -e "* n n  n  o    o   v     v    a a    *"
echo -e "* n  n n  o    o    v   v    a   a   *"
echo -e "* n   nn  o    o     v v    a aaa a  *"
echo -e "* n    n   oooo       v    a       a *"
echo -e "*                                    *"
echo -e "${bldgrn}*        ggg                         *"
echo -e "*       g       eeee   n   n         *"
echo -e "*       g  gg   e      nn  n         *"
echo -e "*       g   g   eeee   n n n         *"
echo -e "*       g   g   e      n  nn         *"
echo -e "*        ggg    eeeee  n   n         *"
echo -e "*                                    *"
echo -e "**************************************${txtrst}"

# sync with latest sources
echo -e ""
if [ "$SYNC" == "sync" ]
then
   echo -e "${bldblu}Syncing latest NovaGen sources ${txtrst}"
   repo sync -j"$THREADS"
   echo -e ""
fi

# setup environment
if [ "$CLEAN" == "clean" ]
then
   echo -e "${bldblu}Cleaning up out folder ${txtrst}"
   make clobber;
else
  echo -e "${bldblu}Skipping out folder cleanup ${txtrst}"
fi


# setup environment
echo -e "${bldblu}Setting up build environment ${txtrst}"
. build/envsetup.sh

# lunch device
echo -e ""
echo -e "${bldblu}Lunching your device ${txtrst}"
lunch "rootbox_$DEVICE-userdebug";

echo -e ""
echo -e "${bldblu}Starting NovaGen build for $DEVICE ${txtrst}"

# start compilation
brunch "rootbox_$DEVICE-userdebug" -j"$THREADS";
echo -e ""

# finished? get elapsed time
res2=$(date +%s.%N)
echo "${bldgrn}Total time elapsed: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"
