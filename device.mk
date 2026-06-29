#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Allow userspace reboots
$(call inherit-product, $(SRC_TARGET_DIR)/product/userspace_reboot.mk)

# Enforce generic ramdisk allow list
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# Inherit launch_with_vendor_ramdisk product
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Inherit common MediaTek IMS
$(call inherit-product, vendor/mediatek/ims/ims.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 2460
TARGET_SCREEN_WIDTH := 1080

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot Virtual A/B
PRODUCT_PACKAGES += \
    com.android.hardware.boot \
    android.hardware.boot-service.default_recovery

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_client \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

PRODUCT_PACKAGES += \
    create_pl_dev \
    create_pl_dev.recovery

# API levels
PRODUCT_SHIPPING_API_LEVEL := 36

# Audio
$(call soong_config_set,android_hardware_audio,run_64bit,true)
$(call soong_config_set_bool,android_hardware_audio,skip_speaker_layout_channel_mask_field,true)
PRODUCT_PACKAGES += \
    android.hardware.audio.effect@7.0-impl:64 \
    android.hardware.audio.service \
    android.hardware.audio@7.0-impl:64 \
    android.hardware.bluetooth.audio-impl:64 \
    android.hardware.soundtrigger3-impl:64

PRODUCT_PACKAGES += \
    audio_policy.stub \
    audio.bluetooth.default \
    audio.primary.default \
    audio.r_submix.default \
    audio.usb.default

PRODUCT_PACKAGES += \
    audio_policy.stub:64 \
    libopus.vendor:64 \
    audioclient-types-aidl-cpp.vendor:64 \
    libaudiofoundation.vendor:64 \
    libbundlewrapper:64 \
    libbluetooth_audio_session:64 \
    libaudiopreprocessing:64 \
    libalsautils:64 \
    libdownmix:64 \
    libeffectproxy:64 \
    libnbaio_mono:64 \
    libtinycompress:64 \
    libdynproc:64 \
    libhapticgenerator:64 \
    libhapticgeneratoraidl:64 \
    libldnhncr:64 \
    libreverbwrapper:64 \
    libprocessgroup.vendor:64

PRODUCT_PACKAGES += \
    libaecsw \
    libagc1sw \
    libagc2sw \
    libbassboostsw \
    libbundleaidl \
    libdownmixaidl \
    libdynamicsprocessingaidl \
    libequalizersw \
    libextensioneffect \
    libloudnessenhanceraidl \
    libnssw \
    libpreprocessingaidl \
    libpresetreverbsw \
    libreverbaidl \
    libspatializersw \
    libvirtualizersw \
    libvisualizeraidl \
    libvolumesw \

PRODUCT_PACKAGES += \
    MtkInCallService \
#    DolbyAtmos

# AudioFX
TARGET_EXCLUDES_AUDIOFX := true

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth-service.mediatek

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.common@1.0.vendor \
    android.hardware.camera.device@3.6.vendor \
    android.hardware.camera.provider@2.6.vendor

PRODUCT_PACKAGES += \
    libdng_sdk.vendor \
    libexpat.vendor \
    libexif.vendor \
    libpiex \
    libpng.vendor

# ConsumerIR
PRODUCT_PACKAGES += \
    android.hardware.ir-service.example

# Control groups/Task profiles
PRODUCT_COPY_FILES += \
    system/core/libprocessgroup/profiles/cgroups.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    system/core/libprocessgroup/profiles/task_profiles.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=24m \
    dalvik.vm.heapgrowthlimit=256m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.46 \
    dalvik.vm.heapminfree=8m \
    dalvik.vm.heapmaxfree=48m

# Display
PRODUCT_PACKAGES += \
    android.hardware.memtrack-service.mediatek:64

PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@4.0.vendor:64 \
    android.hardware.graphics.mapper@4.0.vendor:64 \
    libion.vendor:64 \
    libui.vendor:64 \
    libdrm.vendor:64

PRODUCT_PACKAGES += \
    ANGLE

# DRM (Clearkey)
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey

# Fastboot
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint (TODO)

# Graphics
PRODUCT_PACKAGES += \
    android.hardware.memtrack-service.mediatek

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display_id_4627039422300187648.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4627039422300187648.xml

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl:64 \
    android.hardware.gatekeeper@1.0-service

PRODUCT_PACKAGES += \
    libgatekeeper.vendor:64

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss.measurement_corrections@1.1.vendor:64 \
    android.hardware.gnss.visibility_control@1.0.vendor:64 \
    android.hardware.gnss@1.1.vendor:64 \
    android.hardware.gnss@2.1.vendor:64 \
    android.hardware.gnss-V1-ndk.vendor:64

PRODUCT_PACKAGES += \
    libcurl.vendor:64

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.example \
    android.hardware.health-service.example_recovery \
    charger_res_images_vendor

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0:64 \
    android.hidl.allocator@1.0:64 \
    android.hidl.base@1.0.vendor:64 \
    android.hidl.allocator@1.0.vendor:64 \
    libhidltransport:64 \
    libhidltransport.vendor:64 \
    libhidlmemory.vendor:64 \
    libhwbinder:64 \
    libhwbinder.vendor:64

# Kernel
PRODUCT_ENABLE_UFFD_GC := true

PRODUCT_PACKAGES += \
    libnetutils.vendor

# Keymint
PRODUCT_PACKAGES += \
    android.hardware.security.keymint-V1-ndk.vendor:64 \
    android.hardware.security.secureclock-V1-ndk.vendor:64 \
    android.hardware.security.sharedsecret-V1-ndk.vendor:64 \
    android.hardware.security.rkp-V3-ndk.vendor:64 \
    libcppbor_external.vendor:64

# Lights
$(call soong_config_set_bool,lineagelight,scan_for_backlight_devices,$(TARGET_LIGHT_HAL_SCAN_FOR_BACKLIGHT_DEVICES))
PRODUCT_PACKAGES += \
    android.hardware.light-service.lineage

# Linker config
PRODUCT_VENDOR_LINKER_CONFIG_FRAGMENTS += \
    $(LOCAL_PATH)/configs/linker.config.json

# Local Configs: Audio, DT2W, Media, Power, Public-Libraries, Sensors, Thermal, Wifi
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/media,$(TARGET_COPY_OUT_VENDOR)/etc)
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/wifi/,$(TARGET_COPY_OUT_VENDOR)/etc/wifi)
    $(LOCAL_PATH)/configs/keylayout/mtk-tpd.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/mtk-tpd.kl
    $(LOCAL_PATH)/configs/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf \
    $(LOCAL_PATH)/configs/thermal/thermal_info_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json

