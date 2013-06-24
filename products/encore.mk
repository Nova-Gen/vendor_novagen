# Inherit device configuration for Nook Color
$(call inherit-product, device/bn/encore/full_encore.mk)

# Inherit common product files.
$(call inherit-product, vendor/rootbox/configs/common.mk)

# PA OVERLAY_TARGET
OVERLAY_TARGET := pa_encore

# Setup device specific product configuration.
PRODUCT_NAME := rootbox_encore
PRODUCT_BRAND := Bn
PRODUCT_DEVICE := encore
PRODUCT_MODEL := NookColor
PRODUCT_MANUFACTURER := Bn

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=encore TARGET_DEVICE=encore BUILD_FINGERPRINT="bn/bn_encore/encore:4.2.2/JDQ39/573038:user/release-keys" PRIVATE_BUILD_DESC="ro.build.description=encore-user 4.2.2 JDQ39 573038 release-keys"

# Copy bootanimation.zip
PRODUCT_COPY_FILES += \
    vendor/rootbox/prebuilt/bootanimation/bootanimation_800_480.zip:system/media/bootanimation.zip

