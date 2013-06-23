# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

DATE = $(shell date +%Y%m%d)
RB_BRANCH=jb-mr1

ifneq ($(RB_BUILD),)
    # NovaGen Official properties
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.goo.developerid=Bajee \
        ro.goo.rom=NovaGen \
        ro.goo.version=$(DATE) \
        ro.novagen.version=NovaGen-JB-$(TARGET_PRODUCT)-$(RB_BUILD)
else
    ifneq ($(RB_NIGHTLY),)
    # NovaGen Nightlies properties
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.goo.developerid=Bajee \
        ro.goo.rom=NovaGenNightlies \
        ro.goo.version=$(DATE) \
        ro.novagen.version=NovaGen-JB-$(TARGET_PRODUCT)-Nightly-$(DATE)
    else
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.novagen.version=NovaGen-JB-$(TARGET_PRODUCT)-Unofficial-$(DATE)
    endif
endif

# needed for statistics
PRODUCT_PROPERTY_OVERRIDES += \
        ro.novagen.branch=$(RB_BRANCH) \
        ro.novagen.device=$(RB_PRODUCT)

# Camera shutter sound property
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.camera-sound=1
