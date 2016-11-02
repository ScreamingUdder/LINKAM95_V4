TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = LINKAM95_V4
# LINKAM95_V4.dbd will be created and installed
DBD += LINKAM95_V4.dbd

# LINKAM95_V4.dbd will be made up from these files:
LINKAM95_V4_DBD += base.dbd

# Include dbd files from all support applications:
#LINKAM95_V4_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#LINKAM95_V4_LIBS += xxx

# LINKAM95_V4_registerRecordDeviceDriver.cpp derives from LINKAM95_V4.dbd
LINKAM95_V4_SRCS += LINKAM95_V4_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
LINKAM95_V4_SRCS_DEFAULT += LINKAM95_V4Main.cpp
LINKAM95_V4_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#LINKAM95_V4_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
LINKAM95_V4_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

