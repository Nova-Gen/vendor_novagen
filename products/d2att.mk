# Inherit AOSP device configuration for d2att.
$(call inherit-product, device/samsung/d2att/full_d2att.mk)

# Inherit GSM common stuff.
$(call inherit-product, vendor/novagen/configs/gsm.mk)

# Inherit NovaGen common bits
$(call inherit-product, vendor/novagen/configs/common.mk)

# S3 Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/novagen/overlay/s3-common

# PA OVERLAY_TARGET
OVERLAY_TARGET := pa_i9300

# Setup device specific product configuration.
PRODUCT_NAME := novagen_d2att
PRODUCT_BRAND := Samsung
PRODUCT_DEVICE := d2att
PRODUCT_MODEL := SGH-I747
PRODUCT_MANUFACTURER := Samsung

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=d2uc TARGET_DEVICE=d2att BUILD_FINGERPRINT="d2uc-user 4.0.4 IMM76D I747UCALEM release-keys" PRIVATE_BUILD_DESC="samsung/d2uc/d2att:4.0.4/IMM76D/I747UCALEM:user/release-keys"

# Copy bootanimation.zip
PRODUCT_COPY_FILES += \
    vendor/novagen/prebuilt/bootanimation/novagen-bootanimation.zip:system/media/bootanimation.zip
