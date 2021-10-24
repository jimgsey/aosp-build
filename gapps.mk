#
# Copyright (C) 2021 TheHitMan7
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.

# Check Android Platform
ifndef TARGET_ARCH
$(error Android Platform is not set)
endif

# Check Android SDK version
ifndef TARGET_SDK_VERSION
$(error Android SDK version is not set)
endif

# Common source
GAPPS_COMMON_SOURCE := vendor/gapps/sources/$(TARGET_ARCH)/$(TARGET_SDK_VERSION)

# APK source
APK_PREBUILT := vendor/gapps/core/prebuilt.mk

# Common modules
PRODUCT_PACKAGES += \
    AndroidMigratePrebuilt \
    ConfigUpdater \
    GoogleCalendarSyncAdapter \
    GoogleContactsSyncAdapter \
    GoogleExtShared \
    GoogleExtServices \
    GoogleServicesFramework \
    Phonesky \
    PrebuiltGmsCore \
    PlayStoreOverlay \
    SetupWizardPrebuilt

# Common system files
PRODUCT_COPY_FILES += \
    vendor/gapps/sources/$(TARGET_ARCH)/$(TARGET_SDK_VERSION)/etc/default-permissions/default-permissions.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/default-permissions/default-permissions.xml

PRODUCT_COPY_FILES += \
    vendor/gapps/sources/$(TARGET_ARCH)/$(TARGET_SDK_VERSION)/etc/permissions/privapp-permissions-atv.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-atv.xml \
    vendor/gapps/sources/$(TARGET_ARCH)/$(TARGET_SDK_VERSION)/etc/permissions/privapp-permissions-google.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-google.xml \
    vendor/gapps/sources/$(TARGET_ARCH)/$(TARGET_SDK_VERSION)/etc/permissions/split-permissions-google.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/split-permissions-google.xml

PRODUCT_COPY_FILES += \
    vendor/gapps/sources/$(TARGET_ARCH)/$(TARGET_SDK_VERSION)/etc/preferred-apps/google.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/preferred-apps/google.xml

PRODUCT_COPY_FILES += \
    vendor/gapps/sources/$(TARGET_ARCH)/$(TARGET_SDK_VERSION)/etc/sysconfig/google.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/google.xml \
    vendor/gapps/sources/$(TARGET_ARCH)/$(TARGET_SDK_VERSION)/etc/sysconfig/google_build.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/google_build.xml \
    vendor/gapps/sources/$(TARGET_ARCH)/$(TARGET_SDK_VERSION)/etc/sysconfig/google_exclusives_enable.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/google_exclusives_enable.xml \
    vendor/gapps/sources/$(TARGET_ARCH)/$(TARGET_SDK_VERSION)/etc/sysconfig/google-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/google-hiddenapi-package-whitelist.xml \
    vendor/gapps/sources/$(TARGET_ARCH)/$(TARGET_SDK_VERSION)/etc/sysconfig/google-rollback-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/google-rollback-package-whitelist.xml \
    vendor/gapps/sources/$(TARGET_ARCH)/$(TARGET_SDK_VERSION)/etc/sysconfig/google-staged-installer-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/google-staged-installer-whitelist.xml

# Property
-include vendor/gapps/core/property.mk
