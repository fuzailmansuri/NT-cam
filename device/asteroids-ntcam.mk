# SPDX-License-Identifier: Apache-2.0

NTCAM_DEVICE_PATH := device/nothing/asteroids

PRODUCT_SOONG_NAMESPACES += \
    $(NTCAM_DEVICE_PATH) \
    vendor/nothing/asteroids

PRODUCT_PACKAGES += \
    libcamera_client_shim

PRODUCT_COPY_FILES += \
    $(NTCAM_DEVICE_PATH)/configs/nothing-hiddenapi-package-allowlist.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/nothing-hiddenapi-package-allowlist.xml \
    $(NTCAM_DEVICE_PATH)/configs/privapp-permissions-NTCamera.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-NTCamera.xml \
    $(NTCAM_DEVICE_PATH)/configs/privapp-permissions-NothingProxy.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-NothingProxy.xml \
    $(NTCAM_DEVICE_PATH)/linker.config.json:$(TARGET_COPY_OUT_VENDOR)/etc/linker.config.json
