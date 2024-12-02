.PHONY: clean All Project_Title Project_PreBuild Project_Build Project_PostBuild

All: Project_Title Project_PreBuild Project_Build Project_PostBuild

Project_Title:
	@echo "----------Building project:[ fpv_app_umac4 - FLASH ]----------"

Project_PreBuild:
	@echo Executing Pre Build commands ...
	@export CDKPath="C:/software/CSAY" CDK_VERSION="V2.8.8" ProjectPath="D:/i4season_TX/Halibaduo_TX/TX_Freedom-master/TXW81x_FPV-v2.5.1.7-31060/project/" && D:/i4season_TX/Halibaduo_TX/TX_Freedom-master/TXW81x_FPV-v2.5.1.7-31060/project/prebuild.sh $<
	@echo Done

Project_Build:
	@make -r -f fpv_app_umac4.mk -j 16 -C  ./ 

Project_PostBuild:
	@echo Executing Post Build commands ...
	@export CDKPath="C:/software/CSAY" CDK_VERSION="V2.8.8" ProjectPath="D:/i4season_TX/Halibaduo_TX/TX_Freedom-master/TXW81x_FPV-v2.5.1.7-31060/project/" && D:/i4season_TX/Halibaduo_TX/TX_Freedom-master/TXW81x_FPV-v2.5.1.7-31060/project/BuildBIN.sh
	@echo Done


clean:
	@echo "----------Cleaning project:[ fpv_app_umac4 - FLASH ]----------"

