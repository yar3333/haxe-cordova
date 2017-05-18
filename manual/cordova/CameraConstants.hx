package cordova;

@:native("window.Camera")
extern class CameraConstants
{
	static var DestinationType : { var DATA_URL : Int; var FILE_URI : Int; var NATIVE_URI : Int; }; 
	static var Direction : { var BACK : Int; var FRONT : Int; }; 
	static var EncodingType : { var JPEG : Int; var PNG : Int; }; 
	static var MediaType : { var PICTURE : Int; var VIDEO : Int; var ALLMEDIA : Int; }; 
	static var PictureSourceType : { var PHOTOLIBRARY : Int; var CAMERA : Int; var SAVEDPHOTOALBUM : Int; }; 
	static var PopoverArrowDirection : { var ARROW_UP : Int; var ARROW_DOWN : Int; var ARROW_LEFT : Int; var ARROW_RIGHT : Int; var ARROW_ANY : Int; }; 
}