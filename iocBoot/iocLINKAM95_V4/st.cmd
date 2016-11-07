#!../../bin/linux-x86_64/LINKAM95_V4

## You may have to change LINKAM95_V4 to something else
## everywhere it appears in this file

#< envPaths

epicsEnvSet "STREAM_PROTOCOL_PATH" "../../protocol/"

## Register all support components
dbLoadDatabase("../../dbd/LINKAM95_V4.dbd",0,0)
LINKAM95_V4_registerRecordDeviceDriver(pdbbase) 

drvAsynIPPortConfigure("P0", "localhost:57677")

## Load record instances
dbLoadRecords("../../db/LINKAM95.db","P=THIS_PC:, port=P0")

iocInit()

