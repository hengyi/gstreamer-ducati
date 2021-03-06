LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_PATH := $(TARGET_OUT)/plugins
LOCAL_SRC_FILES := 				\
	gstrtpmanager.c \
	gstrtpbin.c \
	gstrtpjitterbuffer.c \
	gstrtpptdemux.c \
	gstrtpssrcdemux.c \
	rtpjitterbuffer.c      \
	rtpsession.c      \
	rtpsource.c      \
	rtpstats.c      \
	gstrtpsession.c	\
	gstrtpbin-marshal.c

LOCAL_MODULE:= libgstrtpmanager$(GST_PLUGINS_SUFFIX)

LOCAL_C_INCLUDES :=				\
	$(GST_PLUGINS_BASE_LIBS_C_INCLUDES)	\
	$(LOCAL_PATH)/android-internal		\
	$(GST_PLUGINS_GOOD_TOP)/android-internal

LOCAL_CFLAGS :=					\
	-DHAVE_CONFIG_H

ifeq ($(GST_BUILD_STATIC),true)
GST_PLUGINS_STATIC_LIBRARIES +=			\
	$(LOCAL_MODULE)				

LOCAL_CFLAGS +=					\
	-DSTATIC_PLUGIN_NAME=$(LOCAL_MODULE)

include $(BUILD_STATIC_LIBRARY)
else
LOCAL_SHARED_LIBRARIES :=			\
	$(GLIB_SHARED_LIBRARIES)		\
	$(GST_SHARED_LIBRARIES)			\
	$(GST_BASE_SHARED_LIBRARIES)		
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_TAGS := optional eng
include $(BUILD_SHARED_LIBRARY)
endif
