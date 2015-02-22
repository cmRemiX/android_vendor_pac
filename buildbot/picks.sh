#!/bin/bash -e
. build-config
FW=$REPODIR/frameworks
FWBASE=$FW/base
EXTERNAL=$REPODIR/external
BLUEDROID=$EXTERNAL/bluetooth/bluedroid
SUPERUSER=$EXTERNAL/koush/Superuser
APPS=$REPODIR/packages/apps
SETTINGS=$APPS/Settings
MMS=$APPS/Mms
PHONE=$APPS/Phone
TORCH=$APPS/Torch
DESKCLOCK=$APPS/DeskClock
VENDOR=$REPODIR/vendor/cmremix
echo "Pulling your cherry-picks"
cd $VENDOR
#Add Vendor/vendor commits here
cd $FWBASE
#Add Frameworks/base commits here

#End commits here
cd $BLUEDROID
#Add Bluedroid commits here

#End commits here
cd $SUPERUSER
#Add Superuser commits here

#End commits here
cd $SETTINGS
#Add commits here

#End commits here
cd $MMS
#Add commits here

#End commits here
cd $PHONE
#Add commits here

#End commits here
cd $TORCH
#Add commits here

#End commits here
cd $DESKCLOCK
#Add commits here

#End commits here
echo "Starting to build your rom"
echo "Please be patient"
cd $SOURCE
