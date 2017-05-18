TS_GIT = https://github.com/DefinitelyTyped/DefinitelyTyped.git
TS_SRC = types/cordova

build: native-ts
	haxelib run refactor dts_to_haxe --out-dir library \
	                                 --root-package cordova \
	                                 --native-namespace window \
	                                 --log-level warn \
	                                 --import js.html.* \
	                                 --type-mapper fix_types.rules \
	                                 --typedef-file fix_force_typedefs.list \
	                                 native-ts
	haxelib run refactor override library
	
	haxelib run refactor processFile library/cordova/Cordova.hx postfixes/Cordova.rules
	rm library/cordova/Window.hx
	
	cp -r manual/* library

native-ts:
	git init native-ts
	cd native-ts && \
	git remote add origin $(TS_GIT) && \
	git config core.sparsecheckout true && \
	echo $(TS_SRC)>> .git/info/sparse-checkout && \
	git pull origin master

clean:
	rm -rf library/cordova

rebuild: clean build
