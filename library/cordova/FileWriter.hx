package cordova;

extern class FileWriter extends FileSaver
{
	/**
	 * The byte offset at which the next write to the file will occur. This always less or equal than length.
	 * A newly-created FileWriter will have position set to 0.
	 */
	var position : Float;
	/**
	 * The length of the file. If the user does not have read access to the file,
	 * this will be the highest byte offset at which the user has written.
	 */
	var length : Float;

	/**
	 * Write the supplied data to the file at position.
	 */
	function write(data:js.html.Blob) : Void;
	/**
	 * The file position at which the next write will occur.
	 */
	function seek(offset:Float) : Void;
	/**
	 * Changes the length of the file to that specified. If shortening the file, data beyond the new length
	 * will be discarded. If extending the file, the existing data will be zero-padded up to the new length.
	 */
	function truncate(size:Float) : Void;
}