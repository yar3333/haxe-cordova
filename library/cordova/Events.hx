package cordova;

import js.Lib;

class Events 
{
	public static function deviceready(listener:Void->Void, useCapture = false)
	{
		Lib.document.addEventListener("deviceready", listener, useCapture);
	}
	
	static function pause(listener:Void->Void, useCapture = false)
	{
		Lib.document.addEventListener("pause", listener, useCapture);
	}
	
	static function resume(listener:Void->Void, useCapture = false)
	{
		Lib.document.addEventListener("resume", listener, useCapture);
	}
	
	static function online(listener:Void->Void, useCapture = false)
	{
		Lib.document.addEventListener("online", listener, useCapture);
	}
	
	static function offline(listener:Void->Void, useCapture = false)
	{
		Lib.document.addEventListener("offline", listener, useCapture);
	}
	
	static function backbutton(listener:Void->Void, useCapture = false)
	{
		Lib.document.addEventListener("backbutton", listener, useCapture);
	}
	
	static function batterycritical(listener:{ level:Int, isPlugged:Bool }->Void, useCapture = false)
	{
		Lib.document.addEventListener("batterycritical", listener, useCapture);
	}
	
	static function batterylow(listener:{ level:Int, isPlugged:Bool }->Void, useCapture = false)
	{
		Lib.document.addEventListener("batterylow", listener, useCapture);
	}
	
	static function batterystatus(listener:{ level:Int, isPlugged:Bool }->Void, useCapture = false)
	{
		Lib.document.addEventListener("batterystatus", listener, useCapture);
	}
	
	static function menubutton(listener:Void->Void, useCapture = false)
	{
		Lib.document.addEventListener("menubutton", listener, useCapture);
	}
	
	static function searchbutton(listener:Void->Void, useCapture = false)
	{
		Lib.document.addEventListener("searchbutton", listener, useCapture);
	}
	
	static function startcallbutton(listener:Void->Void, useCapture = false)
	{
		Lib.document.addEventListener("startcallbutton", listener, useCapture);
	}
	
	static function endcallbutton(listener:Void->Void, useCapture = false)
	{
		Lib.document.addEventListener("endcallbutton", listener, useCapture);
	}
	
	static function volumedownbutton(listener:Void->Void, useCapture = false)
	{
		Lib.document.addEventListener("volumedownbutton", listener, useCapture);
	}
	
	static function volumeupbutton(listener:Void->Void, useCapture = false)
	{
		Lib.document.addEventListener("volumeupbutton", listener, useCapture);
	}
}