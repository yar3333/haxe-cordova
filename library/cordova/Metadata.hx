package cordova;

extern interface Metadata
{
	/**
	 * This is the time at which the file or directory was last modified. 
	 */
	var modificationTime : Date;
	/**
	 * The size of the file, in bytes. This must return 0 for directories. 
	 */
	var size : Float;
}