package cordova.plugins;

import js.*;
import js.html.*;

/**
 * This plugin allows to receive push notifications. The Android implementation uses
 * Google's GCM (Google Cloud Messaging) service,
 * whereas the iOS version is based on Apple APNS Notifications
 */
@:noUsing
@:native("window.plugins.pushNotification") extern class PushNotification
{
	/**
	 * Registers as push notification receiver.
	 * @param successCallback     Called when a plugin method returns without error.
	 * @param errorCallback       Called when the plugin returns an error.
	 * @param registrationOptions Options for registration process.
	 */
	static function register(
		successCallback:String->Void,
		errorCallback:Dynamic->Void,
		registrationOptions: RegistrationOptions) : Void;
	/**
	 * Unregisters as push notification receiver.
	 * @param successCallback     Called when a plugin method returns without error.
	 * @param errorCallback       Called when the plugin returns an error.
	 */
	static function unregister(
		successCallback:Dynamic->Void,
		errorCallback:Dynamic->Void) : Void;
	/**
	 * Sets the badge count visible when the app is not running. iOS only.
	 * @param successCallback Called when a plugin method returns without error.
	 * @param errorCallback   Called when the plugin returns an error.
	 * @param badgeCount      An integer indicating what number should show up in the badge. Passing 0 will clear the badge.
	 */
	static function setApplicationIconBadgeNumber(
		successCallback:Dynamic->Void,
		errorCallback:Dynamic->Void,
		badgeCount: Float) : Void;
}

/** Options for registration process. */
typedef RegistrationOptions =
{
	/** This is the Google project ID you need to obtain by registering your application for GCM. Android only */
	@:optional var senderID : String;
	/** WP8 only */
	@:optional var channelName : String;
	/** Callback, that is fired when notification arrived */
	@:optional var ecb : String;
	@:optional var badge : Bool;
	@:optional var sound : Bool;
	@:optional var alert:Bool;
}

