# SPDX-License-Identifier: Apache-2.0
#
# Include this from the asteroids product after applying this repository's
# device/ and vendor/ overlays to the corresponding source-tree paths.

$(call inherit-product, $(LOCAL_PATH)/device/asteroids-ntcam.mk)
$(call inherit-product, $(LOCAL_PATH)/vendor/asteroids-ntcam.mk)
