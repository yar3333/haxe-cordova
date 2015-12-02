JS_GIT = https://github.com/mrdoob/three.js.git
TS_GIT = https://github.com/DefinitelyTyped/DefinitelyTyped.git
TS_SRC = cordova

library: native-ts FORCE
	haxelib run refactor convert -es native-ts *.ts library "%(.)(.*)[.]d[.]ts$$%$$^1\$$2.hx%" ts_to_haxe.rules
	haxelib run refactor process -es -ec library *.hx beauty_haxe.rules
	haxelib run refactor reindent library *.hx 4 4 4 4
	
	haxelib run refactor process library *.hx                                      rules/_common.rules
	
	haxelib run refactor processFile library/cordova/Cordova.hx                    rules/Cordova.rules
	haxelib run refactor processFile library/cordova/plugins/Camera.hx             rules/Camera.rules
	haxelib run refactor processFile library/cordova/plugins/Contacts.hx           rules/Contacts.rules
	haxelib run refactor processFile library/cordova/plugins/Device.hx             rules/Device.rules
	haxelib run refactor processFile library/cordova/plugins/DeviceMotion.hx       rules/DeviceMotion.rules
	haxelib run refactor processFile library/cordova/plugins/DeviceOrientation.hx  rules/DeviceOrientation.rules
	haxelib run refactor processFile library/cordova/plugins/Dialogs.hx            rules/Dialogs.rules
	haxelib run refactor processFile library/cordova/plugins/FileSystem.hx         rules/FileSystem.rules
	haxelib run refactor processFile library/cordova/plugins/FileTransfer.hx       rules/FileTransfer.rules
	haxelib run refactor processFile library/cordova/plugins/Globalization.hx      rules/Globalization.rules
	haxelib run refactor processFile library/cordova/plugins/InAppBrowser.hx       rules/InAppBrowser.rules
	haxelib run refactor processFile library/cordova/plugins/Keyboard.hx           rules/Keyboard.rules
	haxelib run refactor processFile library/cordova/plugins/Media.hx              rules/Media.rules
	haxelib run refactor processFile library/cordova/plugins/MediaCapture.hx       rules/MediaCapture.rules
	haxelib run refactor processFile library/cordova/plugins/NetworkInformation.hx rules/NetworkInformation.rules
	haxelib run refactor processFile library/cordova/plugins/Push.hx               rules/Push.rules
	haxelib run refactor processFile library/cordova/plugins/Splashscreen.hx       rules/Splashscreen.rules
	haxelib run refactor processFile library/cordova/plugins/StatusBar.hx          rules/StatusBar.rules
	haxelib run refactor processFile library/cordova/plugins/Vibration.hx          rules/Vibration.rules
	haxelib run refactor processFile library/cordova/plugins/WebSQL.hx             rules/WebSQL.rules
	
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