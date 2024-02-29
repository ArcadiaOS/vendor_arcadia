PRODUCT_VERSION_MAJOR = 14
PRODUCT_VERSION_MINOR = 0

# Increase Arcadia Version with each major release.
ARCADIA_VERSION := Unleashed

# ArcadiaOS maintainer flags
ARCADIA_MAINTAINER ?= Unknown

# ArcadiaOS sign
ARCADIA_BUILD_TYPE ?= Unofficial

ifeq ($(ARCADIA_BUILD_TYPE), Official)
	OFFICIAL_DEVICES = $(shell cat vendor/lineage/arcadia.devices)
	FOUND_DEVICE =  $(filter $(LINEAGE_BUILD), $(OFFICIAL_DEVICES))
	ifeq ($(FOUND_DEVICE),$(LINEAGE_BUILD))
		ARCADIA_BUILD_TYPE := Official
	else
		ARCADIA_BUILD_TYPE := Unofficial
	endif
endif

# Gapps
ifeq ($(WITH_GMS), true)
	ARCADIA_BUILD_VARIANT := Gapps
else
	ARCADIA_BUILD_VARIANT := Vanilla
endif

# Internal version
LINEAGE_VERSION := ArcadiaOS-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date +%Y%m%d)-$(LINEAGE_BUILD)-v$(ARCADIA_VERSION)-$(ARCADIA_BUILD_VARIANT)

# Display version
LINEAGE_DISPLAY_VERSION := ArcadiaOS-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(LINEAGE_BUILD)-v$(ARCADIA_VERSION)
