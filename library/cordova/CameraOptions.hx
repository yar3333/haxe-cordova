package cordova;

extern interface CameraOptions
{
	/**
	 * Picture quality in range 0-100. Default is 50 
	 */
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
	/**
	 * Allow simple editing of image before selection. 
	 */
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
	/**
	 * Rotate the image to correct for the orientation of the device during capture. 
	 */
	@:optional var correctOrientation : Bool;
	/**
	 * Save the image to the photo album on the device after capture. 
	 */
	@:optional var saveToPhotoAlbum : Bool;
	/**
	 * Choose the camera to use (front- or back-facing).
	 * Defined in navigator.camera.Direction. Default is BACK.
	 *      FRONT: 0
	 *      BACK: 1
	 */
	@:optional var cameraDirection : Float;
	/**
	 * iOS-only options that specify popover location in iPad. Defined in CameraPopoverOptions. 
	 */
	@:optional var popoverOptions : CameraPopoverOptions;
}