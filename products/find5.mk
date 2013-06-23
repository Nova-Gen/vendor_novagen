# Inherit AOSP device configuration for d2att.
$(call inherit-product, device/oppo/find5/full_find5.mk)

# Inherit GSM common stuff.
$(call inherit-product, vendor/novagen/configs/gsm.mk)

# Inherit NovaGen common bits
$(call inherit-product, vendor/novagen/configs/common.mk)

# S3 Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/novagen/overlay/find5

# PA OVERLAY_TARGET
OVERLAY_TARGET := pa_i9300

# Setup device specific product configuration.
PRODUCT_NAME := novagen_find5
PRODUCT_BRAND := Oppo
PRODUCT_DEVICE := find5
PRODUCT_MODEL := Find 5
PRODUCT_MANUFACTURER := Oppo

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=occam BUILD_FINGERPRINT=OPPO/oppo_12069/FIND5:4.1.1/JRO03L/1362469752:user/release-keys PRIVATE_BUILD_DESC="msm8960-user 4.1.1 JRO03L eng.oppo.20130328.172033 release-keys"

# Copy bootanimation.zip
PRODUCT_COPY_FILES += \
    vendor/novagen/prebuilt/xhdpi/bootanimation.zip:system/media/bootanimation.zip
