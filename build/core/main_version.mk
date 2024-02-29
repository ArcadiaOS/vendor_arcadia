# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# ArcadiaOS System Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.arcadia.build.version=$(LINEAGE_VERSION) \
    ro.arcadia.display.version=$(LINEAGE_DISPLAY_VERSION) \
    ro.arcadia.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.arcadia.maintainer=$(ARCADIA_MAINTAINER) \
    ro.arcadia.build.variant=$(ARCADIA_BUILD_VARIANT) \
    ro.arcadia.release.type=$(ARCADIA_BUILD_TYPE) \
    ro.modversion=$(ARCADIA_VERSION) \
    ro.arcadialegal.url=https://crdroid.net/legal.php

# ArcadiaOS Platform SDK Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.lineage.build.version.plat.sdk=$(LINEAGE_PLATFORM_SDK_VERSION)

# ArcadiaOS Platform Internal Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.lineage.build.version.plat.rev=$(LINEAGE_PLATFORM_REV)
