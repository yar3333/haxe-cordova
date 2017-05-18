package cordova;

@:native("window.FileError")
extern class FileErrorCode
{
	static var NOT_FOUND_ERR : Int;
	static var SECURITY_ERR : Int;
	static var ABORT_ERR : Int;
	static var NOT_READABLE_ERR : Int;
	static var ENCODING_ERR : Int;
	static var NO_MODIFICATION_ALLOWED_ERR : Int;
	static var INVALID_STATE_ERR : Int;
	static var SYNTAX_ERR : Int;
	static var INVALID_MODIFICATION_ERR : Int;
	static var QUOTA_EXCEEDED_ERR : Int;
	static var TYPE_MISMATCH_ERR : Int;
	static var PATH_EXISTS_ERR : Int;
}
