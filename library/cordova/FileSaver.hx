package cordova;

extern class FileSaver extends js.html.EventTarget
{
	/**
	 * The FileSaver object can be in one of 3 states. The readyState attribute, on getting,
	 * must return the current state, which must be one of the following values:
	 *     INIT
	 *     WRITING
	 *     DONE
	 */
	var readyState : Int;
	/**
	 * Handler for writestart events. 
	 */
	var onwritestart : js.html.ProgressEvent->Void;
	/**
	 * Handler for progress events. 
	 */
	var onprogress : js.html.ProgressEvent->Void;
	/**
	 * Handler for write events. 
	 */
	var onwrite : js.html.ProgressEvent->Void;
	/**
	 * Handler for abort events. 
	 */
	var onabort : js.html.ProgressEvent->Void;
	/**
	 * Handler for error events. 
	 */
	var onerror : js.html.ProgressEvent->Void;
	/**
	 * Handler for writeend events. 
	 */
	var onwriteend : js.html.ProgressEvent->Void;
	/**
	 * The last error that occurred on the FileSaver. 
	 */
	var error : js.Error;

	/**
	 * Terminate file operation 
	 */
	function abort() : Void;
}