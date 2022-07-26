################################################################################
#
# ti-sgx-demos
#
################################################################################

# This corresponds to SDK 06.00.00.07 plus one pull request
TI_SGX_DEMOS_AM572X_VERSION = bb8b74cdd1323e76697b3eb2258f863b15fee287
TI_SGX_DEMOS_AM572X_SITE = http://git.ti.com/git/graphics/img-pvr-sdk.git
TI_SGX_DEMOS_AM572X_SITE_METHOD = git
TI_SGX_DEMOS_AM572X_LICENSE = Imagination Technologies License Agreement
TI_SGX_DEMOS_AM572X_LICENSE_FILES = LegalNotice.txt

define TI_SGX_DEMOS_AM572X_INSTALL_TARGET_CMDS
	cp -dpfr $(@D)/targetfs/arm/Examples/Advanced/DRM/* \
		$(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
