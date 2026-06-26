#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from CM6 device
$(call inherit-product, device/transsion/CM6/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

BOARD_VENDOR := Tecno
PRODUCT_NAME := lineage_CM6
PRODUCT_DEVICE := CM6
PRODUCT_MANUFACTURER := Transsion
PRODUCT_BRAND := Tecno
PRODUCT_MODEL := Tecno CM6

PRODUCT_GMS_CLIENTID_BASE := android-transsion

PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceName=CM6 \
    BuildFingerprint=TECNO/CM6-OP/TECNO-CM6:16/BP2A.250605.031.A3/201350008:user/release-keys

# Time
LINEAGE_VERSION_APPEND_TIME_OF_DAY := true
