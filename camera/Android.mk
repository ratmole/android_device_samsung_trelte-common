LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    CameraWrapper.cpp

LOCAL_SHARED_LIBRARIES := \
    libhardware liblog libcamera_client libutils libbase libcutils libdl libsensor \
 android.hidl.token@1.0-utils \
android.hardware.graphics.bufferqueue@1.0

LOCAL_C_INCLUDES := \
    system/media/camera/include \

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE := camera.exynos5
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true
LOCAL_WHOLE_STATIC_LIBRARIES := libarect
include $(BUILD_SHARED_LIBRARY)

