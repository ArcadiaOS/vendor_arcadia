PRODUCT_VERSION_MAJOR = 14
PRODUCT_VERSION_MINOR = 0

# Increase Arcadia Version with each major release.
ARCADIA_VERSION := Unleashed

# ArcadiaOS maintainer flags
ARCADIA_MAINTAINER ?= Unknown

# ArcadiaOS sign
ARCADIA_BUILD_TYPE ?= Unofficial

ARCADIA_GAPPS := $(WITH_GMS)

ifeq ($(WITH_GMS), true)
  $(call inherit-product-if-exists, vendor/google/gms/config.mk)
  $(call inherit-product-if-exists, vendor/google/pixel/config.mk)
  ARCADIA_BUILD_VARIANT := Gapps
else
  ARCADIA_BUILD_VARIANT := Vanilla
endif

ifeq ($(ARCADIA_BUILD_TYPE), Official)
  OFFICIAL_DEVICES = $(shell cat vendor/lineage/arcadia.devices)
  FOUND_DEVICE =  $(filter $(LINEAGE_BUILD), $(OFFICIAL_DEVICES))
    ifeq ($(FOUND_DEVICE),$(LINEAGE_BUILD))
      ARCADIA_BUILD_TYPE := Official
    else
      ARCADIA_BUILD_TYPE := Unofficial
    endif
endif

# Internal version
LINEAGE_VERSION := ArcadiaOS-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(ARCADIA_VERSION)-$(LINEAGE_BUILD)-$(ARCADIA_BUILD_TYPE)-$(ARCADIA_BUILD_VARIANT)-$(shell date +%Y%m%d)

# Display version
LINEAGE_DISPLAY_VERSION := ArcadiaOS-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(LINEAGE_BUILD)-$(ARCADIA_VERSION)-$(ARCADIA_BUILD_TYPE)-$(ARCADIA_BUILD_VARIANT)

# Build info
ARCADIA_BUILD_INFO := $(LINEAGE_VERSION)