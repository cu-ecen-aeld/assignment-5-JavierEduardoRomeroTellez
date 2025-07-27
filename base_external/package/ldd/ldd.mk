
##############################################################
#
# ldd
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 7 git contents
LDD_VERSION = '34e00cd1b0aefbde9a0a79f4fbe1ea476dae1964'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-JavierEduardoRomeroTellez.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = $(D)/misc-modules
LDD_MODULE_SUBDIRS += $(D)/scull

define LDD_BUILD_CMDS
endef

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/scull/scull_load $(BR2_ROOTFS_OVERLAY)/usr/sbin/scull_load
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(BR2_ROOTFS_OVERLAY)/usr/sbin/scull_unload
	$(INSTALL) -D -m 0755 $(@D)/misc-modules/module_load $(BR2_ROOTFS_OVERLAY)/usr/sbin/module_load
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(BR2_ROOTFS_OVERLAY)/usr/sbin/module_unload
endef

$(eval $(kernel-module))
$(eval $(generic-package))