#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from mssi_64_64only_cn_armv82 device
$(call inherit-product, device/transsion/mssi_64_64only_cn_armv82/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_DEVICE := mssi_64_64only_cn_armv82
PRODUCT_NAME := lineage_mssi_64_64only_cn_armv82
PRODUCT_BRAND := Transsion
PRODUCT_MODEL := Tssi
PRODUCT_MANUFACTURER := transsion

PRODUCT_GMS_CLIENTID_BASE := android-transsion

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="sys_mssi_64_64only_cn_armv82-user 16 BP2A.250605.031.A3 82815 release-keys" \
    BuildFingerprint=Transsion/tssi/mssi_64_64only_cn_armv82:16/BP2A.250605.031.A3/201350063:user/release-keys
