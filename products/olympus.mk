# Inherit device configuration for Nook Color
$(call inherit-product, device/motorola/olympus/full_olympus.mk)

# Inherit GSM common stuff.
$(call inherit-product, vendor/novagen/configs/gsm.mk)

# Inherit common product files.
$(call inherit-product, vendor/novagen/configs/common.mk)

# PA OVERLAY_TARGET
OVERLAY_TARGET := pa_olympus

# Setup device specific product configuration.
PRODUCT_NAME := novagen_olympus
PRODUCT_BRAND := Motorola
PRODUCT_DEVICE := olympua
PRODUCT_MODEL := Atrix4G
PRODUCT_MANUFACTURER := Motorola

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=olympus TARGET_DEVICE=olympus BUILD_FINGERPRINT="motorola/motorola_olympus/olympus:4.2.2/JDQ39/573038:user/release-keys" PRIVATE_BUILD_DESC="ro.build.description=olympus-user 4.2.2 JDQ39 573038 release-keys"

# Copy bootanimation.zip
PRODUCT_COPY_FILES += \
    vendor/novagen/prebuilt/bootanimation/novagen-bootanimation.zip:system/media/bootanimation.zip

