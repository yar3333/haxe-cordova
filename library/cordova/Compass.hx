package cordova;

typedef CompassHeading
{
	var magneticHeading : Float;
	var trueHeading : Float;
	var headingAccuracy : Float;
	var timestamp : Int;
}

class CompassError
{
	static var COMPASS_INTERNAL_ERR : Int;
	static var COMPASS_NOT_SUPPORTED : Int;
	
	var code : Int;
}

typedef CompassOptions
{
	@:optional var frequency : Int;
	@:optional var filter : Float;
}

@:native("navigator.compass") extern class Compass 
{
	static function getCurrentHeading(success:CompassHeading->Void, error:CompassError->Void, ?options:CompassOptions) : Void;
	static function watchHeading(success:CompassHeading->Void, error:CompassError->Void, ?options:CompassOptions) : Dynamic;
	static function clearWatch(watchID:Dynamic) : Void;
}
