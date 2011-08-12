# Copyright (C) 2008 The Android Open Source Project
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
ifeq ($(findstring galaxytab, $(TARGET_DEVICE)),galaxytab)
ifeq ($(BOARD_USES_OVERLAY),true)

LOCAL_PATH := $(call my-dir)
# HAL module implemenation, not prelinked and stored in
# hw/<OVERLAY_HARDWARE_MODULE_ID>.<ro.product.board>.so

include $(CLEAR_VARS)

ifdef BOARD_V4L2_DEVICE
    LOCAL_CFLAGS += -DV4L2_DEVICE=\"$(BOARD_V4L2_DEVICE)\"
endif

LOCAL_C_INCLUDES:= \
      $(LOCAL_PATH)/../../aries-common/include

LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_SHARED_LIBRARIES := liblog libcutils

LOCAL_SRC_FILES := ../../aries-common/liboverlay/v4l2_utils.c \
                   ../../aries-common/liboverlay/overlay.cpp

LOCAL_MODULE := overlay.$(TARGET_BOOTLOADER_BOARD_NAME)
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

endif
endif