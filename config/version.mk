# Vanilla
# FOSS
ifeq ($(GAPPS),false)
    WITH_GMS := true
    PRODUCT_RR_EXTRAVERSION := FOSS-
# GAPPS
else ifeq ($(GAPPS),true)
    $(GAPPS will be included in the build)
    PRODUCT_RR_EXTRAVERSION = GAPPS-
    ifeq ($(GAPPS_ARM32),)
        $(warning GAPPS_ARM32 is not set, it defaulting to 64 bit)
        $(warning Dont try to set it, only needed for 32 bit devices)
        $(call inherit-product, vendor/gapps/arm64/arm64-vendor.mk)
    endif
    ifeq ($(GAPPS_ARM32), true)
        $(warning including 32 bit gapps)
        $(call inherit-product, vendor/gapps/arm/arm-vendor.mk)
    endif
endif

# RR System Version
PRODUCT_VERSION = NOV23
RR_VERSION := RR-Rev-Q-$(PRODUCT_VERSION)-$(PRODUCT_RR_EXTRAVERSION)$(shell date +%Y%m%d)-$(RR_BUILD)
RR_BUILDTYPE = UNOFFICIAL
