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

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/GT-P1000/GT-P1000-vendor.mk)

## (3) Finally, the least specific parts, i.e. the non-GSM-specific aspects

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=200 \
    ro.sf.hwrotation=90 \
    rild.libpath=/system/lib/libsec-ril.so \
    rild.libargs=-d[SPACE]/dev/s3c2410_serial3 \
    ro.telephony.ril_class=samsung \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=20 \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.setupwizard.enable_bypass=1

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=48m

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# Galaxy S uses high-density artwork where available
PRODUCT_LOCALES += hdpi

# For emmc phone storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.phone_storage = 1 \
    ro.additionalmounts=/mnt/emmc \
    ro.vold.switchablepair=/mnt/sdcard,/mnt/emmc

# For mobiledatainterfaces
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces = eth0,pdp0

# For GPS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.gps.soket = /data/gpspipe

# For FM-Radio
#PRODUCT_PROPERTY_OVERRIDES += \
#    fmradio.device = fmradio

#For RIL
PRODUCT_PROPERTY_OVERRIDES += \
    phone.ril.classname = com.android.internal.telephony.SamsungRIL

DEVICE_PACKAGE_OVERLAYS += device/samsung/p1-common/overlay

# These are the OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
	device/samsung/aries-common/sec_mm/sec_omx/sec_omx_core/secomxregistry:system/etc/secomxregistry \
	device/samsung/p1-common/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml

# These are the OpenMAX IL modules
PRODUCT_PACKAGES += \
	libSEC_OMX_Core.aries \
	libOMX.SEC.AVC.Decoder.aries \
	libOMX.SEC.M4V.Decoder.aries \
	libOMX.SEC.M4V.Encoder.aries \
	libOMX.SEC.AVC.Encoder.aries \
	libstagefrighthw \
	overlay.GT-P1000

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

PRODUCT_COPY_FILES += \
    device/samsung/p1-common/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/prebuilt/etc/vold.fstab:system/etc/vold.fstab \
    device/samsung/p1-common/prebuilt/usr/keylayout/p1_keyboard.kl:system/usr/keylayout/p1_keyboard.kl \
    device/samsung/p1-common/prebuilt/usr/keylayout/AT42QT602240_Touchscreen.kl:system/usr/keylayout/AT42QT602240_Touchscreen.kl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/initramfs/init.smdkc110.rc:root/init.smdkc110.rc \
    $(LOCAL_PATH)/initramfs/init.rc:root/init.rc \
    $(LOCAL_PATH)/initramfs/lpm.rc:root/lpm.rc \
    $(LOCAL_PATH)/initramfs/ueventd.rc:root/ueventd.rc \
    $(LOCAL_PATH)/initramfs/recovery.rc:recovery/root/recovery.rc


# GSM APN list override one in common_full
PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/modelid_cfg.sh:system/bin/modelid_cfg.sh \
    $(LOCAL_PATH)/verify_cache_partition_size.sh:system/bin/verify_cache_partition_size.sh


# Filesystem management tools
PRODUCT_PACKAGES += \
    setup_fs

PRODUCT_COPY_FILES += \
    device/samsung/p1-common/prebuilt/mke2fs:utilities/mke2fs

PRODUCT_PACKAGES += \
    libaudio \
    lights.GT-P1000

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
PRODUCT_MANUFACTURER := Samsung
TARGET_IS_GALAXYS := true

