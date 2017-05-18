package cordova;

@:native("navigator.camera")
extern class Camera
{
	/**
	 * Removes intermediate photos taken by the camera from temporary storage.
	 */
	static function cleanup(onSuccess:Void->Void, onError:String->Void) : Void;
	/**
	 * Takes a photo using the camera, or retrieves a photo from the device's image gallery.
	 */
	static function getPicture(cameraSuccess:String->Void, cameraError:String->Void, ?cameraOptions:CameraOptions) : Void;
}