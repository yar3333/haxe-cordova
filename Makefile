JS_GIT = https://github.com/mrdoob/three.js.git
TS_GIT = https://github.com/DefinitelyTyped/DefinitelyTyped.git
TS_SRC = cordova

library: native-ts FORCE
	haxelib run refactor convert -es native-ts *.ts library "%(.)(.*)[.]d[.]ts$$%$$^1\$$2.hx%" ts_to_haxe.rules
	haxelib run refactor process -es -ec library *.hx beauty_haxe.rules
	haxelib run refactor reindent library *.hx 4 4 4 4
	haxelib run refactor process library *.hx postprocess.rules
	
	haxelib run refactor processFile library/cordova/Cordova.hx postprocess-Cordova.rules
	haxelib run refactor processFile library/cordova/plugins/Camera.hx postprocess-Camera.rules
	haxelib run refactor processFile library/cordova/plugins/Device.hx postprocess-Device.rules
	haxelib run refactor processFile library/cordova/plugins/DeviceMotion.hx postprocess-DeviceMotion.rules
	
	haxelib run refactor replace library/cordova/plugins *.hx "%package cordova;%package cordova.plugins;%"
	haxelib run refactor override library
	#cp -r manual/* library

native-ts:
	git init native-ts
	cd native-ts && \
	git remote add origin $(TS_GIT) && \
	git config core.sparsecheckout true && \
	echo $(TS_SRC)>> .git/info/sparse-checkout && \
	git pull origin master
	rm native-ts/cordova/cordova-tests.ts
	rm native-ts/cordova/plugins/StatusBar-tests.ts

clean:
	rm -rf native-ts

rebuild: prepare-rebuild library

prepare-rebuild:
	rm -rf library/cordova

FORCE: