#
# SPDX-FileCopyrightText: Paranoid Android
# SPDX-License-Identifier: Apache-2.0
#

$(call soong_config_set,camera,package_name,com.nothing.camera)

PRODUCT_PACKAGES += \
    NTCamera \
    libofflineproc_shim \
    ntcam_offlineproc

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.vendor.camera.privapp.list=com.nothing.camera \
    ro.com.google.lens.oem_camera_package=com.nothing.camera

$(call inherit-product, vendor/nothing/camera/camera-vendor.mk)
