#
# Copyright (C) 2022 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Device specific configs
$(call inherit-product, device/infinix/X676C/device.mk)

# Device identifier
PRODUCT_DEVICE := X676C
PRODUCT_NAME := twrp_X676C
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix X676C
PRODUCT_MANUFACTURER := INFINIX

# Hide Reflash TWRP
PRODUCT_PROPERTY_OVERRIDES += ro.twrp.vendor_boot=true

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=Infinix-X676C \
    PRODUCT_NAME=X676C-OP \
    PRIVATE_BUILD_DESC="vext_x676c_h891-user 12 SP1A.210812.016 142062 release-keys"

BUILD_FINGERPRINT := Infinix/X676C-OP/Infinix-X676C:12/SP1A.210812.016/221031V733:user/release-keys
