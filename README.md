# LINKAM95_V4
A PVAccess enabled version of the IBEX IOC which is set to run in simulation mode

There are two "main" branches:
* master - which should work on linux (and Windows probably) once the RELEASE file has been adjusted
	* Requires asyn, sscan, calc, pcre(?) and streamdevice (in that order)
	* Just installing the APS's SynApps package will add all of these (except pcre?)
	* I found it difficult to include pcre but I think we don't need it
* ibex_version - drop the code into the ioc\master folder of IBEX and build it and it should work. It has to be built separately as IBEX's build will ignore it

## Running lewis

`./lewis.py -p stream linkam_t95 -- --bind-address localhost --port 57677`

## Running the IOC

From iocBoot/iocLINKAM95_V4

`../../bin/linux-x86_64/LINKAM95_V4 st.cmd`

## Reading a PV

`/opt/epics/modules/pvAccessCPP/bin/linux-x86_64/pvget THIS_PC:TEMP`

## Setting a PV

`/opt/epics/modules/pvAccessCPP/bin/linux-x86_64/pvput THIS_PC:TEMP:SP 45`

