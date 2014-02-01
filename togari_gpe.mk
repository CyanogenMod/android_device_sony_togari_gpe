# Copyright (C) 2013-14 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

COMMON_PATH := $(LOCAL_PATH)/../togari

# Include non-opensource parts
# We call this first because togari_gpe contains some binaries
# which are also present in togari or rhine
# By calling togari_gpe first, the other duplicates are ignored
$(call inherit-product, vendor/sony/togari_gpe/togari_gpe-vendor.mk)
$(call inherit-product, vendor/sony/togari/togari-vendor.mk)

# Inherit the fusion-common definitions
$(call inherit-product, device/sony/rhine-common/rhine.mk)

DEVICE_PACKAGE_OVERLAYS += device/sony/togari/overlay

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := large hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Device specific init
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/init.device.rc:root/init.device.rc

# USB function switching
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/init.sony.usb.rc:root/init.sony.usb.rc

# Vold
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/vold.fstab:system/etc/vold.fstab

# Device specific part for two-stage boot
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/recovery/bootrec-device:recovery/bootrec-device

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
