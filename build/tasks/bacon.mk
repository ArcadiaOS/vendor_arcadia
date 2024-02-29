# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -----------------------------------------------------------------
# Lineage OTA update package

LINEAGE_TARGET_PACKAGE := $(PRODUCT_OUT)/$(LINEAGE_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) mv -f $(INTERNAL_OTA_PACKAGE_TARGET) $(LINEAGE_TARGET_PACKAGE)
	$(hide) $(SHA256) $(LINEAGE_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(LINEAGE_TARGET_PACKAGE).sha256sum
	$(hide) ./vendor/lineage/build/tools/createjson.sh $(TARGET_DEVICE) $(PRODUCT_OUT) $(LINEAGE_VERSION).zip
	$(hide) rm -rf $(call intermediates-dir-for,PACKAGING,target_files)
	@echo -e ${CL_GRN}""${CL_GRN}
	@echo -e ${CL_GRN}"---------------------------------------------------"${CL_GRN}
	@echo -e ${CL_GRN}"-   ___                    _ _       ____  _____  -"${CL_GRN}
	@echo -e ${CL_GRN}"-  / _ \                  | (_)     /  _ \/  ___| -"${CL_GRN}
	@echo -e ${CL_GRN}"- / /_\ \_ __ ___ __ _  __| |_  __ _| | | \ `--.  -"${CL_GRN}
	@echo -e ${CL_GRN}"- |  _  | '__/ __/ _` |/ _` | |/ _` | | | |`--. \ -"${CL_GRN}
	@echo -e ${CL_GRN}"- | | | | | | /_| |_| | /_| | | |_| \ \_/ /\__/ / -"${CL_GRN}
	@echo -e ${CL_GRN}"- \_| |_/_|  \___\__,_|\__,_|_|\__,_|\___/\____/  -"${CL_GRN}
	@echo -e ${CL_GRN}"---------------------------------------------------"${CL_GRN}
	@echo -e ${CL_GRN}""${CL_GRN}
	@echo -e ${CL_GRN}"================-Package Completed-================"${CL_RST}
	@echo -e ${CL_GRN}"Zip: "${CL_YLW} $(LINEAGE_TARGET_PACKAGE) ${CL_RST}
	@echo -e ${CL_GRN}"SHA256: "${CL_YLW}" `sha256sum $(LINEAGE_TARGET_PACKAGE) | cut -d ' ' -f 1` "${CL_RST}
	@echo -e ${CL_GRN}"Size: "${CL_YLW}" `ls -l $(LINEAGE_TARGET_PACKAGE) | cut -d ' ' -f 5` "${CL_RST}
	@echo -e ${CL_GRN}"==================================================="${CL_RST}
	@echo -e ""	