# Media
$(call soong_config_set_bool,android_hardware_mediatek_codec2,link_v33_libstagefright_foundation,true)
PRODUCT_PACKAGES += \
    libcodec2_vndk.vendor:64 \
    libeffects:64 \
    libeffectsconfig.vendor:64 \
    libavservices_minijail_vendor:64 \
    libstagefright_softomx_plugin.vendor:64 \
    libsfplugin_ccodec_utils.vendor:64 \
    libcodec2_soft_common.vendor:64 \
    libflatbuffers-cpp.vendor:64 \
    libminijail:64 \
    libminijail.vendor:64

# Neural networks
PRODUCT_PACKAGES += \
    libtextclassifier_hash.vendor:64

# NFC
PRODUCT_PACKAGES += \
    vendor.nxp.nxpese@1.0 \
    vendor.nxp.nxpnfc_aidl-V1-ndk \
    com.android.nfc_extras \
    Tag

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Permissions - Frameworks
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.faketouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.faketouch.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.keystore.app_attest_key.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.keystore.app_attest_key.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.dynamic.head_tracker.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.dynamic.head_tracker.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnel_migration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnel_migration.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2023-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2024-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2023-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2024-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.pixel-libperfmgr

PRODUCT_PACKAGES += \
    vendor.mediatek.hardware.mtkpower@1.2-service.stub:64 \
    vendor.mediatek.hardware.mtkpower@1.0.vendor:64 \
    vendor.mediatek.hardware.mtkpower@1.1.vendor:64

