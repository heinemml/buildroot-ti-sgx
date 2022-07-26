################################################################################
#
# ti-sgx-um
#
################################################################################

# HEAD of branch https://git.ti.com/cgit/graphics/omap5-sgx-ddk-um-linux/log/?h=1.17.4948957-next
TI_SGX_UM_AM572X_VERSION = 742cf38aba13e1ba1a910cf1f036a1a212c263b6
TI_SGX_UM_AM572X_SITE = https://git.ti.com/cgit/graphics/omap5-sgx-ddk-um-linux/snapshot
TI_SGX_UM_AM572X_SOURCE = omap5-sgx-ddk-um-linux-$(TI_SGX_UM_AM572X_VERSION).tar.xz
TI_SGX_UM_AM572X_LICENSE = TI TSPA License
TI_SGX_UM_AM572X_LICENSE_FILES = TI-Linux-Graphics-DDK-UM-Manifest.doc
TI_SGX_UM_AM572X_INSTALL_STAGING = YES
TI_SGX_UM_AM572X_TARGET=jacinto6evm

# ti-sgx-um is a egl/gles provider only if libdrm is installed
TI_SGX_UM_AM572X_DEPENDENCIES = libdrm wayland
TI_SGX_UM_AM572X_PROVIDES = libegl libgles powervr

define TI_SGX_UM_AM572X_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DISCIMAGE=$(STAGING_DIR) \
		TARGET_PRODUCT=$(TI_SGX_UM_AM572X_TARGET) install
endef

define TI_SGX_UM_AM572X_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DISCIMAGE=$(TARGET_DIR) \
		TARGET_PRODUCT=$(TI_SGX_UM_AM572X_TARGET) install
endef

define TI_SGX_UM_AM572X_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 0755 $(TI_SGX_UM_AM572X_PKGDIR)/start-graphics-driver.service \
		$(TARGET_DIR)/lib/systemd/system/start-graphics-driver.service
endef

define TI_SGX_UM_AM572X_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 package/ti-sgx-um/S80ti-sgx \
		$(TARGET_DIR)/etc/init.d/S80ti-sgx
endef

$(eval $(generic-package))
