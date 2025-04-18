#!/bin/bash

CURRENT_DATE=$(date +%Y-%m-%d-%H%M) # be this date format -> 2025-01-11-1234 
SCREEN_NAME= # set screen session name here
SERVER_DIR= # set Server dir pass
WORLD_DIR= # set Server World dir pass
BUCKUP_DIR= # backuped files are save this dir
ZIPNAME=world{$CURRENT_DATE}.zip # set name as zipped world data

set -e

echo Backup Process is Starting # to command-rine
screen -RdS $SCREEN_NAME -X stuff 'say §dServer Backup is Starting!'`echo -ne '\015'` # to SCREEN_NAME
cd $SERVER_DIR

echo Saving World Data... # to command-rine
screen -RdS $SCREEN_NAME -X stuff 'say §dSaving World Data...'`echo -ne '\015'` # to SCREEN_NAME
zip -q -r $SERVER_DIR/$ZIPNAME $WORLD_DIR # archiving to zip then this here

mv $ZIPNAME $BUCKUP_DIR # move zipped file to BUCKUP_DIR from SERVER_DIR
echo Backup Process is Done # to command-rine
screen -RdS $SCREEN_NAME -X stuff 'say §dServer Backup is Done!'`echo -ne '\015'` # to SCREEN_NAME
