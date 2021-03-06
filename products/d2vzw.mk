# Inherit AOSP device configuration for d2vzw.
$(call inherit-product, device/samsung/d2vzw/full_d2vzw.mk)

# Inherit CDMA common stuff.
$(call inherit-product, vendor/novagen/configs/cdma.mk)

# Inherit common Verizon Wireless Perms and Lib
$(call inherit-product, vendor/novagen/configs/vzw.mk)

# Inherit NovaGen common bits
$(call inherit-product, vendor/novagen/configs/common.mk)

# S3 Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/novagen/overlay/s3-common

# PA OVERLAY_TARGET
OVERLAY_TARGET := pa_i9300

# Setup device specific product configuration.
PRODUCT_NAME := novagen_d2vzw
PRODUCT_BRAND := Samsung
PRODUCT_DEVICE := d2vzw
PRODUCT_MODEL := SCH-I535
PRODUCT_MANUFACTURER := Samsung

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=d2vzw TARGET_DEVICE=d2vzw BUILD_FINGERPRINT="d2vzw-user 4.1.2 JZO54K I535VRBMB1 release-keys" PRIVATE_BUILD_DESC="Verizon/d2vzw/d2vzw:4.1.2/JZO54K/I535VRBMB1:user/release-keys"

# Copy bootanimation.zip
PRODUCT_COPY_FILES += \
    vendor/novagen/prebuilt/bootanimation/novagen-bootanimation.zip:system/media/bootanimation.zip

