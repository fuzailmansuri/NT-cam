# Nothing Camera (NTCAM) Port Makefile
# SPDX-License-Identifier: Apache-2.0

# Path to the camera port directory (can be overridden in device mk)
NTCAM_PATH ?= hardware/nothing/camera

# Soong Namespace
PRODUCT_SOONG_NAMESPACES += $(NTCAM_PATH)

# SEPolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(NTCAM_PATH)/sepolicy/vendor
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(NTCAM_PATH)/sepolicy/public
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(NTCAM_PATH)/sepolicy/private

# Packages
PRODUCT_PACKAGES += \
    libcamera_client_shim \
    libarcsoft_hdr_detection \
    libarcsoft_mf_superresolution \
    libcpion \
    libtrustedapploader \
    libofflineproc_jni \
    liboemcrypto \
    vendor.noth.hardware.camera-V1-ndk \
    vendor.noth.hardware.camera-service-impl \
    vendor.noth.hardware.camera-service \
    NothingProxy \
    NothingExperience

# Include NTCamera if the prebuilt exists
ifneq ($(wildcard $(NTCAM_PATH)/proprietary/system_ext/priv-app/NTCamera/NTCamera.apk),)
PRODUCT_PACKAGES += NTCamera
endif

# Configuration permissions and allowlists
PRODUCT_COPY_FILES += \
    $(NTCAM_PATH)/configs/nothing-hiddenapi-package-allowlist.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/nothing-hiddenapi-package-allowlist.xml \
    $(NTCAM_PATH)/configs/privapp-permissions-NTCamera.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-NTCamera.xml \
    $(NTCAM_PATH)/configs/privapp-permissions-NothingProxy.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-NothingProxy.xml \
    $(NTCAM_PATH)/configs/linker.config.json:$(TARGET_COPY_OUT_VENDOR)/etc/linker.config.json \
    $(NTCAM_PATH)/configs/task_profiles.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json \
    $(NTCAM_PATH)/configs/init/init.ntcam.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.ntcam.rc \
    $(NTCAM_PATH)/configs/vintf/framework_matrix_nothing.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/vintf/manifest/framework_matrix_nothing.xml

# Proprietary camera configs, fonts, and assets copy rules
PRODUCT_COPY_FILES += \
    $(NTCAM_PATH)/proprietary/system_ext/etc/permissions/privapp-permissions-NothingExperience.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-NothingExperience.xml \
    $(NTCAM_PATH)/proprietary/system_ext/framework/androidx.camera.extensions.impl.advanced.jar:$(TARGET_COPY_OUT_SYSTEM_EXT)/framework/androidx.camera.extensions.impl.advanced.jar \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/NdotFont/Ndot-55.otf:$(TARGET_COPY_OUT_VENDOR)/etc/camera/NdotFont/Ndot-55.otf \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/Robotofont/Roboto-55.ttf:$(TARGET_COPY_OUT_VENDOR)/etc/camera/Robotofont/Roboto-55.ttf \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/SansCJKFont/NotoSansCJK.ttc:$(TARGET_COPY_OUT_VENDOR)/etc/camera/SansCJKFont/NotoSansCJK.ttc \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/ancsat/sat_mecp.bin:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ancsat/sat_mecp.bin \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/ancsat/sat_mecp_plus.bin:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ancsat/sat_mecp_plus.bin \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/basic_param.bin:$(TARGET_COPY_OUT_VENDOR)/etc/camera/basic_param.bin \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/bokeh_caldata_tele_golden.bin:$(TARGET_COPY_OUT_VENDOR)/etc/camera/bokeh_caldata_tele_golden.bin \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/bokeh_caldata_tele_golden_Pro.bin:$(TARGET_COPY_OUT_VENDOR)/etc/camera/bokeh_caldata_tele_golden_Pro.bin \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/bokeh_caldata_uw_golden.bin:$(TARGET_COPY_OUT_VENDOR)/etc/camera/bokeh_caldata_uw_golden.bin \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/bokeh_caldata_uw_golden_Pro.bin:$(TARGET_COPY_OUT_VENDOR)/etc/camera/bokeh_caldata_uw_golden_Pro.bin \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/decision.json:$(TARGET_COPY_OUT_VENDOR)/etc/camera/decision.json \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/decision_pro.json:$(TARGET_COPY_OUT_VENDOR)/etc/camera/decision_pro.json \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/facedetect/VegaDetect.model:$(TARGET_COPY_OUT_VENDOR)/etc/camera/facedetect/VegaDetect.model \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/facesr.model:$(TARGET_COPY_OUT_VENDOR)/etc/camera/facesr.model \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/lens_distortion_calibration.bin:$(TARGET_COPY_OUT_VENDOR)/etc/camera/lens_distortion_calibration.bin \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/nothing_node.bin:$(TARGET_COPY_OUT_VENDOR)/etc/camera/nothing_node.bin \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/nothing_pipeline.bin:$(TARGET_COPY_OUT_VENDOR)/etc/camera/nothing_pipeline.bin \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/ntcamoverridesettings.txt:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ntcamoverridesettings.txt \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/plus_param.bin:$(TARGET_COPY_OUT_VENDOR)/etc/camera/plus_param.bin \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/sdk_params_back.json:$(TARGET_COPY_OUT_VENDOR)/etc/camera/sdk_params_back.json \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/sdk_params_front.json:$(TARGET_COPY_OUT_VENDOR)/etc/camera/sdk_params_front.json \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/vidhance.lic:$(TARGET_COPY_OUT_VENDOR)/etc/camera/vidhance.lic \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/vidhance_calibration:$(TARGET_COPY_OUT_VENDOR)/etc/camera/vidhance_calibration \
    $(NTCAM_PATH)/proprietary/vendor/etc/camera/vidhance_calibration_Plus:$(TARGET_COPY_OUT_VENDOR)/etc/camera/vidhance_calibration_Plus \
    $(NTCAM_PATH)/proprietary/odm/overlayfs_origin/base/etc/camera/camxoverridesettings.txt:$(TARGET_COPY_OUT_ODM)/overlayfs_origin/base/etc/camera/camxoverridesettings.txt \
    $(NTCAM_PATH)/proprietary/odm/overlayfs_origin/pro/etc/camera/camxoverridesettings.txt:$(TARGET_COPY_OUT_ODM)/overlayfs_origin/pro/etc/camera/camxoverridesettings.txt

# Camera Filters (Copy entire directory content recursively)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(NTCAM_PATH)/proprietary/vendor/etc/camera/filter,$(TARGET_COPY_OUT_VENDOR)/etc/camera/filter)

# Framework Compatibility Matrix
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(NTCAM_PATH)/configs/vintf/framework_matrix_nothing.xml

# Properties
PRODUCT_VENDOR_PROPERTIES += \
    camera.disable_zsl_mode=1 \
    ro.camera.enableCamera1MaxZsl=1 \
    ro.camera.disableHeicUltraHDR=true \
    ro.vendor.nothing.feature.base=0x600800001004458438124a040106b4247b97ffL \
    ro.vendor.nothing.feature.diff.device.Asteroids=0x240001a38fc01acc038d140ad44002d0842080L \
    ro.vendor.nothing.feature.diff.plus.Asteroids=0x4000000000000000000000L \
    ro.vendor.nothing.feature.diff.product.Asteroids=0x0
