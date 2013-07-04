LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_PATH := $(TARGET_OUT)/plugins
LOCAL_SRC_FILES := \
        flumpegdemux.c \
        flutspatinfo.c \
        flutspmtinfo.c \
        flutspmtstreaminfo.c \
        gstmpegdemux.c \
        gstmpegdesc.c \
        gstmpegtsdemux.c \
        gstpesfilter.c \
        gstsectionfilter.c \
        mpegtsparse.c \
        mpegtspacketizer.c


LOCAL_MODULE := libgstmpegdemux$(GST_PLUGINS_SUFFIX)

LOCAL_C_INCLUDES :=				\
	$(GST_PLUGINS_BASE_LIBS_C_INCLUDES)	\
	$(GST_PLUGINS_BAD_TOP)/android-internal

LOCAL_CFLAGS :=					\
	-DHAVE_CONFIG_H

LOCAL_SHARED_LIBRARIES :=			\
	$(GLIB_SHARED_LIBRARIES)		\
	$(GST_SHARED_LIBRARIES)			\
	$(GST_BASE_SHARED_LIBRARIES)		
	
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_TAGS := optional eng

include $(BUILD_SHARED_LIBRARY)
