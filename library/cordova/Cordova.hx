package cordova;

import js.html.*;

@:native("cordova")
extern class Cordova
{
	/**
	 * Gets the operating system name. 
	 */
	static var platformId : String;
	/**
	 * Gets Cordova framework version 
	 */
	static var version : String;
	/**
	 * Namespace for Cordova plugin functionality 
	 */
	static var plugins : CordovaPlugins;

	/**
	 * Invokes native functionality by specifying corresponding service name, action and optional parameters.
	 */
	static function exec(success:Dynamic->Dynamic, fail:Dynamic->Dynamic, service:String, action:String, ?args:Array<Dynamic>) : Void;
	/**
	 * Defines custom logic as a Cordova module. Other modules can later access it using module name provided. 
	 */
	static function define(moduleName:String, factory:Dynamic->Dynamic->Dynamic->Dynamic) : Void;
	/**
	 * Access a Cordova module by name. 
	 */
	static function require(moduleName:String) : Dynamic;
}