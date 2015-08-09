# Get all languages available
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/logan2g/logan2g-vendor.mk)

# Use high-density artwork where available; our device (GT-S7262) supports hdpi (high) ~240dpi
PRODUCT_LOCALES += hdpi

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/samsung/logan2g/overlay

LOCAL_PATH := device/samsung/logan2g

$(shell mkdir -p $(LOCAL_PATH)/../../../out/target/product/logan2g/recovery/root/system/bin)
$(shell ln -sf -t $(LOCAL_PATH)/../../../out/target/product/logan2g/recovery/root/system/bin ../../sbin/sh)

# Files
# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/boot/init.rc:root/init.rc \
    $(LOCAL_PATH)/boot/init.sc6820i.rc:root/init.sc6820i.rc \
    $(LOCAL_PATH)/boot/init.sc6820i.usb.rc:root/init.sc6820i.usb.rc \
    $(LOCAL_PATH)/boot/init.bt.rc:root/init.bt.rc \
    $(LOCAL_PATH)/boot/lpm.rc:root/lpm.rc \
    $(LOCAL_PATH)/boot/ueventd.sc6820i.rc:root/ueventd.sc6820i.rc \
    $(LOCAL_PATH)/boot/fstab.sc6820i:root/fstab.sc6820i \
    $(LOCAL_PATH)/boot/bin/charge:root/bin/charge \
    $(LOCAL_PATH)/boot/bin/poweroff_alarm:root/bin/poweroff_alarm \
    $(LOCAL_PATH)/boot/bin/rawdatad:root/bin/rawdatad \
    $(LOCAL_PATH)/boot/sbin/adbd:root/sbin/adbd \
    $(LOCAL_PATH)/boot/sbin/ffu:root/sbin/ffu

# Vold
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab

# Idc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/Zinitix_tsp.idc:system/usr/idc/Zinitix_tsp.idc

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/sci-keypad.kl:system/usr/keylayout/sci-keypad.kl

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.conf:system/etc/audio_effects.conf \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/default_gain.conf:system/etc/default_gain.conf \
    $(LOCAL_PATH)/audio/devicevolume.xml:system/etc/devicevolume.xml \
    $(LOCAL_PATH)/audio/formatvolume.xml:system/etc/formatvolume.xml

# Hw params
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/hw_params/audio_para:system/etc/audio_para \
    $(LOCAL_PATH)/hw_params/codec_pga.xml:system/etc/codec_pga.xml\
    $(LOCAL_PATH)/hw_params/tiny_hw.xml:system/etc/tiny_hw.xml

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Packages
# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Usb accessory
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default

# Device-specific packages
PRODUCT_PACKAGES += \
    SamsungServiceMode

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=150 \
    mobiledata.interfaces=rmnet0 \
    ro.telephony.ril_class=SamsungSPRDRIL

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# SPRD-SCI default build.prop overrides
PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.product.chipset=sc6820i \
    ro.com.android.dataroaming=false \
    persist.msms.phone_count=2 \
    persist.msms.phone_default=0 \
    persist.sys.sprd.modemreset=1 \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=96m \
    dalvik.vm.heapsize=128m \
    ro.crypto.state=unsupported \
    ro.com.google.gmsversion=4.1_r6 \
    boot.fps=7

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb

# Use the Dalvik VM specific for devices with 512 MB of RAM
include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_logan2g
PRODUCT_DEVICE := logan2g
