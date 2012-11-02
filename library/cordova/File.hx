package cordova;

import js.Lib;

typedef Metadata =
{
	/**
	 * This is the time at which the file or directory was last modified.
	 */
    var modificationTime : Date;
}

extern class FileError
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
	
	var code : Int;
}

extern class FileTransferError
{
    static var FILE_NOT_FOUND_ERR : Int;
    static var INVALID_URL_ERR : Int;
    static var CONNECTION_ERR : Int;
	
    /**
     * One of the predefined error codes listed below.
     */
	var code  : Int;
	
	/**
	 * URI to the source
	 */
    var source : String;
	
	/**
	 * URI to the target
	 */
    var target : String;
    
	/**
	 * HTTP status code. This attribute is only available when a response code is received from the HTTP connection.
	 */
	var http_status : Int;
}

typedef FileUploadResult =
{
	/**
	 * The number of bytes sent to the server as part of the upload. (long)
	 */
    var bytesSent : Int;
    
	/**
	 * The HTTP response code returned by the server. (long)
	 */
	var responseCode : Int;
    
	/**
     * The HTTP response returned by the server. (DOMString)
     */
	var response : String;
}

typedef FileUploadOptions =
{
    /**
     * The name of the form element. If not set defaults to "file". (DOMString)
     */
	var fileKey : String;
    
	/**
	 * The file name you want the file to be saved as on the server. If not set defaults to "image.jpg". (DOMString)
	 */
	var fileName : String;
    
	/**
	 * The mime type of the data you are uploading. If not set defaults to "image/jpeg". (DOMString)
	 */
	var mimeType : String;
    
	/**
	 * A set of optional key/value pairs to be passed along in the HTTP request. (Object)
	 */
	var params : Dynamic;
    
	/**
	 * Should the data be uploaded in chunked streaming mode. If not set defaults to "true". This parameter is ignored on WP7.
	 */
	var chunkedMode : Bool;
    
	/**
	 * A map of header name => header value. To specify multiple values for a header, use an array of values. (Object)
	 */
	var headers : Dynamic;
}

typedef FileTransfer =
{
	/**
	 * Sends a file to a server. 
	 * @param	filePath	Full path of the file on the device.
	 * @param	server		URL of the server to receive the file (must already be encoded using encodeURI()).
	 * @param	success		A callback that is called with a Metadata object.
	 * @param	fail		A callback that is called if an error occurs retrieving the Metadata. Invoked with a FileError object. 
	 * @param	options		Optional parameters such as file name and mimetype.
	 */ 
	function upload(filePath:String, server:String, success:Metadata->Void, fail:FileError->Void, options:Dynamic) : Void;
	
	/**
	 * Downloads a file from server.
	 * @param	source		URL of the server to download the file (must already be encoded using encodeURI()).
	 * @param	target		Full path of the file on the device.
	 * @param	success		A callback that is called with a FileEntry object.
	 * @param	fail		A callback that is called if an error occurs retrieving the Metadata. Invoked with a FileError object.
	 */ 
	function download(source:String, target:String, success:FileEntry->Void, fail:FileError->Void) : Void;
}

typedef DirectoryReader =
{
	/**
	 * Read the entries in a directory. Array<FileEntry|DirectoryEntry>.
	 */
	function readEntries(success:Array<FileEntry>->Void, fail:FileError->Void) : Void;
}

typedef Entry =
{
	var isFile : Bool;
    
	var isDirectory : Bool;
    
	/**
     *  The name of the DirectoryEntry, excluding the path leading to it.
     */
	var name : String;
	
	/**
	 * The full absolute path from the root to the DirectoryEntry.
	 */
    var fullPath : String;
	
	/**
	 * Look up metadata about a directory.
	 */
    function getMetadata(success:Metadata->Void, fail:FileError->Void) : Void;
    
	/**
	 * Set metadata on a directory.
	 */
	function setMetadata(success:Void->Void, fail:Void->Void, keyValues:Dynamic) : Void;
    
	/**
	 * Move a directory to a different location on the file system.
	 * @param	parent		The parent directory to which to move the directory.
	 * @param	newName		The new name of the directory. Defaults to the current name if unspecified. (DOMString)
	 * @param	success		A callback that is called with the DirectoryEntry object of the new directory.
	 * @param	fail		A callback that is called if an error occurs when attempting to move the directory. Invoked with a FileError object.
	 */ 
	function moveTo(parent:DirectoryEntry, newName:String, success:DirectoryEntry->Void, fail:FileError->Void) : Void;
    
	/**
	 * Copy a directory to a different location on the file system.
	 * @param	parent		The parent directory to which to copy the directory.
	 * @param	newName		The new name of the directory. Defaults to the current name if unspecified. (DOMString)
	 * @param	success		A callback that is called with the DirectoryEntry object of the new directory.
	 * @param	fail		A callback that is called if an error occurs when attempting to move the directory. Invoked with a FileError object.
	 */
	function copyTo(parent:DirectoryEntry, newName:String, success:DirectoryEntry->Void, fail:FileError->Void) : Void;
    
	/**
	 * Return a URL that can be used to locate a directory.
	 */
	function toURL() : String;
    
	/**
	 * Delete a directory. The directory must be empty.
	 */
	function remove(success:Void->Void, fail:FileError->Void) : Void;
    
	/**
	 * Look up the parent directory.
	 */
	function getParent(success:DirectoryEntry->Void, fail:FileError->Void) : Void;
}

