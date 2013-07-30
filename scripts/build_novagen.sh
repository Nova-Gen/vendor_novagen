#!/bin/bash

function usage {
        echo "usage: `basename $0` [options]"
        echo " -d device"
        echo " -s sync"
        echo " -t threads"
        echo " -c clean"
	echo " -z use cache"
}

while getopts "hd:st:cz" opt; do
  case $opt in
    d)
      DEVICE=$OPTARG
      ;;
    s)
      SYNC=sync
      ;;
    t)
      THREADS=$OPTARG
      echo "threads: $THREADS"
      ;;
    r)
      regexp=$OPTARG
      ;;
    c)
      CLEAN=clean
      ;;
    z)
      echo "using ccache..."
      export USE_CCACHE=1
      ;;
    h)
      usage
      exit
      ;;
    \?)
      echo "Invalid option: -$OPTARG"
      ;;
  esac
done

if [ "$JAVA_HOME" == "" ]; then
	echo -e "${red}JAVA_HOME environment variable not set. Cannot continue build!"
	exit 1
fi

if [ "$DEVICE" == "" ]; then
	usage
	exit
fi

# Setup Linaro symlinks
LINARO_DIR=linaro-4.7
#LINARO_DIR=linaro-4.6
cd prebuilts/gcc/linux-x86/arm
if test -h arm-eabi-4.7; then
        rm arm-eabi-4.7
fi
ln -s $LINARO_DIR arm-eabi-4.7
if test -h arm-eabi-4.6; then
        rm arm-eabi-4.6
fi
ln -s $LINARO_DIR arm-eabi-4.6
if test -h arm-linux-androideabi-4.7; then
        rm arm-linux-androideabi-4.7
fi
ln -s $LINARO_DIR arm-linux-androideabi-4.7
if test -h arm-linux-androideabi-4.6; then
        rm arm-linux-androideabi-4.6
fi
ln -s $LINARO_DIR arm-linux-androideabi-4.6
cd ../../../../

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

# Time of build startup
res1=$(date +%s.%N)

echo -e "${red}Building ${bldred}NovaGen Nightly ${txtrst}";
echo -e ""
echo -e -n "${txtrst}${cya}"
echo -e ' __    __                                ______'
echo -e '|  \  |  \                              /      \                     '
echo -e '| $$\ | $$  ______  __     __  ______  |  $$$$$$\  ______   _______  '
echo -e '| $$$\| $$ /      \|  \   /  \|      \ | $$ __\$$ /      \ |       \ '
echo -e '| $$$$\ $$|  $$$$$$\\\$$\  / $$ \$$$$$$\| $$|    \|  $$$$$$\| $$$$$$$\'
echo -e '| $$\$$ $$| $$  | $$ \$$\  $$ /      $$| $$ \$$$$| $$    $$| $$  | $$'
echo -e '| $$ \$$$$| $$__/ $$  \$$ $$ |  $$$$$$$| $$__| $$| $$$$$$$$| $$  | $$'
echo -e '| $$  \$$$ \$$    $$   \$$$   \$$    $$ \$$    $$ \$$     \| $$  | $$'
echo -e ' \$$   \$$  \$$$$$$     \$     \$$$$$$$  \$$$$$$   \$$$$$$$ \$$   \$$'
echo -e "${txtrst}"

# sync with latest sources
echo -e ""
if [ "$SYNC" == "sync" ]
then
   echo -e "${bldblu}Syncing latest NovaGen sources ${txtrst}"
   repo sync -j"$THREADS"
   echo -e ""
fi

if test -d out; then
	echo -e "${red}build cannot continue; directory 'out' is present"
	exit 1
fi

mv out.$DEVICE out

# setup environment
if [ "$CLEAN" == "clean" ]
then
   echo -e "${bldblu}Cleaning up out folder ${txtrst}"
   make clobber
else
  echo -e "${bldblu}Skipping out folder cleanup ${txtrst}"
fi


# setup environment
echo -e "${bldblu}Setting up build environment ${txtrst}"
. build/envsetup.sh

# lunch device
echo -e ""
echo -e "${bldblu}Lunching your device ${txtrst}"
lunch "novagen_$DEVICE-userdebug";

echo -e ""
echo -e "${bldblu}Starting NovaGen build for $DEVICE ${txtrst}"

# start compilation
breakfast "novagen_$DEVICE-userdebug"
mka -j$THREADS bacon
echo -e ""

mv out out.$DEVICE

# finished? get elapsed time
res2=$(date +%s.%N)
echo "${bldgrn}Total time elapsed: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"
