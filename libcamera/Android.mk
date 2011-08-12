# this is just a camera stub to link with, real one is copied from proprietary

ifeq ($(findstring galaxytab, $(TARGET_DEVICE)),galaxytab)

LOCAL_PATH:= $(call my-dir)

# Set USE_CAMERA_STUB if you don't want to use the hardware camera.

#
# libcamera
#

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES:=               \
    CameraHardwareStub.cpp      \
    FakeCamera.cpp

LOCAL_MODULE:= libcamera
LOCAL_SHARED_LIBRARIES:= libutils libui liblog libbinder libcutils libcamera_client

ifeq ($(BOARD_CAMERA_USE_GETBUFFERINFO),true)
LOCAL_CFLAGS += -DUSE_GETBUFFERINFO
endif

include $(BUILD_SHARED_LIBRARY)

endif