package cordova.plugins;

import js.html.*;

/**
 * The FileTransfer object provides a way to upload files using an HTTP multi-part POST request,
 * and to download files as well.
 */
typedef FileTransfer =
{
	/** Called with a ProgressEvent whenever a new chunk of data is transferred.  */
	var onprogress : ProgressEvent->Void;
	/**
	 * Sends a file to a server.
	 * @param fileURL           Filesystem URL representing the file on the device. For backwards compatibility,
	 *                                this can also be the full path of the file on the device.
	 * @param server            URL of the server to receive the file, as encoded by encodeURI().
	 * @param successCallback   A callback that is passed a FileUploadResult object.
	 * @param errorCallback     A callback that executes if an error occurs retrieving the FileUploadResult. 
	 *                               Invoked with a FileTransferError object.
	 * @param options           Optional parameters.
	 * @param trustAllHosts     Optional parameter, defaults to false. If set to true, it accepts all security certificates.
	 *                               This is useful since Android rejects self-signed security certificates.
	 *                               Not recommended for production use. Supported on Android and iOS.
	 */
	function upload(
		fileURL: String,
		server: String,
		successCallback:FileUploadResult->Void,
		errorCallback:FileTransferError->Void,
		?options:FileUploadOptions,
		?trustAllHosts:Bool) : Void;
	/**
	 * downloads a file from server.
	 * @param source            URL of the server to download the file, as encoded by encodeURI().
	 * @param target            Filesystem url representing the file on the device. For backwards compatibility,
	 *                               this can also be the full path of the file on the device.
	 * @param successCallback   A callback that is passed a FileEntry object. (Function)
	 * @param errorCallback     A callback that executes if an error occurs when retrieving the fileEntry.
	 *                               Invoked with a FileTransferError object.
	 * @param options           Optional parameters.
	 * @param trustAllHosts     Optional parameter, defaults to false. If set to true, it accepts all security certificates.
	 *                               This is useful since Android rejects self-signed security certificates.
	 *                               Not recommended for production use. Supported on Android and iOS.
	 */
	function download(
		source: String,
		target: String,
		successCallback:FileEntry->Void,
		errorCallback:FileTransferError->Void,
		?trustAllHosts:Bool,
		?options:FileDownloadOptions) : Void;
	/**
	 * Aborts an in-progress transfer. The onerror callback is passed a FileTransferError object
	 * which has an error code of FileTransferError.ABORT_ERR.
	 */
	function abort() : Void;
}

declare var FileTransfer:
{
	function new() : FileTransfer;
}

/** A FileUploadResult object is passed to the success callback of the FileTransfer object's upload() method. */
typedef FileUploadResult =
{
	/** The number of bytes sent to the server as part of the upload. */
	var bytesSent : Float;
	/** The HTTP response code returned by the server. */
	var responseCode : Float;
	/** The HTTP response returned by the server. */
	var response : String;
	/** The HTTP response headers by the server. Currently supported on iOS only.*/
	var headers : Dynamic;
}

/** Optional parameters for upload method. */
typedef FileUploadOptions =
{
	/** The name of the form element. Defaults to file. */
	@:optional var fileKey : String;
	/** The file name to use when saving the file on the server. Defaults to image.jpg. */
	@:optional var fileName : String;
	/** The HTTP method to use - either `PUT` or `POST`. Defaults to `POST`. */
	@:optional var httpMethod : String;
	/** The mime type of the data to upload. Defaults to image/jpeg. */
	@:optional var mimeType : String;
	/** A set of optional key/value pairs to pass in the HTTP request. */
	@:optional var params : Dynamic;
	/** Whether to upload the data in chunked streaming mode. Defaults to true. */
	@:optional var chunkedMode : Bool;
	/** A map of header name/header values. Use an array to specify more than one value. */
	@:optional var headers : Array<Dynamic>;
}

/** Optional parameters for download method. */
typedef FileDownloadOptions =
{
	/** A map of header name/header values. */
	@:optional var headers : {}
}

/** A FileTransferError object is passed to an error callback when an error occurs. */
typedef FileTransferError =
{
	/**
	 * One of the predefined error codes listed below.
	 *     FileTransferError.FILE_NOT_FOUND_ERR
	 *     FileTransferError.INVALID_URL_ERR
	 *     FileTransferError.CONNECTION_ERR
	 *     FileTransferError.ABORT_ERR
	 *     FileTransferError.NOT_MODIFIED_ERR
	 */
	var code : Float;
	/** URL to the source. */
	var source : String;
	/** URL to the target. */
	var target : String;
	/** HTTP status code. This attribute is only available when a response code is received from the HTTP connection. */
	var http_status : Float;
	/* Response body. This attribute is only available when a response is received from the HTTP connection. */
	var body : String;
	/* Exception that is thrown by native code */
	var exception : Dynamic;
}

declare FileTransferError:
{
	/** Constructor for FileTransferError object */
	function new(?code:Float, ?source:String, ?target:String, ?status:Float, ?body:Dynamic, ?exception:Dynamic) : FileTransferError;
	FILE_NOT_FOUND_ERR : Float,
	INVALID_URL_ERR : Float,
	CONNECTION_ERR : Float,
	ABORT_ERR : Float,
	NOT_MODIFIED_ERR : Float
}