#!../../bin/windows-x64/LINKAM95_V4-IOC-01

## You may have to change LINKAM95_V4-IOC-01 to something else
## everywhere it appears in this file

# Increase this if you get <<TRUNCATED>> or discarded messages warnings in your errlog output
errlogInit2(65536, 256)

< envPaths

epicsEnvSet "STREAM_PROTOCOL_PATH" "$(LINKAM95)/linkam95Sup"
epicsEnvSet "DEVICE" "L0"

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/LINKAM95_V4-IOC-01.dbd"
LINKAM95_V4_IOC_01_registerRecordDeviceDriver pdbbase

##ISIS## Run IOC initialisation 
< $(IOCSTARTUP)/init.cmd

##drvAsynSerialPortConfigure("$(DEVICE)", "$(PORT)", 0, 0, 0, 0)
##asynSetOption("$(DEVICE)", -1, "baud", "$(BAUD=19200)")
##asynSetOption("$(DEVICE)", -1, "bits", "$(BITS=8)")
##asynSetOption("$(DEVICE)", -1, "parity", "$(PARITY=none)")
##asynSetOption("$(DEVICE)", -1, "stop", "$(STOP=1)")
##asynOctetSetInputEos("$(DEVICE)", -1, "$(OEOS=\r)")
##asynOctetSetOutputEos("$(DEVICE)", -1, "$(IEOS=\r)")

## Only interested in simulation
drvAsynIPPortConfigure("$(DEVICE)", "localhost:57677")

## Load record instances

##ISIS## Load common DB records 
< $(IOCSTARTUP)/dbload.cmd

## Load our record instances
dbLoadRecords("db/LINKAM95.db","P=$(MYPVPREFIX)$(IOCNAME):, port=$(DEVICE)")

##ISIS## Stuff that needs to be done after all records are loaded but before iocInit is called 
< $(IOCSTARTUP)/preiocinit.cmd

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs

##ISIS## Stuff that needs to be done after iocInit is called e.g. sequence programs 
< $(IOCSTARTUP)/postiocinit.cmd

## Start PVA server for V4 support
startPVAServer