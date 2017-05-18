package cordova;

@:native("window.document")
extern class Document
{
	static function addEventListener(type:CordovaDocumentEventType, listener:js.html.Event->Dynamic, ?useCapture:Bool) : Void;
	static function removeEventListener(type:CordovaDocumentEventType, listener:js.html.Event->Dynamic, ?useCapture:Bool) : Void;
}