// Type definitions for Apache Cordova Media plugin.
// Project: https://github.com/apache/cordova-plugin-media
// Definitions by: Microsoft Open Technologies, Inc. <http://msopentech.com>
// Definitions: https://github.com/borisyankov/DefinitelyTyped
// 
// Copyright (c) Microsoft Open Technologies, Inc.
// Licensed under the MIT license.

declare var Media:
{
	function new(
		src: String,
		mediaSuccess: Void->Void,
		?mediaError:MediaError->Dynamic,
		?mediaStatus:Float->Void) : Media;
		//Media statuses
		MEDIA_NONE : Float,
		MEDIA_STARTING : Float,
		MEDIA_RUNNING : Float,
		MEDIA_PAUSED : Float,
		MEDIA_STOPPED: Float
};

/**
 * This plugin provides the ability to record and play back audio files on a device.
 * NOTE: The current implementation does not adhere to a W3C specification for media capture,
 * and is provided for convenience only. A future implementation will adhere to the latest
 * W3C specification and may deprecate the current APIs.
 */
typedef Media =
{
	/**
	 * Returns the current position within an audio file. Also updates the Media object's position parameter.
	 * @param mediaSuccess The callback that is passed the current position in seconds.
	 * @param mediaError   The callback to execute if an error occurs.
	 */
	function getCurrentPosition(
		mediaSuccess:Float->Void,
		?mediaError:MediaError->Void) : Void;
	/** Returns the duration of an audio file in seconds. If the duration is unknown, it returns a value of -1. */
	function getDuration() : Float;
	/** Starts or resumes playing an audio file. */
	function play() : Void;
	/** Pauses playing an audio file. */
	function pause() : Void;
	/**
	 * Releases the underlying operating system's audio resources. This is particularly important
	 * for Android, since there are a finite amount of OpenCore instances for media playback.
	 * Applications should call the release function for any Media resource that is no longer needed.
	 */
	function release() : Void;
	/**
	 * Sets the current position within an audio file.
	 * @param position Position in milliseconds.
	 */
	function seekTo(position:Float) : Void;
	/**
	 * Set the volume for an audio file.
	 * @param volume The volume to set for playback. The value must be within the range of 0.0 to 1.0.
	 */
	function setVolume(volume:Float) : Void;
	/** Starts recording an audio file. */
	function startRecord() : Void;
	/** Stops recording an audio file. */
	function stopRecord() : Void;
	/** Stops playing an audio file. */
	function stop() : Void;
	/**
	 * The position within the audio playback, in seconds.
	 * Not automatically updated during play; call getCurrentPosition to update.
	 */
	var position : Float;
	/** The duration of the media, in seconds. */
	var duration : Float;
}
