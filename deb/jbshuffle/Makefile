include $(THEOS)/makefiles/common.mk

TWEAK_NAME = JBShuffle

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
