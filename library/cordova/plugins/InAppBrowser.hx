package cordova;

import js.html.*;

extern class Window
{
	/**
	 * Opens a URL in a new InAppBrowser instance, the current browser instance, or the system browser.
	 * @param  url     The URL to load.
	 * @param  target  The target in which to load the URL, an optional parameter that defaults to _self.
	 * @param  options Options for the InAppBrowser. Optional, defaulting to: location=yes.
	 *                 The options string must not contain any blank space, and each feature's
	 *                 name/value pairs must be separated by a comma. Feature names are case insensitive.
	 */
	function open(url:String, target?: "_self", ?options:String) : InAppBrowser;
	/**
	 * Opens a URL in a new InAppBrowser instance, the current browser instance, or the system browser.
	 * @param  url     The URL to load.
	 * @param  target  The target in which to load the URL, an optional parameter that defaults to _self.
	 * @param  options Options for the InAppBrowser. Optional, defaulting to: location=yes.
	 *                 The options string must not contain any blank space, and each feature's
	 *                 name/value pairs must be separated by a comma. Feature names are case insensitive.
	 */
	function open(url:String, target?: "_blank", ?options:String) : InAppBrowser;
	/**
	 * Opens a URL in a new InAppBrowser instance, the current browser instance, or the system browser.
	 * @param  url     The URL to load.
	 * @param  target  The target in which to load the URL, an optional parameter that defaults to _self.
	 * @param  options Options for the InAppBrowser. Optional, defaulting to: location=yes.
	 *                 The options string must not contain any blank space, and each feature's
	 *                 name/value pairs must be separated by a comma. Feature names are case insensitive.
	 */
	function open(url:String, target?: "_system", ?options:String) : InAppBrowser;
	/**
	 * Opens a URL in a new InAppBrowser instance, the current browser instance, or the system browser.
	 * @param  url     The URL to load.
	 * @param  target  The target in which to load the URL, an optional parameter that defaults to _self.
	 * @param  options Options for the InAppBrowser. Optional, defaulting to: location=yes.
	 *                 The options string must not contain any blank space, and each feature's
	 *                 name/value pairs must be separated by a comma. Feature names are case insensitive.
	 */
	function open(url:String, ?target:String, ?options:String, ?replace:Bool) : InAppBrowser;
}

/**
 * The object returned from a call to window.open.
 * NOTE: The InAppBrowser window behaves like a standard web browser, and can't access Cordova APIs.
 */
