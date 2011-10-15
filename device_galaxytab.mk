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
#

#
# This is the product configuration for a generic GSM passion,
# not specialized for any geography.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/GT-P1000/GT-P1000-vendor.mk)

$(call inherit-product-if-exists, device/samsung/p1-common/common.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libsec-ril.so \
    rild.libargs=-d[SPACE]/dev/s3c2410_serial3

# For emmc phone storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.phone_storage = 1 \
    ro.additionalmounts=/mnt/sdcard/external_sd \
    ro.vold.switchablepair=/mnt/sdcard,/mnt/sdcard/external_sd \
    persist.sys.vold.switchexternal=1

# For mobiledatainterfaces
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces = eth0,pdp0

# For FM-Radio
#PRODUCT_PROPERTY_OVERRIDES += \
#    fmradio.device = fmradio

PRODUCT_PACKAGES += \
    overlay.GT-P1000 \
    lights.GT-P1000

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/initramfs/init.rc:root/init.rc \
    $(LOCAL_PATH)/initramfs/init.gt-p1000.rc:recovery/root/init.gt-p1000.rc \
    $(LOCAL_PATH)/initramfs/lpm.rc:root/lpm.rc \
    $(LOCAL_PATH)/initramfs/ueventd.rc:root/ueventd.rc \
    $(LOCAL_PATH)/initramfs/recovery.rc:recovery/root/recovery.rc


# GSM APN list override one in common_full
PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wpa_supplicant.conf

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/galaxytab/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
	$(LOCAL_KERNEL):kernel

# kernel modules we built
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/modules/cifs.ko:system/lib/modules/2.6.35.7/cifs.ko \
    $(LOCAL_PATH)/prebuilt/modules/tun.ko:system/lib/modules/2.6.35.7/tun.ko \
    $(LOCAL_PATH)/prebuilt/modules/bcm4329.ko:system/lib/modules/2.6.35.7/bcm4329.ko \
    $(LOCAL_PATH)/prebuilt/modules/hotspot_event_monitoring.ko:system/lib/modules/2.6.35.7/hotspot_event_monitoring.ko \
    $(LOCAL_PATH)/prebuilt/modules/ansi_cprng.ko:root/lib/modules/ansi_cprng.ko \
    $(LOCAL_PATH)/prebuilt/modules/scsi_wait_scan.ko:root/lib/modules/scsi_wait_scan.ko \
    $(LOCAL_PATH)/prebuilt/modules/vibrator.ko:root/lib/modules/vibrator.ko \
    $(LOCAL_PATH)/prebuilt/modules/bthid.ko:root/lib/modules/bthid.ko


$(call inherit-product, build/target/product/full.mk)

PRODUCT_NAME := full_galaxytab
PRODUCT_DEVICE := galaxytab
PRODUCT_MODEL := GT-P1000
PRODUCT_BOARD := p1
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
TARGET_IS_GALAXYS := true