typedef FileEntry = {>Entry,

	/**
	 *  Creates a FileWriter object that can be used to write to a file.
	 */
	function createWriter(success:FileWriter->Void, fail:FileError->Void) : Void;
	
	/**
	 * Creates a File object containing file properties.
	 */
	function file(success:File->Void, fail:FileError->Void) : Void;
}

typedef DirectoryEntry = {>Entry,
    
	/**
	 * Create a new DirectoryReader that can read entries from a directory.
	 */
	function createReader() : DirectoryReader;
    
	/**
	 * Create or look up a directory.
	 */
	function getDirectory(path:String, options:{ ?create:Bool, ?exclusive:Bool } ), success:DirectoryEntry->Void, fail:FileError->Void) : Void;
	/**
	 * Create or look up a file.
	 */
	function getFile(path:String, options:{ ?create:Bool, ?exclusive:Bool }, success:DirectoryEntry->Void, fail:FileError->Void) : Void;
    
	/**
	 * Delete a directory and all of its contents.
	 */
	function removeRecursively(success:Void->Void, fail:FileError->Void) : Void;
}

typedef FileWriter =
{
    /**
     * One of the three states the reader can be in INIT, WRITING or DONE.
     */
	var readyState : String;
    
	/**
	 * The name of the file to be written. (DOMString)
	 */
	var fileName : String;
    
	/**
	 * The length of the file to be written. (long)
	 */
	var length : Int;
    
	/**
	 * The current position of the file pointer. (long)
	 */
	var position : Int;
    
	/**
	 * An object containing errors.
	 */
	var error : FileError;
    
	/**
	 * 
	 */
	var onwritestart : Void->Void;
    
	/**
	 * Called while writing the file, reports progress (progess.loaded/progress.total). -NOT SUPPORTED
	 */
	//var onprogress : Void->Void;
    
	/**
	 * Called when the request has completed successfully.
	 */	
	var onwrite : Dynamic->Void;
    
	/**
	 * Called when the write has been aborted. For instance, by invoking the abort() method.
	 */	
	var onabort : Void->Void;
    
	/**
	 * Called when the write has failed.
	 */	
	var onerror : FileError->Void;
    
	/**
	 * Called when the request has completed (either in success or failure).
	 */	
	var onwriteend : Dynamic->Void;
	
    /**
     * Aborts writing file.
     */
	function abort() : Void;
    
	/**
	 * Moves the file pointer to the byte specified.
	 */
	function seek(pos:Int) : Void;
    
	/**
	 * Shortens the file to the length specified.
	 */	
	function truncate(len:Int) : Void;
    
	/**
	 * Writes data to the file with a UTF-8 encoding.
	 */
	function write(s:String) : Void;
}

typedef File =
{
    /**
     * The name of the file. (DOMString)
     */
	var name : String;
	
	/**
	 * The full path of the file including the file name. (DOMString)
	 */
    var fullPath : String;
    
	/**
	 * The mime type of the file. (DOMString)
	 */
	var type : String;
    
	/**
	 * The last time the file was modified.
	 */
	var lastModifiedDate : Date;
	
	/**
	 * The size of the file in bytes. (long)
	 */
    var size : Int;
}

extern class LocalFileSystem
{
    /**
     * Used for storage that should not be removed by the user agent without application or user permission.
     */
	static var PERSISTENT : Int;
    
	/**
	 * Used for storage with no guarantee of persistence.
	 */
	static var TEMPORARY : Int;
	
	inline function requestFileSystem(fileSystemType:Int, 0, success:FileEntry->Void, fail:Dynamic->Void) : Void
	{
		Lib.window.requestFileSystem(fileSystemType:Int, 0, success:FileEntry->Void, fail:Dynamic->Void);
	}
	
	inline function resolveLocalFileSystemURI(uri:String, success:FileEntry->Void, fail:Dynamic->Void) : Void
	{
		Lib.window.resolveLocalFileSystemURI(uri:String, success:FileEntry->Void, fail:Dynamic->Void);
	}
}
