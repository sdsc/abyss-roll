NAME	= abyss_$(ROLLMPI)_$(ROLLNETWORK)
RELEASE	= 1

SRC_SUBDIR	= abyss

ABYSS_NAME	= abyss
ABYSS_VERSION	= 1.3.7
ABYSS_SOURCE	= $(ABYSS_NAME)-$(ABYSS_VERSION).tar.gz

BOOST_NAME	= boost
BOOST_VERSION	= 1_50_0
BOOST_SOURCE	= $(BOOST_NAME)_$(BOOST_VERSION).tar.gz

TAR_GZ_PKGS	= $(ABYSS_SOURCE) $(BOOST_SOURCE)