extern interface InAppBrowser extends Window
{
	var onloadstart : InAppBrowserEvent->Void;
	var onloadstop : InAppBrowserEvent->Void;
	var onloaderror : InAppBrowserEvent->Void;
	var onexit : InAppBrowserEvent->Void;
	// addEventListener overloads
	/**
	 * Adds a listener for an event from the InAppBrowser.
	 * @param type      the event to listen for
	 *                  loadstart: event fires when the InAppBrowser starts to load a URL.
	 *                  loadstop: event fires when the InAppBrowser finishes loading a URL.
	 *                  loaderror: event fires when the InAppBrowser encounters an error when loading a URL.
	 *                  exit: event fires when the InAppBrowser window is closed.
	 * @param callback  the function that executes when the event fires. The function is
	 *                  passed an InAppBrowserEvent object as a parameter.
	 */
	function addEventListener(type: "loadstart", callback:InAppBrowserEvent->Void) : Void;
	/**
	 * Adds a listener for an event from the InAppBrowser.
	 * @param type      the event to listen for
	 *                  loadstart: event fires when the InAppBrowser starts to load a URL.
	 *                  loadstop: event fires when the InAppBrowser finishes loading a URL.
	 *                  loaderror: event fires when the InAppBrowser encounters an error when loading a URL.
	 *                  exit: event fires when the InAppBrowser window is closed.
	 * @param callback  the function that executes when the event fires. The function is
	 *                  passed an InAppBrowserEvent object as a parameter.
	 */
	function addEventListener(type: "loadstop", callback:InAppBrowserEvent->Void) : Void;
	/**
	 * Adds a listener for an event from the InAppBrowser.
	 * @param type      the event to listen for
	 *                  loadstart: event fires when the InAppBrowser starts to load a URL.
	 *                  loadstop: event fires when the InAppBrowser finishes loading a URL.
	 *                  loaderror: event fires when the InAppBrowser encounters an error when loading a URL.
	 *                  exit: event fires when the InAppBrowser window is closed.
	 * @param callback  the function that executes when the event fires. The function is
	 *                  passed an InAppBrowserEvent object as a parameter.
	 */
	function addEventListener(type: "loaderror", callback:InAppBrowserEvent->Void) : Void;
	/**
	 * Adds a listener for an event from the InAppBrowser.
	 * @param type      the event to listen for
	 *                  loadstart: event fires when the InAppBrowser starts to load a URL.
	 *                  loadstop: event fires when the InAppBrowser finishes loading a URL.
	 *                  loaderror: event fires when the InAppBrowser encounters an error when loading a URL.
	 *                  exit: event fires when the InAppBrowser window is closed.
	 * @param callback  the function that executes when the event fires. The function is
	 *                  passed an InAppBrowserEvent object as a parameter.
	 */
	function addEventListener(type: "exit", callback:InAppBrowserEvent->Void) : Void;
	/**
	 * Adds a listener for an event from the InAppBrowser.
	 * @param type      the event to listen for
	 *                  loadstart: event fires when the InAppBrowser starts to load a URL.
	 *                  loadstop: event fires when the InAppBrowser finishes loading a URL.
	 *                  loaderror: event fires when the InAppBrowser encounters an error when loading a URL.
	 *                  exit: event fires when the InAppBrowser window is closed.
	 * @param callback  the function that executes when the event fires. The function is
	 *                  passed an InAppBrowserEvent object as a parameter.
	 */
	function addEventListener(type:String, callback:InAppBrowserEvent->Void) : Void;
	// removeEventListener overloads
	/**
	 * Removes a listener for an event from the InAppBrowser.
	 * @param type      The event to stop listening for.
	 *                  loadstart: event fires when the InAppBrowser starts to load a URL.
	 *                  loadstop: event fires when the InAppBrowser finishes loading a URL.
	 *                  loaderror: event fires when the InAppBrowser encounters an error when loading a URL.
	 *                  exit: event fires when the InAppBrowser window is closed.
	 * @param callback  the function that executes when the event fires. The function is
	 *                  passed an InAppBrowserEvent object as a parameter.
	 */
	function removeEventListener(type: "loadstart", callback:InAppBrowserEvent->Void) : Void;
	/**
	 * Removes a listener for an event from the InAppBrowser.
	 * @param type      The event to stop listening for.
	 *                  loadstart: event fires when the InAppBrowser starts to load a URL.
	 *                  loadstop: event fires when the InAppBrowser finishes loading a URL.
	 *                  loaderror: event fires when the InAppBrowser encounters an error when loading a URL.
	 *                  exit: event fires when the InAppBrowser window is closed.
	 * @param callback  the function that executes when the event fires. The function is
	 *                  passed an InAppBrowserEvent object as a parameter.
	 */
	function removeEventListener(type: "loadstop", callback:InAppBrowserEvent->Void) : Void;
	/**
	 * Removes a listener for an event from the InAppBrowser.
	 * @param type      The event to stop listening for.
	 *                  loadstart: event fires when the InAppBrowser starts to load a URL.
	 *                  loadstop: event fires when the InAppBrowser finishes loading a URL.
	 *                  loaderror: event fires when the InAppBrowser encounters an error when loading a URL.
	 *                  exit: event fires when the InAppBrowser window is closed.
	 * @param callback  the function that executes when the event fires. The function is
	 *                  passed an InAppBrowserEvent object as a parameter.
	 */
	function removeEventListener(type: "loaderror", callback:InAppBrowserEvent->Void) : Void;
	/**
	 * Removes a listener for an event from the InAppBrowser.
	 * @param type      The event to stop listening for.
	 *                  loadstart: event fires when the InAppBrowser starts to load a URL.
	 *                  loadstop: event fires when the InAppBrowser finishes loading a URL.
	 *                  loaderror: event fires when the InAppBrowser encounters an error when loading a URL.
	 *                  exit: event fires when the InAppBrowser window is closed.
	 * @param callback  the function that executes when the event fires. The function is
	 *                  passed an InAppBrowserEvent object as a parameter.
	 */
	function removeEventListener(type: "exit", callback:InAppBrowserEvent->Void) : Void;
	/**
	 * Removes a listener for an event from the InAppBrowser.
	 * @param type      The event to stop listening for.
	 *                  loadstart: event fires when the InAppBrowser starts to load a URL.
	 *                  loadstop: event fires when the InAppBrowser finishes loading a URL.
	 *                  loaderror: event fires when the InAppBrowser encounters an error when loading a URL.
	 *                  exit: event fires when the InAppBrowser window is closed.
	 * @param callback  the function that executes when the event fires. The function is
	 *                  passed an InAppBrowserEvent object as a parameter.
	 */
	function removeEventListener(type:String, callback:InAppBrowserEvent->Void) : Void;
	/** Closes the InAppBrowser window. */
	function close() : Void;
	/**
	 * Displays an InAppBrowser window that was opened hidden. Calling this has no effect
	 * if the InAppBrowser was already visible.
	 */
	function show() : Void;
	/**
	 * Injects JavaScript code into the InAppBrowser window.
	 * @param script    Details of the script to run, specifying either a file or code key.
	 * @param callback  The function that executes after the JavaScript code is injected.
	 *                  If the injected script is of type code, the callback executes with
	 *                  a single parameter, which is the return value of the script, wrapped in an Array.
	 *                  For multi-line scripts, this is the return value of the last statement,
	 *                  or the last expression evaluated.
	 */
	function executeScript(script: { code: String }, callback:Dynamic->Void) : Void;
	/**
	 * Injects JavaScript code into the InAppBrowser window.
	 * @param script    Details of the script to run, specifying either a file or code key.
	 * @param callback  The function that executes after the JavaScript code is injected.
	 *                  If the injected script is of type code, the callback executes with
	 *                  a single parameter, which is the return value of the script, wrapped in an Array.
	 *                  For multi-line scripts, this is the return value of the last statement,
	 *                  or the last expression evaluated.
	 */
	function executeScript(script: { file: String }, callback:Dynamic->Void) : Void;
	/**
	 * Injects CSS into the InAppBrowser window.
	 * @param css       Details of the script to run, specifying either a file or code key.
	 * @param callback  The function that executes after the CSS is injected.
	 */
	function insertCSS(css: { code: String }, callback:Void->Void) : Void;
	/**
	 * Injects CSS into the InAppBrowser window.
	 * @param css       Details of the script to run, specifying either a file or code key.
	 * @param callback  The function that executes after the CSS is injected.
	 */
	function insertCSS(css: { file: String }, callback:Void->Void) : Void;
}

extern interface InAppBrowserEvent extends Event
{
	/** the eventname, either loadstart, loadstop, loaderror, or exit. */
	var type : String;
	/** the URL that was loaded. */
	var url : String;
	/** the error code, only in the case of loaderror. */
	var code : Float;
	/** the error message, only in the case of loaderror. */
	var message : String;
}