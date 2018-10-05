ifndef ROLLCOMPILER
  ROLLCOMPILER = gnu
endif
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))

ifndef ROLLMPI
  ROLLMPI = rocks-openmpi
endif
MPINAME := $(firstword $(subst /, ,$(ROLLMPI)))

NAME           = sdsc-abyss
VERSION        = 2.1.1
RELEASE        = 0
PKGROOT        = /opt/abyss

SRC_SUBDIR     = abyss

SOURCE_NAME    = abyss
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

SPARSEHASH_NAME    = sparsehash
SPARSEHASH_SUFFIX  = zip
SPARSEHASH_VERSION = 2.0.3
SPARSEHASH_PKG     = $(SPARSEHASH_NAME)-$(SPARSEHASH_VERSION).$(SPARSEHASH_SUFFIX)
SPARSEHASH_DIR     = $(SPARSEHASH_PKG:%.$(SPARSEHASH_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)
ZIP_PKGS       = $(SPARSEHASH_PKG)

RPM.EXTRAS     = AutoReq:No
RPM.PREFIX     = $(PKGROOT)
