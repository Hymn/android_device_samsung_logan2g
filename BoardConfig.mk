# Camera
USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/samsung/logan2g/BoardConfigVendor.mk

# Architecture
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a
ARCH_ARM_HAVE_TLS_REGISTER := true

# Board
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := sc6820i
TARGET_BOOTLOADER_BOARD_NAME := logan2g

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_SOURCE := kernel/samsung/logan2g
TARGET_KERNEL_CONFIG := cyanogenmod_logan2g_defconfig
BOARD_USES_UNCOMPRESSED_BOOT := true

TARGET_USERIMAGES_USE_EXT4 := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 941621248
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2630614016
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/logan2g/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/logan2g/libbt_vndcfg.txt

# Connectivity - Wi-Fi
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WLAN_DEVICE_REV       := bcm4330
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_NAME     := "dhd"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG   := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_BAND                   := 802_11_ABG

# Wi-Fi Tethering
BOARD_HAVE_SAMSUNG_WIFI := true
BOARD_LEGACY_NL80211_STA_EVENTS := true
BOARD_NO_APSME_ATTR := true

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/samsung/logan2g/egl/egl.cfg
BOARD_EGL_NEEDS_LEGACY_FB := true
COMMON_GLOBAL_CFLAGS += -DMR0_CAMERA_BLOB

# Audio
HAVE_HTC_AUDIO_DRIVER := true
BOARD_USES_GENERIC_AUDIO := true
COMMON_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging

# Resolution
DEVICE_RESOLUTION := 480×800

# Ril
BOARD_RIL_CLASS := ../../../device/samsung/logan2g/ril/

# UMS
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/dwc_otg.0/gadget/lun0/file"
BOARD_SEPOLICY_DIRS += \
    device/samsung/logan2g/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    device.te \
    app.te \
    netd.te
