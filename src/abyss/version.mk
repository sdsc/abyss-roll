ROLLCOMPILER = gnu

ifndef ROLLMPI
  ROLLMPI = openmpi
endif

ifndef ROLLNETWORK
  ROLLNETWORK = eth
endif

NAME           = sdsc-abyss_$(ROLLMPI)_$(ROLLNETWORK)
VERSION        = 1.3.7
RELEASE        = 2
PKGROOT        = /opt/abyss

SRC_SUBDIR     = abyss

SOURCE_NAME    = abyss
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
