package cordova;

@:enum
abstract CordovaDocumentEventType(String)
{
	var backbutton = "backbutton";
	var deviceready = "deviceready";
	var endcallbutton = "endcallbutton";
	var menubutton = "menubutton";
	var pause = "pause";
	var resume = "resume";
	var searchbutton = "searchbutton";
	var startcallbutton = "startcallbutton";
	var volumedownbutton = "volumedownbutton";
	var volumeupbutton = "volumeupbutton";
}