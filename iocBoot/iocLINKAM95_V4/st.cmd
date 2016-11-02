#!../../bin/linux-x86_64/LINKAM95_V4

## You may have to change LINKAM95_V4 to something else
## everywhere it appears in this file

#< envPaths

epicsEnvSet "STREAM_PROTOCOL_PATH" "../../protocol/devlinkam95.proto"

## Register all support components
dbLoadDatabase("../../dbd/LINKAM95_V4.dbd",0,0)
LINKAM95_V4_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/LINKAM95_V4.db","")

iocInit()

## Start any sequence programs
#seq sncLINKAM95_V4,"user=mjc23"
