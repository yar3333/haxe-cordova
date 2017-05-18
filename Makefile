TS_GIT = https://github.com/DefinitelyTyped/DefinitelyTyped.git
TS_SRC = types/cordova*

build: native-ts
	rm -rf library/cordova
	haxelib run refactor dts_to_haxe --out-dir library \
	                                 --root-package cordova \
	                                 --native-namespace window \
									 --log-level warn \
	                                 --import js.html.* \
									 --type-mapper fix_types.rules \
									 --typedef-file fix_force_typedefs.list \
	                                 native-ts/types/cordova \
	                                 native-ts/types/cordova-plugin-device
	haxelib run refactor override library
	
	haxelib run refactor processFile library/cordova/Cordova.hx postfixes/Cordova.rules
	haxelib run refactor processFile library/cordova/Device.hx postfixes/Device.rules
	
	cp -r manual/* library

native-ts:
	git init native-ts
	cd native-ts && \
	git remote add origin $(TS_GIT) && \
	git config core.sparsecheckout true && \
	echo $(TS_SRC)>> .git/info/sparse-checkout && \
	git pull origin master

rebuild: clean build
