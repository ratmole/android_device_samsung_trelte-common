COMMON_PATH := device/samsung/trelte-common

PRODUCT_CHARACTERISTICS := phone

# ADB INSECURE
PRODUCT_PROPERTY_OVERRIDES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    ro.debuggable=1 \
    persist.service.adb.enable=1 \
    persist.service.debuggable=1 \
    persist.sys.usb.config=mtp,adb \
    ro.product.first_api_level=19
    
# Inherit products
-include $(COMMON_PATH)/product/*.mk

# Common inherits
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)


# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio.primary.universal5433 \
    libtinycompress \
    libseirenhw

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(COMMON_PATH)/configs/audio/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl-tre \
    android.hardware.bluetooth@1.0-service \
    libbt-vendor

# Bluetooth workaround:
# The new CAF code defaults to MCT HAL, but we
# need the old H4 HAL for our Broadcom WiFi.
PRODUCT_PROPERTY_OVERRIDES += \
	qcom.bluetooth.soc=rome
	
PRODUCT_PROPERTY_OVERRIDES += \
	ro.bt.bdaddr_path="/efs/bluetooth/bt_addr"	

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl-legacy \
    camera.device@1.0-impl-legacy \
    libexynoscamera_shim \
    libcsc \
    Camera2

# Charger
PRODUCT_PACKAGES += \
    charger_res_images \
    lineage_charger_res_images

# Codecs
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libExynosOMX_shim

# OMX
PRODUCT_PACKAGES += \
    libcsc \
    libOMX.Exynos.WMV.Decoder \
    libOMX.Exynos.MPEG2.Decoder

#PRODUCT_PACKAGES += \
#   libOMX.Exynos.AAC.Decoder \
#   libOMX.Exynos.AVC.Decoder \
#   libOMX.Exynos.AVC.Encoder \
#   libOMX.Exynos.HEVC.Decoder \
#   libOMX.Exynos.MP3.Decoder \
#   libOMX.Exynos.MPEG4.Decoder \
#   libOMX.Exynos.MPEG4.Encoder \
#   libOMX.Exynos.VP8.Decoder \
#   libOMX.Exynos.VP8.Encoder \
#   libOMX.Exynos.WMA.Encoder

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/init/android.hardware.media.omx@1.0-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.media.omx@1.0-service.rc

# Configstore
PRODUCT_PACKAGES += \
    android.hardware.configstore@1.1-impl \
    android.hardware.configstore@1.1-service

# Display
#PRODUCT_PACKAGES += \
#   AdvancedDisplay

# Doze
#PRODUCT_PACKAGES += \
#	TrelteDoze

# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service.tre

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-impl \
    android.hardware.biometrics.fingerprint@2.1-service
	
# Fingerprint
PRODUCT_PACKAGES += \
    fingerprint.exynos5 \
    ValidityService

# Flat device tree for boot image
PRODUCT_PACKAGES += \
    dtbhtoolExynos

# Gps
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl.s2 \
    android.hardware.gnss@1.0-service \
    gps.default \
	libshim_gpsd

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(COMMON_PATH)/configs/gps/gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/gps.xml \
    $(COMMON_PATH)/configs/gps/gnss.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gnss.conf

# Graphics
PRODUCT_AAPT_CONFIG := xlarge
PRODUCT_AAPT_PREF_CONFIG := 560dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@2.0-impl \
    libion \
    hwcomposer.exynos5 \
    libfimg

# Healthd
#PRODUCT_PACKAGES += \
#    android.hardware.health@1.0-impl \
#    android.hardware.health@1.0-service

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# IR 
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    consumerir.universal5433 

# Keylayouts
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
    $(COMMON_PATH)/configs/keylayout/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl \
    $(COMMON_PATH)/configs/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_e-pen.kl \
    $(COMMON_PATH)/configs/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(COMMON_PATH)/configs/keylayout/synaptics_rmi4_i2c.kl:system/usr/keylayout/synaptics_rmi4_i2c.kl \
    $(COMMON_PATH)/configs/keylayout/Vendor_04e8_Product_7021.kl:system/usr/keylayout/Vendor_04e8_Product_7021.kl \
    $(COMMON_PATH)/configs/idc/Synaptics_HID_TouchPad.idc:system/usr/idc/Synaptics_HID_TouchPad.idc \
    $(COMMON_PATH)/configs/idc/sec_e-pen.idc:system/usr/idc/sec_e-pen.idc \
    $(COMMON_PATH)/configs/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service \
    keystore.exynos5

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service \
    lights.universal5433

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml  \
    $(COMMON_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(COMMON_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(COMMON_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Memory
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl \
    memtrack.exynos5

# MobiCore
#PRODUCT_PACKAGES += \
#   mcDriverDaemon

# Net
PRODUCT_PACKAGES += \
    android.system.net.netd@1.0 \
    libandroid_net \
    netutils-wrapper-1.0

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(COMMON_PATH)/overlay \
    $(COMMON_PATH)/overlay-lineage

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.heartrate.xml:system/etc/permissions/android.hardware.sensor.heartrate.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.freeform_window_management.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_0_3.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.freeform_window_management.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.print.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.print.xml \
    frameworks/native/data/etc/android.software.picture_in_picture.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.picture_in_picture.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.dsi.ant.antradio_library.xml \
    $(COMMON_PATH)/configs/permissions/privapp-permissions-com.validity.fingerprint.xml:system/etc/permissions/privapp-permissions-com.validity.fingerprint.xml \
    $(COMMON_PATH)/configs/permissions/com.samsung.permission.HRM_EXT.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.samsung.permission.HRM_EXT.xml \
    $(COMMON_PATH)/configs/permissions/com.samsung.permission.SSENSOR.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.samsung.permission.SSENSOR.xml
	
# Trust HAL
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service

# Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.samsung

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-service \
    android.hardware.power@1.0-impl \
    power.universal5433

# IPv6
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libebtc

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.universal5433 \
    init.universal5433.rc \
    init.universal5433.usb.rc \
    init.samsung.rc \
    init.wifi.rc \
    init.power.rc \
    sswap

# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# RRO
PRODUCT_ENFORCE_RRO_TARGETS := \
    framework-res

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(COMMON_PATH)/seccomp/mediaextractor-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl
	
# Sensors wrapper
PRODUCT_PACKAGES += \
    sensors.universal5433

# TextClassifier smart selection model files
PRODUCT_PACKAGES += \
    textclassifier.smartselection.bundle1

# Tinyalsa utilities
PRODUCT_PACKAGES += \
    tinyplay \
    tinycap \
    tinymix \
    tinypcminfo

# USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-service.lineage

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    macloader \
    wifiloader \
    hostapd \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf \
    wificond \
    wifilogd \
    wlutil

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(COMMON_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# Vendor
$(call inherit-product, vendor/samsung/trelte-common/trelte-common-vendor.mk)

# call Samsung LSI board support package
#$(call inherit-product, hardware/samsung_slsi-cm/exynos5/exynos5.mk)
#$(call inherit-product, hardware/samsung_slsi-cm/exynos5433/exynos5433.mk)
