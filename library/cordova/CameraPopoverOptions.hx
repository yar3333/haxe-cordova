package cordova;

extern interface CameraPopoverOptions
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