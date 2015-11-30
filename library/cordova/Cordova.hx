//


typedef Cordova =
{
	/** Invokes native functionality by specifying corresponding service name, action and optional parameters.
	 * @param success A success callback function.
	 * @param fail An error callback function.
	 * @param service The service name to call on the native side (corresponds to a native class).
	 * @param action The action name to call on the native side (generally corresponds to the native class method).
	 * @param args An array of arguments to pass into the native environment.
	 */
	function exec(success:Void->Dynamic, fail:Void->Dynamic, service:String, action:String, ?args:Array<String>) : Void;
	/** Gets the operating system name. */
	var platformId : String;
	/** Gets Cordova framework version */
	var version : String;
	/** Defines custom logic as a Cordova module. Other modules can later access it using module name provided. */
	function define(moduleName:String, factory:Dynamic->Dynamic->Dynamic->Dynamic) : Void;
	/** Access a Cordova module by name. */
	function require(moduleName:String) : Dynamic;
	/** Namespace for Cordova plugin functionality */
	var plugins : CordovaPlugins;
}

typedef CordovaPlugins =
{}

typedef Document =
{
	function addEventListener_deviceready(listener:Event->Dynamic, ?useCapture:Bool) : Void addEventListener("deviceready", listener, useCapture);
	function addEventListener_pause(listener:Event->Dynamic, ?useCapture:Bool) : Void addEventListener("pause", listener, useCapture);
	function addEventListener_resume(listener:Event->Dynamic, ?useCapture:Bool) : Void addEventListener("resume", listener, useCapture);
	function addEventListener_backbutton(listener:Event->Dynamic, ?useCapture:Bool) : Void addEventListener("backbutton", listener, useCapture);
	function addEventListener_menubutton(listener:Event->Dynamic, ?useCapture:Bool) : Void addEventListener("menubutton", listener, useCapture);
	function addEventListener_searchbutton(listener:Event->Dynamic, ?useCapture:Bool) : Void addEventListener("searchbutton", listener, useCapture);
	function addEventListener_startcallbutton(listener:Event->Dynamic, ?useCapture:Bool) : Void addEventListener("startcallbutton", listener, useCapture);
	function addEventListener_endcallbutton(listener:Event->Dynamic, ?useCapture:Bool) : Void addEventListener("endcallbutton", listener, useCapture);
	function addEventListener_volumedownbutton(listener:Event->Dynamic, ?useCapture:Bool) : Void addEventListener("volumedownbutton", listener, useCapture);
	function addEventListener_volumeupbutton(listener:Event->Dynamic, ?useCapture:Bool) : Void addEventListener("volumeupbutton", listener, useCapture);

	function removeEventListener_deviceready(listener:Event->Dynamic, ?useCapture:Bool) : Void removeEventListener("deviceready", listener, useCapture);
	function removeEventListener_pause(listener:Event->Dynamic, ?useCapture:Bool) : Void removeEventListener("pause", listener, useCapture);
	function removeEventListener_resume(listener:Event->Dynamic, ?useCapture:Bool) : Void removeEventListener("resume", listener, useCapture);
	function removeEventListener_backbutton(listener:Event->Dynamic, ?useCapture:Bool) : Void removeEventListener("backbutton", listener, useCapture);
	function removeEventListener_menubutton(listener:Event->Dynamic, ?useCapture:Bool) : Void removeEventListener("menubutton", listener, useCapture);
	function removeEventListener_searchbutton(listener:Event->Dynamic, ?useCapture:Bool) : Void removeEventListener("searchbutton", listener, useCapture);
	function removeEventListener_startcallbutton(listener:Event->Dynamic, ?useCapture:Bool) : Void removeEventListener("startcallbutton", listener, useCapture);
	function removeEventListener_endcallbutton(listener:Event->Dynamic, ?useCapture:Bool) : Void removeEventListener("endcallbutton", listener, useCapture);
	function removeEventListener_volumedownbutton(listener:Event->Dynamic, ?useCapture:Bool) : Void removeEventListener("volumedownbutton", listener, useCapture);
	function removeEventListener_volumeupbutton(listener:Event->Dynamic, ?useCapture:Bool) : Void removeEventListener("volumeupbutton", listener, useCapture);

	function addEventListener(type:String, listener:Event->Dynamic, ?useCapture:Bool) : Void;
	function removeEventListener(type:String, listener:Event->Dynamic, ?useCapture:Bool) : Void;
}

typedef Window =
{
  var cordova : Cordova;
}

// cordova/argscheck module
typedef ArgsCheck =
{
	function checkArgs(argsSpec:String, functionName:String, args:Array<Dynamic>, ?callee:Dynamic) : Void;
	function getValue(?value:Dynamic, ?defaultValue:Dynamic) : Dynamic;
	var enableChecks : Bool;
}

// cordova/urlutil module
typedef UrlUtil =
{
	function makeAbsolute(url:String) : String
}

