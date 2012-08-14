$(call inherit-product, device/qcom/common/common.mk)
PRODUCT_COPY_FILES := \
  device/lge/m4/app_process:system/bin/app_process \
  device/lge/m4/touch_mcs8000.idc:system/usr/idc/touch_mcs8000.idc \
  device/lge/m4/touch_mcs8000.idc:system/usr/idc/touch_mcs8000_bell.idc \
  device/lge/m4/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

$(call inherit-product-if-exists, vendor/lge/m4/m4-vendor-blobs.mk)
$(call inherit-product-if-exists, vendor/lge/common/vendor-blobs.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

PRODUCT_PROPERTY_OVERRIDES += \
  rild.libpath=/system/lib/libril-qc-1.so \
  rild.libargs=-d/dev/smd0 \
  ro.use_data_netmgrd=true \
  ro.moz.ril.simstate_extra_field=true \
  ro.moz.ril.emergency_by_default=true

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_m4
PRODUCT_DEVICE := m4
PRODUCT_BRAND := lge
PRODUCT_MANUFACTURER := LGE
PRODUCT_MODEL := LG-E612

PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
  persist.usb.serialno=$(PRODUCT_NAME)
