################################################################################
#
# ti-sgx-km
#
################################################################################

# current HEAD of https://git.ti.com/cgit/graphics/omap5-sgx-ddk-linux/log/?h=ti-img-sgx%2F1.17.4948957%2Fk5.10
TI_SGX_KM_AM572X_VERSION = eda7780bfd5277e16913c9bc0b0e6892b4e79063
TI_SGX_KM_AM572X_SITE = https://git.ti.com/cgit/graphics/omap5-sgx-ddk-linux/snapshot
TI_SGX_KM_AM572X_SOURCE = omap5-sgx-ddk-linux-$(TI_SGX_KM_AM572X_VERSION).tar.xz
TI_SGX_KM_AM572X_LICENSE = GPL-2.0
TI_SGX_KM_AM572X_LICENSE_FILES = eurasia_km/GPL-COPYING

TI_SGX_KM_AM572X_DEPENDENCIES = linux

TI_SGX_KM_AM572X_MAKE_OPTS = \
	$(LINUX_MAKE_FLAGS) \
	KERNELDIR=$(LINUX_DIR) \
	TARGET_PRODUCT=$(TI_SGX_KM_AM572X_PLATFORM_NAME)

TI_SGX_KM_AM572X_PLATFORM_NAME = jacinto6evm

TI_SGX_KM_AM572X_SUBDIR = eurasia_km/eurasiacon/build/linux2/omap_linux

define TI_SGX_KM_AM572X_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TI_SGX_KM_AM572X_MAKE_OPTS) \
		-C $(@D)/$(TI_SGX_KM_AM572X_SUBDIR)
endef

define TI_SGX_KM_AM572X_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TI_SGX_KM_AM572X_MAKE_OPTS) \
		DISCIMAGE=$(TARGET_DIR) \
		kbuild_install -C $(@D)/$(TI_SGX_KM_AM572X_SUBDIR)
endef

$(eval $(generic-package))
