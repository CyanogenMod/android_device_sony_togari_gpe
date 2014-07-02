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

# Include non-opensource parts
# We call this first because togari_gpe contains some binaries
# which are also present in rhine-common
# For PRODUCT_COPY_FILES, the first rule takes precedence
$(call inherit-product, vendor/sony/togari_gpe/togari_gpe-vendor.mk)

# Override rhine-common fstab
# We don't have /mnt/idd
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/fstab.qcom:root/fstab.qcom

# Inherit the togari definitions
LOCAL_PATH := device/sony/togari
include device/sony/togari/togari.mk
LOCAL_PATH := $(call my-dir)