PRODUCT_PACKAGES += \
    android.hardware.power@1.3.vendor:64

# Power | Dummy mtkperf lib
PRODUCT_PACKAGES += \
    libmtkperf_client_vendor:64 \
    libmtkperf_client:64

# Power configurations
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Product characteristics
PRODUCT_CHARACTERISTICS := nosdcard

# Radio
ENABLE_VENDOR_RIL_SERVICE := true

# RAM
PRODUCT_COPY_FILES += \
    hardware/google/pixel/mm/fstab.zram.50p-1g:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.zram

# Rootdir
PRODUCT_PACKAGES += \
    init.insmod.mt6789.cfg \
    init.insmod.sh \
    init.insmod.touch.cfg

PRODUCT_PACKAGES += \
    fstab.mt6789 \
    fstab.mt6789.vendor_ramdisk \
    init_connectivity.rc \
    init.cgroup.rc \
    init.connectivity.common.rc \
    init.connectivity.rc \
    init.modem.rc \
    init.mt6789.rc \
    init.mt6789.usb.rc \
    init.mtkgki.rc \
    init.project.rc \
    init.recovery.usb.rc \
    init.sensor_2_0.rc \
    ueventd.mt6789.rc

PRODUCT_PACKAGES += \
    init.mt6789.power.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6789::$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.mt6789

# Sensors
PRODUCT_PACKAGES += \
    android.frameworks.sensorservice@1.0:64 \
    android.frameworks.sensorservice@1.0.vendor:64 \
    android.hardware.radio.config@1.3.vendor:64 \
    android.hardware.radio@1.6.vendor:64 \
    android.hardware.sensors-service.multihal \
    android.hardware.sensors@1.0.vendor:64 \
    android.hardware.sensors@2.0-ScopedWakelock.vendor:64 \
    android.hardware.sensors@2.0-subhal-impl-1.0 \
    android.hardware.sensors@2.1.vendor:64 \
    libsensorndkbridge:64 \
    sensors.dynamic_sensor_hal

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

PRODUCT_PACKAGES += \
    mdota_symlink

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/google/interfaces \
    hardware/google/pixel \
    hardware/mediatek \
    hardware/mediatek/libaedv \
    hardware/mediatek/libmtkperf_client \
    hardware/millennium \
    hardware/millennium/libtranlog    

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal-service.mediatek

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/thermal_info_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json

# USB
$(call soong_config_set_bool,android_hardware_mediatek_usb,audio_accessory_supported,true)
PRODUCT_PACKAGES += \
    android.hardware.usb-service.mediatek \
    android.hardware.usb.gadget-service.mediatek

# Vendor Logtag
include $(LOCAL_PATH)/configs/vendor_logtag.mk

# Vendor service manager
PRODUCT_PACKAGES += \
    vndservicemanager

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.mediatek

# VNDK
PRODUCT_PACKAGES += \
    libunwindstack.vendor:64 \
    libutilscallstack.vendor:64

# Wi-Fi
$(call soong_config_set_bool,wpa_supplicant_8,wifi_disable_multi_akm,true)
PRODUCT_PACKAGES += \
    libwifi-hal-wrapper:64 \
    android.hardware.wifi-service \
    wpa_supplicant \
    lib_driver_cmd_mt66xx \
    hostapd \
    libkeystore-wifi-hidl:64 \
    libkeystore-engine-wifi-hidl:64

# Inherit the proprietary files
$(call inherit-product, vendor/transsion/CM6/CM6-vendor.mk)
