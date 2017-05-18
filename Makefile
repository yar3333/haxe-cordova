TS_GIT = https://github.com/DefinitelyTyped/DefinitelyTyped.git
TS_SRC = types/cordova*

build: native-ts
	rm -rf library/cordova
	haxelib run refactor dts_to_haxe --out-dir library \
	                                 --root-package cordova \
	                                 --native-namespace window \
	                                 --log-level warn \
	                                 --type-mapper fix_types.rules \
	                                 --typedef-file fix_force_typedefs.list \
	                                 native-ts/types/cordova \
	                                 native-ts/types/cordova-plugin-device \
	                                 native-ts/types/cordova-plugin-device-motion \
	                                 native-ts/types/cordova-plugin-camera \
	                                 native-ts/types/cordova-plugin-device-orientation \
	                                 native-ts/types/cordova-plugin-file
	
	haxelib run refactor override library
	
	# cordova
	haxelib run refactor processFile library/cordova/Cordova.hx postfixes/Cordova.rules
	
	# cordova-plugin-device
	haxelib run refactor processFile library/cordova/Device.hx postfixes/Device.rules
	
	# cordova-plugin-device-motion
	haxelib run refactor processFile library/cordova/Accelerometer.hx postfixes/Accelerometer.rules
	haxelib run refactor replaceInFile library/cordova/WatchHandle.hx "@extern interface WatchHandle@abstract WatchHandle(Int)@"
	
	# cordova-plugin-camera
	haxelib run refactor processFile library/cordova/camera.hx postfixes/camera.rules
	
	# cordova-plugin-device-orientation
	haxelib run refactor processFile library/cordova/Compass.hx postfixes/Compass.rules
	
	# cordova-plugin-file
	haxelib run refactor processFile library/cordova/LocalFileSystem.hx postfixes/LocalFileSystem.rules
	haxelib run refactor processFile library/cordova/FileSaver.hx postfixes/FileSaver.rules
	haxelib run refactor processFile library/cordova/FileWriter.hx postfixes/FileWriter.rules
	
	cp -r manual/* library

native-ts:
	git init native-ts
	cd native-ts && \
	git remote add origin $(TS_GIT) && \
	git config core.sparsecheckout true && \
	echo $(TS_SRC)>> .git/info/sparse-checkout && \
	git pull origin master

rebuild: clean build
