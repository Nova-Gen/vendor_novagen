# Inherit AOSP device configuration for t0lte.
$(call inherit-product, device/samsung/jfltecan/full_jfltecan.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/novagen/configs/gsm.mk)

# Inherit NovaGen common bits
$(call inherit-product, vendor/novagen/configs/common.mk)

# Galaxy S4 Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/novagen/overlay/s4-common

# PA OVERLAY_TARGET
OVERLAY_TARGET := pa_xxhdpi

# Setup device specific product configuration.
PRODUCT_NAME := novagen_jfltecan
PRODUCT_BRAND := Samsung
PRODUCT_DEVICE := jfltecan
PRODUCT_MODEL := SGH-I337M
PRODUCT_MANUFACTURER := samsung

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=jfltevl TARGET_DEVICE=jfltecan BUILD_FINGERPRINT="samsung/jfltevl/jfltecan:4.2.2/JDQ39/I337MVLUAMDJ:user/release-keys" PRIVATE_BUILD_DESC="jfltevl-user 4.2.2 JDQ39 I337MVLUAMDJ release-keys"
PRODUCT_RELEASE_NAME := jfltecan

# Copy Bootanimation
PRODUCT_COPY_FILES += \
    vendor/novagen/prebuilt/bootanimation/bootanimation_1920_1080.zip:system/media/bootanimation.zip

