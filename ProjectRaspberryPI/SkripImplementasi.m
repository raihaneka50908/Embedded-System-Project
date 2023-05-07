board=targetHardware("Raspberry Pi");
board.CoderConfig.TargetLang="C++";

dlcfg=coder.DeepLearningConfig("arm-compute");
dlcfg.ArmArchitecture="armv7";
dlcfg.ArmComputeVersion="19.05";
board.CoderConfig.DeepLearningConfig=dlcfg;

deploy(board,'raspi_gneet_es_proj')