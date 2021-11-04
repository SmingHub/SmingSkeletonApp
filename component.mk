## Local build configuration
## Parameters configured here will override default and ENV values.

export COMPONENT_SEARCH_DIRS := $(CURDIR)/libs


## If you use third-party libraries and they are stored in libs/ 
## then you have to include them in the application configuration.
## Below is an example of using two third-party libraries and one global library 
# LOCAL_COMPONENTS := AXP202X BMA423
# COMPONENT_DEPENDS := Graphics $(LOCAL_COMPONENTS)
# COMPONENT_SUBMODULES := $(addprefix libs/,$(LOCAL_COMPONENTS))

## If your application is supporting only some architectures you can set them. If not set all architectures are supported
# SUPPORTED_ARCH := Host Esp32

ifneq (,$(SUPPORTED_ARCH))
	ifeq (,$(filter $(SMING_ARCH),$(SUPPORTED_ARCH)))
		$(error "Unsupported platform. Only Esp32 and Host are supported")
	endif
endif

COMPONENT_SRCDIRS := \
    app \
    src \
    src/Arch/$(SMING_ARCH)

COMPONENT_INCDIRS := $(COMPONENT_SRCDIRS)  
