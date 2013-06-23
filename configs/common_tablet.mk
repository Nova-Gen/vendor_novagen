# Inherit common tuff
$(call inherit-product, vendor/novagen/configs/common.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/novagen/overlay/common_tablets
