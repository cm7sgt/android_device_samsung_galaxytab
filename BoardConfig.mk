#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

# Set this up here so that BoardVendorConfig.mk can override it
BOARD_USES_GENERIC_AUDIO := false

# Use the non-open-source parts, if they're present
-include vendor/samsung/GT-P1000/BoardConfigVendor.mk

# ARMv7-A Cortex-A8 architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY := false
#BOARD_USES_INITRAMFS := true
TARGET_NO_RADIOIMAGE := true
TARGET_PREBUILT_KERNEL := device/samsung/galaxytab/kernel

TARGET_PROVIDES_INIT := true
TARGET_PROVIDES_INIT_TARGET_RC := true
TARGET_BOARD_PLATFORM := s5pc110
# ends up in ro.product.board
TARGET_BOOTLOADER_BOARD_NAME := GT-P1000
# override recovery init.rc with the default init.rc
TARGET_RECOVERY_INITRC := device/samsung/p1-common/initramfs/init.rc
BOARD_PROVIDES_BOOTMODE := true

# Releasetools
TARGET_PROVIDES_RELEASETOOLS := true
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/samsung/p1-common/releasetools/aries_ota_from_target_files
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./device/samsung/p1-common/releasetools/aries_img_from_target_files
TARGET_OTA_ASSERT_DEVICE := galaxytab,GT-P1000,SGH-T849,SGH-I897

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# WiFi related defines
WPA_SUPPLICANT_VERSION := VER_0_6_X
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WLAN_DEVICE := bcm4329
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/2.6.35.7/bcm4329.ko"
WIFI_DRIVER_MODULE_NAME := "bcm4329"
WIFI_DRIVER_FW_STA_PATH := "/system/etc/wifi/bcm4329_sta.bin"
WIFI_DRIVER_FW_AP_PATH := "/system/etc/wifi/bcm4329_aps.bin"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/wifi/bcm4329_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt dhd_watchdog_ms=10 dhd_poll=1"
WIFI_IFACE_DIR := "/data/misc/wifi"
CONFIG_DRIVER_WEXT := true
BOARD_WEXT_NO_COMBO_SCAN := true
BOARD_MOBILEDATA_INTERFACE_NAME := "pdp0"
BOARD_NETWORK_INTERFACES_DIR := "/sys/devices/virtual/net"

USE_CAMERA_STUB := false
ifeq ($(USE_CAMERA_STUB),false)
BOARD_CAMERA_LIBRARIES := libcamera
endif
BOARD_USES_OVERLAY := true
BOARD_V4L2_DEVICE := /dev/video1
BOARD_CAMERA_DEVICE := /dev/video0
BOARD_SECOND_CAMERA_DEVICE := /dev/video2

# For the FM Radio
BOARD_HAVE_FM_RADIO := false

# OpenGL stuff
BOARD_EGL_CFG := vendor/samsung/GT-P1000/proprietary/JQ1/egl/egl.cfg
TARGET_BOARD_PLATFORM_GPU := POWERVR_SGX540_120
#BOARD_NO_RGBX_8888 := true

# Device related defines
BOARD_KERNEL_CMDLINE := console=ttyFIQ0,115200 loglevel=4
BOARD_KERNEL_BASE := 0x02e00000

# storage
BOARD_USE_USB_MASS_STORAGE_SWITCH := false
# emmc storage
BOARD_EMMC_DEVICE := /dev/block/mmcblk0p1
# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_NO_RECOVERY_PARTITION := true
BOARD_HAS_NO_MISC_PARTITION := true

BOARD_BOOTIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x00780000)
BOARD_RECOVERYIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x00780000)
BOARD_SYSTEMIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x14080000)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 336068608
BOARD_FLASH_BLOCK_SIZE := 131072

# for recovery
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/galaxytab/bootimg.mk
BOARD_BOOT_DEVICE := /dev/block/bml7
BOARD_DATA_DEVICE := /dev/block/mmcblk0p2
BOARD_DATA_FILESYSTEM := ext4
BOARD_DATA_FILESYSTEM_OPTIONS := check=no,nosuid,nodev
BOARD_HAS_DATADATA := true
BOARD_DATADATA_DEVICE := /dev/block/stl10
BOARD_DATADATA_FILESYSTEM := ext4
BOARD_DATADATA_FILESYSTEM_OPTIONS := check=no,nosuid,nodev
BOARD_SYSTEM_DEVICE := /dev/block/stl9
BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_SYSTEM_FILESYSTEM_OPTIONS := llw,check=no
BOARD_CACHE_DEVICE := /dev/block/stl11
BOARD_CACHE_FILESYSTEM := ext4
BOARD_CACHE_FILESYSTEM_OPTIONS := check=no,nosuid,nodev
BOARD_SDEXT_FILESYSTEM := auto
BOARD_HAS_PARAMFS := true
BOARD_PARAMFS_DEVICE := dev/block/stl3
BOARD_PARAMFS_FILESYSTEM := rfs

BOARD_USES_BMLUTILS := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk0p1
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_SDCARD_DEVICE_INTERNAL := /dev/block/mmcblk0p1
BOARD_HAS_DOWNLOAD_MODE := true
TARGET_ROOT_IS_RECOVERY := true
TARGET_BOOT_IS_RAMDISK := true



