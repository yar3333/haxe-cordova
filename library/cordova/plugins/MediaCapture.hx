package cordova.plugins;

import js.*;
import js.html.*;

extern class Device
{
	static var capture : Capture;
}

/** This plugin provides access to the device's audio, image, and video capture capabilities. */
typedef Capture =
{
	/**
	 * Start the audio recorder application and return information about captured audio clip files.
	 * @param onSuccess Executes when the capture operation finishes with an array
	 *                  of MediaFile objects describing each captured audio clip file.
	 * @param onError   Executes, if the user terminates the operation before an audio clip is captured,
	 *                  with a CaptureError object, featuring the CaptureError.CAPTURE_NO_MEDIA_FILES error code.
	 * @param options   Encapsulates audio capture configuration options.
	 */
	function captureAudio(
			onSuccess:Array<MediaFile>->Void,
			onError:CaptureError->Void,
			?options:AudioOptions) : Void ;
	/**
	 * Start the camera application and return information about captured image files.
	 * @param onSuccess Executes when the capture operation finishes with an array
	 *                  of MediaFile objects describing each captured image clip file.
	 * @param onError   Executes, if the user terminates the operation before an audio clip is captured,
	 *                  with a CaptureError object, featuring the CaptureError.CAPTURE_NO_MEDIA_FILES error code.
	 * @param options   Encapsulates audio capture configuration options.
	 */
	function captureImage(
			onSuccess:Array<MediaFile>->Void,
			onError:CaptureError->Void,
			?options:ImageOptions) : Void ;
	/**
	 * Start the video recorder application and return information about captured video clip files.
	 * @param onSuccess Executes when the capture operation finishes with an array
	 *                  of MediaFile objects describing each captured video clip file.
	 * @param onError   Executes, if the user terminates the operation before an audio clip is captured,
	 *                  with a CaptureError object, featuring the CaptureError.CAPTURE_NO_MEDIA_FILES error code.
	 * @param options   Encapsulates audio capture configuration options.
	 */
	function captureVideo(
			onSuccess:Array<MediaFile>->Void,
			onError:CaptureError->Void,
			?options:VideoOptions) : Void ;
	/** The audio recording formats supported by the device. */
	var supportedAudioModes : Array<ConfigurationData>;
	/** The recording image sizes and formats supported by the device. */
	var supportedImageModes : Array<ConfigurationData>;
	/** The recording video resolutions and formats supported by the device. */
	var supportedVideoModes : Array<ConfigurationData>;
}

/** Encapsulates properties of a media capture file. */
typedef MediaFile =
{
	/** The name of the file, without path information. */
	var name : String;
	/** The full path of the file, including the name. */
	var fullPath : String;
	/** The file's mime type */
	var type : String;
	/** The date and time when the file was last modified. */
	var lastModifiedDate : Date;
	/** The size of the file, in bytes. */
	var size : Float;
	/**
	 * Retrieves format information about the media capture file.
	 * @param successCallback Invoked with a MediaFileData object when successful.
	 * @param errorCallback   Invoked if the attempt fails, this function. 
	 */
	function getFormatData(
		successCallback:MediaFileData->Void,
		?errorCallback:Void->Void) : Void;
}

/** Encapsulates format information about a media file. */
typedef MediaFileData =
{
	/** The actual format of the audio and video content. */
	var codecs : String;
	/** The average bitrate of the content. The value is zero for images. */
	var bitrate : Float;
	/** The height of the image or video in pixels. The value is zero for audio clips. */
	var height : Float;
	/** The width of the image or video in pixels. The value is zero for audio clips. */
	var width : Float;
	/** The length of the video or sound clip in seconds. The value is zero for images. */
	var duration : Float;
}

/** Encapsulates the error code resulting from a failed media capture operation. */
extern class CaptureError
{
	/**
	 * One of the pre-defined error codes listed below.
	 *     CaptureError.CAPTURE_INTERNAL_ERR
	 *         The camera or microphone failed to capture image or sound.
	 *     CaptureError.CAPTURE_APPLICATION_BUSY
	 *         The camera or audio capture application is currently serving another capture request.
	 *     CaptureError.CAPTURE_INVALID_ARGUMENT
	 *         Invalid use of the API (e.g., the value of limit is less than one).
	 *     CaptureError.CAPTURE_NO_MEDIA_FILES
	 *         The user exits the camera or audio capture application before capturing anything.
	 *     CaptureError.CAPTURE_NOT_SUPPORTED
	 *         The requested capture operation is not supported.
	 */
	var code : Float;
	var message : String;

	/** Constructor for CaptureError  */
	function new(code:Float, message:String) : Void;
	CAPTURE_INTERNAL_ERR : Float,
	CAPTURE_APPLICATION_BUSY : Float,
	CAPTURE_INVALID_ARGUMENT : Float,
	CAPTURE_NO_MEDIA_FILES : Float,
	CAPTURE_NOT_SUPPORTED : Float;
}

/** Encapsulates audio capture configuration options. */
typedef AudioOptions =
{
	/**
	 * The maximum number of audio clips the device's user can capture in a single
	 * capture operation. The value must be greater than or equal to 1.
	 */
	@:optional var limit : Float;
	/** The maximum duration of a audio clip, in seconds. */
	@:optional var duration : Float;
}

/** Encapsulates image capture configuration options. */
typedef ImageOptions =
{
	/**
	 * The maximum number of images the user can capture in a single capture operation.
	 * The value must be greater than or equal to 1 (defaults to 1).
	 */
	@:optional var limit : Float;
}

/** Encapsulates video capture configuration options. */
typedef VideoOptions =
{
	/**
	 * The maximum number of video clips the device's user can capture in a single
	 * capture operation. The value must be greater than or equal to 1.
	 */
	@:optional var limit : Float;
	/** The maximum duration of a video clip, in seconds. */
	@:optional var duration : Float;
}

/** Encapsulates a set of media capture parameters that a device supports. */
typedef ConfigurationData =
{
	/** The ASCII-encoded lowercase string representing the media type. */
	var type : String;
	/** The height of the image or video in pixels. The value is zero for sound clips. */
	var height : Float;
	/** The width of the image or video in pixels. The value is zero for sound clips. */
	var width : Float;
}