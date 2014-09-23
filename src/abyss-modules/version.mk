NAME        = abyss-modules
RELEASE     = 1
PKGROOT     = /opt/modulefiles/applications/abyss

VERSION_SRC = $(REDHAT.ROOT)/src/abyss/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

RPM.EXTRAS = AutoReq:No
