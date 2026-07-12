# SPDX-License-Identifier: Apache-2.0

NTCAM_VENDOR_PATH := vendor/nothing/asteroids

PRODUCT_COPY_FILES += \
    $(NTCAM_VENDOR_PATH)/proprietary/system_ext/etc/permissions/privapp-permissions-NothingExperience.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-NothingExperience.xml \
    $(NTCAM_VENDOR_PATH)/proprietary/vendor/bin/hw/vendor.noth.hardware.camera-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/vendor.noth.hardware.camera-service \
    $(NTCAM_VENDOR_PATH)/proprietary/vendor/etc/camera/NdotFont/Ndot-55.otf:$(TARGET_COPY_OUT_VENDOR)/etc/camera/NdotFont/Ndot-55.otf \
    $(NTCAM_VENDOR_PATH)/proprietary/vendor/etc/camera/Robotofont/Roboto-55.ttf:$(TARGET_COPY_OUT_VENDOR)/etc/camera/Robotofont/Roboto-55.ttf \
    $(NTCAM_VENDOR_PATH)/proprietary/vendor/etc/camera/SansCJKFont/NotoSansCJK.ttc:$(TARGET_COPY_OUT_VENDOR)/etc/camera/SansCJKFont/NotoSansCJK.ttc \
    $(NTCAM_VENDOR_PATH)/proprietary/vendor/etc/init/vendor.noth.hardware.camera-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/vendor.noth.hardware.camera-service.rc \
    $(NTCAM_VENDOR_PATH)/proprietary/vendor/etc/vintf/manifest/vendor.noth.hardware.camera-service.xml:$(TARGET_COPY_OUT_VENDOR)/etc/vintf/manifest/vendor.noth.hardware.camera-service.xml

PRODUCT_PACKAGES += \
    NothingProxy \
    NothingExperience \
    vendor.noth.hardware.camera-V1-ndk \
    vendor.noth.hardware.camera-service-impl \
    vendor.qti.hardware.camera.offlinecamera-V1-ndk \
    vendor.qti.hardware.camera.postproc@1.0 \
    libarcsoft_hdr_detection \
    libarcsoft_mf_superresolution \
    libcpion \
    liboemcrypto \
    libofflineproc_jni \
    libprotobuf-cpp-full-21.7 \
    libprotobuf-cpp-lite-21.7 \
    libtrustedapploader \
    vendor.noth.hardware.camera-service

# Add NTCamera after restoring the missing APK described in
# proprietary/system_ext/priv-app/NTCamera/README.md.
ifneq ($(wildcard $(NTCAM_VENDOR_PATH)/proprietary/system_ext/priv-app/NTCamera/NTCamera.apk),)
PRODUCT_PACKAGES += NTCamera
endif
