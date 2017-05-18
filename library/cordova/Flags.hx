package cordova;

extern interface Flags
{
	/**
	 * Used to indicate that the user wants to create a file or directory if it was not previously there. 
	 */
	@:optional var create : Bool;
	/**
	 * By itself, exclusive must have no effect. Used with create, it must cause getFile and getDirectory to fail if the target path already exists. 
	 */
	@:optional var exclusive : Bool;
}