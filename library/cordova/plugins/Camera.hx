package cordova.plugins;

import js.*;
import js.html.*;

/**
 * This plugin provides an API for taking pictures and for choosing images from the system's image library.
 */
@:noUsing
@:native("window.navigator.camera") extern class Camera
{
	/**
	 * Removes intermediate photos taken by the camera from temporary storage.
	 * @param onSuccess Success callback, that called when cleanup succeeds.
	 * @param onError Error callback, that get an error message.
	 */
	static function cleanup(
		onSuccess: Void->Void,
		onError:String->Void) : Void;
	/**
	 * Takes a photo using the camera, or retrieves a photo from the device's image gallery.
	 * @param cameraSuccess Success callback, that get the image
	 * as a base64-encoded String, or as the URI for the image file.
	 * @param cameraError Error callback, that get an error message.
	 * @param cameraOptions Optional parameters to customize the camera settings.
	 */
	static function getPicture(
		cameraSuccess:String->Void,
		cameraError:String->Void,
		?cameraOptions:CameraOptions) : Void;
	// Next will work only on iOS
	//getPicture(
	//    cameraSuccess:String->Void,
	//    cameraError:String->Void,
	//    ?cameraOptions:CameraOptions): CameraPopoverHandle;
}

typedef CameraOptions =
{
	/** Picture quality in range 0-100. Default is 50 */
	@:optional var quality : Float;
	/**
	 * Choose the format of the return value.
	 * Defined in navigator.camera.DestinationType. Default is FILE_URI.
	 *      DATA_URL : 0,   Return image as base64-encoded string
	 *      FILE_URI : 1,   Return image file URI
	 *      NATIVE_URI : 2  Return image native URI
	 *          (e.g., assets-library:// on iOS or content:// on Android)
	 */
	@:optional var destinationType : Float;
	/**
	 * Set the source of the picture.
	 * Defined in navigator.camera.PictureSourceType. Default is CAMERA.
	 *      PHOTOLIBRARY : 0,
	 *      CAMERA : 1,
	 *      SAVEDPHOTOALBUM : 2
	 */
	@:optional var sourceType : Float;
	/** Allow simple editing of image before selection. */
	@:optional var allowEdit : Bool;
	/**
	 * Choose the returned image file's encoding.
	 * Defined in navigator.camera.EncodingType. Default is JPEG
	 *      JPEG : 0    Return JPEG encoded image
	 *      PNG : 1     Return PNG encoded image
	 */
	@:optional var encodingType : Float;
	/**
	 * Width in pixels to scale image. Must be used with targetHeight.
	 * Aspect ratio remains constant.
	*/
	@:optional var targetWidth : Float;
	/**
	 * Height in pixels to scale image. Must be used with targetWidth.
	 * Aspect ratio remains constant.
	 */
	@:optional var targetHeight : Float;
	/**
	 * Set the type of media to select from. Only works when PictureSourceType
	 * is PHOTOLIBRARY or SAVEDPHOTOALBUM. Defined in nagivator.camera.MediaType
	 *      PICTURE: 0      allow selection of still pictures only. DEFAULT.
	 *          Will return format specified via DestinationType
	 *      VIDEO: 1        allow selection of video only, WILL ALWAYS RETURN FILE_URI
	 *      ALLMEDIA : 2    allow selection from all media types
	 */
	@:optional var mediaType : Float;
	/** Rotate the image to correct for the orientation of the device during capture. */
	@:optional var correctOrientation : Bool;
	/** Save the image to the photo album on the device after capture. */
	@:optional var saveToPhotoAlbum : Bool;
	/**
	 * Choose the camera to use (front- or back-facing).
	 * Defined in navigator.camera.Direction. Default is BACK.
	 *      FRONT: 0
	 *      BACK: 1
	 */
	@:optional var cameraDirection : Float;
	/** iOS-only options that specify popover location in iPad. Defined in CameraPopoverOptions. */
	@:optional var popoverOptions : CameraPopoverOptions;
}

/**
 * A handle to the popover dialog created by navigator.camera.getPicture. Used on iOS only.
 */
typedef CameraPopoverHandle =
{
	/**
	 * Set the position of the popover.
	 * @param popoverOptions the CameraPopoverOptions that specify the new position.
	 */
	function setPosition(popoverOptions:CameraPopoverOptions) : Void;
}

/**
 * iOS-only parameters that specify the anchor element location and arrow direction
 * of the popover when selecting images from an iPad's library or album.
 */
typedef CameraPopoverOptions =
{
	var x : Float;
	var y : Float;
	var width : Float;
	var height : Float;
	/**
	 * Direction the arrow on the popover should point. Defined in Camera.PopoverArrowDirection
	 * Matches iOS UIPopoverArrowDirection constants.
	 *      ARROW_UP : 1,        
	 *      ARROW_DOWN : 2,
	 *      ARROW_LEFT : 4,
	 *      ARROW_RIGHT : 8,
	 *      ARROW_ANY : 15
	 */
	var arrowDir : Float;
}

@:noUsing
@:native("window.navigator.camera") extern class CameraConstants
{
	// Camera constants, defined in Camera plugin
	static var DestinationType :
	{
		DATA_URL : Float,
		FILE_URI : Float,
		NATIVE_URI: Float
	};
	static var Direction :
	{
		BACK : Float,
		FRONT : Float
	};
	static var EncodingType :
	{
		JPEG : Float,
		PNG : Float
	};
	static var MediaType :
	{
		PICTURE : Float,
		VIDEO : Float,
		ALLMEDIA : Float
	};
	static var PictureSourceType :
	{
		PHOTOLIBRARY : Float,
		CAMERA : Float,
		SAVEDPHOTOALBUM : Float
	};
	// Used only on iOS
	static var PopoverArrowDirection :
	{
		ARROW_UP : Float,
		ARROW_DOWN : Float,
		ARROW_LEFT : Float,
		ARROW_RIGHT : Float,
		ARROW_ANY : Float
	};
}