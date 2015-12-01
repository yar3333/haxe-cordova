package cordova;

import js.*;
import js.html.*;

@:noUsing
@:native("window.cordova") extern class Cordova
{
	/** Invokes native functionality by specifying corresponding service name, action and optional parameters.
	 * @param success A success callback function.
	 * @param fail An error callback function.
	 * @param service The service name to call on the native side (corresponds to a native class).
	 * @param action The action name to call on the native side (generally corresponds to the native class method).
	 * @param args An array of arguments to pass into the native environment.
	 */
	static function exec(success:Void->Dynamic, fail:Void->Dynamic, service:String, action:String, ?args:Array<String>) : Void;
	/** Gets the operating system name. */
	static var platformId : String;
	/** Gets Cordova framework version */
	static var version : String;
	/** Defines custom logic as a Cordova module. Other modules can later access it using module name provided. */
	static function define(moduleName:String, factory:Dynamic->Dynamic->Dynamic->Dynamic) : Void;
	/** Access a Cordova module by name. */
	static function require(moduleName:String) : Dynamic;
	/** Namespace for Cordova plugin functionality */
	static var plugins : CordovaPlugins;
}

typedef CordovaPlugins = Dynamic;

extern class Document
{
	static inline function addEventListener_deviceready(document:js.html.Document, listener:Event->Dynamic, ?useCapture:Bool) : Void document.addEventListener("deviceready", listener, useCapture);
	static inline function addEventListener_pause(document:js.html.Document, listener:Event->Dynamic, ?useCapture:Bool) : Void document.addEventListener("pause", listener, useCapture);
	static inline function addEventListener_resume(document:js.html.Document, listener:Event->Dynamic, ?useCapture:Bool) : Void document.addEventListener("resume", listener, useCapture);
	static inline function addEventListener_backbutton(document:js.html.Document, listener:Event->Dynamic, ?useCapture:Bool) : Void document.addEventListener("backbutton", listener, useCapture);
	static inline function addEventListener_menubutton(document:js.html.Document, listener:Event->Dynamic, ?useCapture:Bool) : Void document.addEventListener("menubutton", listener, useCapture);
	static inline function addEventListener_searchbutton(document:js.html.Document, listener:Event->Dynamic, ?useCapture:Bool) : Void document.addEventListener("searchbutton", listener, useCapture);
	static inline function addEventListener_startcallbutton(document:js.html.Document, listener:Event->Dynamic, ?useCapture:Bool) : Void document.addEventListener("startcallbutton", listener, useCapture);
	static inline function addEventListener_endcallbutton(document:js.html.Document, listener:Event->Dynamic, ?useCapture:Bool) : Void document.addEventListener("endcallbutton", listener, useCapture);
	static inline function addEventListener_volumedownbutton(document:js.html.Document, listener:Event->Dynamic, ?useCapture:Bool) : Void document.addEventListener("volumedownbutton", listener, useCapture);
	static inline function addEventListener_volumeupbutton(document:js.html.Document, listener:Event->Dynamic, ?useCapture:Bool) : Void document.addEventListener("volumeupbutton", listener, useCapture);

	static inline function removeEventListener_deviceready(document:js.html.Document, listener:Event->Dynamic, ?useCapture:Bool) : Void document.removeEventListener("deviceready", listener, useCapture);
	static inline function removeEventListener_pause(document:js.html.Document, listener:Event->Dynamic, ?useCapture:Bool) : Void document.removeEventListener("pause", listener, useCapture);
	static inline function removeEventListener_resume(document:js.html.Document, listener:Event->Dynamic, ?useCapture:Bool) : Void document.removeEventListener("resume", listener, useCapture);
	static inline function removeEventListener_backbutton(document:js.html.Document, listener:Event->Dynamic, ?useCapture:Bool) : Void document.removeEventListener("backbutton", listener, useCapture);
	static inline function removeEventListener_menubutton(document:js.html.Document, listener:Event->Dynamic, ?useCapture:Bool) : Void document.removeEventListener("menubutton", listener, useCapture);
	static inline function removeEventListener_searchbutton(document:js.html.Document, listener:Event->Dynamic, ?useCapture:Bool) : Void document.removeEventListener("searchbutton", listener, useCapture);
	static inline function removeEventListener_startcallbutton(document:js.html.Document, listener:Event->Dynamic, ?useCapture:Bool) : Void document.removeEventListener("startcallbutton", listener, useCapture);
	static inline function removeEventListener_endcallbutton(document:js.html.Document, listener:Event->Dynamic, ?useCapture:Bool) : Void document.removeEventListener("endcallbutton", listener, useCapture);
	static inline function removeEventListener_volumedownbutton(document:js.html.Document, listener:Event->Dynamic, ?useCapture:Bool) : Void document.removeEventListener("volumedownbutton", listener, useCapture);
	static inline function removeEventListener_volumeupbutton(document:js.html.Document, listener:Event->Dynamic, ?useCapture:Bool) : Void document.removeEventListener("volumeupbutton", listener, useCapture);
}

extern class Window
{
  var cordova : Cordova;
}

typedef ArgsCheck =
{
	function checkArgs(argsSpec:String, functionName:String, args:Array<Dynamic>, ?callee:Dynamic) : Void;
	function getValue(?value:Dynamic, ?defaultValue:Dynamic) : Dynamic;
	var enableChecks : Bool;
}

typedef UrlUtil =
{
	function makeAbsolute(url:String) : String;
}

