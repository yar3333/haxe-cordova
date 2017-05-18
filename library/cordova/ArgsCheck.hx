package cordova;

import js.html.*;

extern interface ArgsCheck
{
	var enableChecks : Bool;

	function checkArgs(argsSpec:String, functionName:String, args:Array<Dynamic>, ?callee:Dynamic) : Void;
	function getValue(?value:Dynamic, ?defaultValue:Dynamic) : Dynamic;
}