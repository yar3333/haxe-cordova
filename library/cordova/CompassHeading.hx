package cordova;

extern interface CompassHeading
{
	/**
	 * The heading in degrees from 0-359.99 at a single moment in time. 
	 */
	var magneticHeading : Float;
	/**
	 * The heading relative to the geographic North Pole in degrees 0-359.99 at a single moment in time. A negative value indicates that the true heading can't be determined. 
	 */
	var trueHeading : Float;
	/**
	 * The deviation in degrees between the reported heading and the true heading. 
	 */
	var headingAccuracy : Float;
	/**
	 * The time at which this heading was determined. 
	 */
	var timestamp : Float;
}