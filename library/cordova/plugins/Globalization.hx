package cordova.plugins;

import js.html.*;

/** This plugin obtains information and performs operations specific to the user's locale and timezone. */
typedef Globalization =
{
	/**
	 * Get the string identifier for the client's current language.
	 * @param onSuccess Called on success getting the language with a properties object,
	 *                  that should have a value property with a String value.
	 * @param onError   Called on error getting the language with a GlobalizationError object.
	 *                  The error's expected code is GlobalizationError.UNKNOWN_ERROR.
	 */
	function getPreferredLanguage(
		onSuccess:{ value: String }->Void,
		onError:GlobalizationError->Void) : Void;
	/**
	 * Get the string identifier for the client's current locale setting.
	 * @param onSuccess Called on success getting the locale identifier with a properties object,
	 *                  that should have a value property with a String value.
	 * @param onError   Called on error getting the locale identifier with a GlobalizationError object.
	 *                  The error's expected code is GlobalizationError.UNKNOWN\_ERROR.
	 */
	function getLocaleName(
		onSuccess:{ value: String }->Void,
		onError:GlobalizationError->Void) : Void;
	/**
	 * Returns a date formatted as a string according to the client's locale and timezone.
	 * @param date      Date to format.
	 * @param onSuccess Called on success with a properties object,
	 *                  that should have a value property with a String value.
	 * @param onError   Called on error with a GlobalizationError object.
	 *                  The error's expected code is GlobalizationError.FORMATTING_ERROR.
	 * @param options   Optional format parameters. Default {formatLength:'short', selector:'date and time'}
	 *                      - 'formatLength' can be "short", "medium", "long", or "full".
	 *                      - 'selector' can be "date", "time", or "date and time".
	 */
	function dateToString(
		date: Date,
		onSuccess:{ value: String }->Void,
		onError:GlobalizationError->Void,
		options?:
		{
			@:optional formatLength : String,// "short" | "medium" | "long" | "full"
			@:optional var selector : String;// "date" | "time" | "date and time"
		}) : Void;
	/**
	 * Parses a date formatted as a string, according to the client's user preferences
	 * and calendar using the time zone of the client, and returns the corresponding date object.
	 * @param dateString  String to parse
	 * @param onSuccess   Called on success with GlobalizationDate object
	 * @param onError     Called on error getting the language with a GlobalizationError object.
	 *                    The error's expected code is GlobalizationError.PARSING_ERROR.
	 * @param options     Optional parse parameters. Default {formatLength:'short', selector:'date and time'}
	 */
	function stringToDate(
		dateString: String,
		onSuccess:GlobalizationDate->Void,
		onError:GlobalizationError->Void,
		?options:{ ?type:String, ?item:String }) : Void;
	/**
	 * Returns a pattern string to format and parse dates according to the client's user preferences.
	 * @param onSuccess Called on success getting pattern with a GlobalizationDatePattern object
	 * @param onError   Called on error getting pattern with a GlobalizationError object.
	 *                  The error's expected code is GlobalizationError.PATTERN_ERROR.
	 * @param options   Optional format parameters. Default {formatLength:'short', selector:'date and time'}
	 */
	function getDatePattern(
		onSuccess:GlobalizationDatePattern->Void,
		onError:GlobalizationError->Void,
		?options:{ ?type:String, ?item:String }) : Void;
	/**
	 * Returns an array of the names of the months or days of the week, depending on the client's user preferences and calendar.
	 * @param onSuccess Called on success getting names with a properties object,
	 *                  that should have a value property with a String[] value.
	 * @param onError   Called on error getting the language with a GlobalizationError object.
	 *                  The error's expected code is GlobalizationError.UNKNOWN_ERROR.
	 * @param options   Optional parameters. Default: {type:'wide', item:'months'}
	 */
	function getDateNames(
		onSuccess:{ value: Array<String> }->Void,
		onError:GlobalizationError->Void,
		?options:{ ?type:String, ?item:String }) : Void;
	/**
	 * Indicates whether daylight savings time is in effect for a given date using the client's time zone and calendar.
	 * @param {Date}                   date Date to check
	 * @param onSuccess Called on success with a properties object,
	 *                  that should have a dst property with a boolean value.
	 * @param onError   Called on error with a GlobalizationError object.
	 *                  The error's expected code is GlobalizationError.UNKNOWN_ERROR.
	 */
	function isDaylightSavingsTime(
		date: Date,
		onSuccess:{ dst: Bool }->Void,
		onError:GlobalizationError->Void) : Void;
	/**
	 * Returns the first day of the week according to the client's user preferences and calendar.
	 * @param onSuccess Called on success with a day object,
	 *                  that should have a value property with a number value.
	 * @param onError   Called on error with a GlobalizationError object.
	 *                  The error's expected code is GlobalizationError.UNKNOWN_ERROR.
	 */
	function getFirstDayOfWeek(
		onSuccess:{ value: Float }->Void,
		onError:GlobalizationError->Void) : Void;
	/**
	 * Returns a number formatted as a string according to the client's user preferences.
	 * @param value     Number to format
	 * @param onSuccess Called on success with a result object,
	 *                  that should have a value property with a String value.
	 * @param onError   Called on error with a GlobalizationError object.
	 *                  The error's expected code is GlobalizationError.FORMATTING_ERROR.
	 * @param format    Optional format parameters. Default: {type:'decimal'}
	 */
	function nubmerToString(
		value: Float,
		onSuccess:{ value: String }->Void,
		onError:GlobalizationError->Void,
		?format:{ ?type:String }) : Void;
	/**
	 * Parses a number formatted as a string according to the client's user preferences and returns the corresponding number.
	 * @param value     String to parse
	 * @param onSuccess Called on success with a result object,
	 *                  that should have a value property with a number value.
	 * @param onError   Called on error with a GlobalizationError object.
	 *                  The error's expected code is GlobalizationError.FORMATTING_ERROR.
	 * @param format    Optional format parameters. Default: {type:'decimal'}
	 */
	function stringToNumber(
		value: String,
		onSuccess:{ value: Float }->Void,
		onError:GlobalizationError->Void,
		?format:{ ?type:String }) : Void;
	/**
	 * Returns a pattern string to format and parse numbers according to the client's user preferences.
	 * @param onSuccess Called on success getting pattern with a GlobalizationNumberPattern object
	 * @param onError   Called on error getting the language with a GlobalizationError object.
	 *                  The error's expected code is GlobalizationError.PATTERN_ERROR.
	 * @param options   Optional format parameters. Default {type:'decimal'}.
	 */
	function getNumberPattern(
		onSuccess:GlobalizationNumberPattern->Void,
		onError:GlobalizationError->Void,
		?format:{ ?type:String }) : Void;
	/**
	 * Returns a pattern string to format and parse currency values according to the client's user preferences and ISO 4217 currency code.
	 * @param currencyCode Should be a String of one of the ISO 4217 currency codes, for example 'USD'.
	 * @param onSuccess     Called on success getting pattern with a GlobalizatioCurrencyPattern object
	 * @param onError       Called on error getting pattern with a GlobalizationError object.
	 *                      The error's expected code is GlobalizationError.FORMATTING_ERROR.
	 * @param options       Optional format parameters. Default {type:'decimal'}.
	 */
	function getCurrencyPattern(
		currencyCode: String,
		onSuccess:GlobalizationCurrencyPattern->Void,
		onError:GlobalizationError->Void) : Void;
}

/** Date returned by stringToDate */
typedef GlobalizationDate =
{
	/* The four digit year. */
	var year : Float;
	/* The month from (0-11). */
	var month : Float;
	/* The day from (1-31). */
	var day : Float;
	/* The hour from (0-23). */
	var hour : Float;
	/* The minute from (0-59). */
	var minute : Float;
	/* The second from (0-59). */
	var second : Float;
	/* The milliseconds (from 0-999), not available on all platforms. */
	var millisecond : Float;
}

/** Pattern to format and parse dates according to the client's user preferences.*/
typedef GlobalizationDatePattern =
{
	/* The date and time pattern to format and parse dates. The patterns follow Unicode Technical Standard #35. */
	var pattern : String;
	/* The abbreviated name of the time zone on the client. */
	var timezone : String;
	/* The current difference in seconds between the client's time zone and coordinated universal time. */
	var utc_offset : Float;
	/* The current daylight saving time offset in seconds between the client's non-daylight saving's time zone and the client's daylight saving's time zone. */
	var dst_offset : Float;
}

typedef GlobalizationDateNameOptions =
{
	@:optional var type : String;
	@:optional var item : String;
}

/** Pattern to format and parse numbers according to the client's user preferences. */
typedef GlobalizationNumberPattern =
{
	/* The number pattern to format and parse numbers. The patterns follow Unicode Technical Standard #35. */
	var pattern : String;
	/* The symbol to use when formatting and parsing, such as a percent or currency symbol. */
	var symbol : String;
	/* The number of fractional digits to use when parsing and formatting numbers. */
	var fraction : Float;
	/* The rounding increment to use when parsing and formatting. */
	var rounding : Float;
	/* The symbol to use for positive numbers when parsing and formatting. */
	var positive : String;
	/* The symbol to use for negative numbers when parsing and formatting. */
	var negative : String;
	/* The decimal symbol to use for parsing and formatting. */
	var decimal : String;
	/* The grouping symbol to use for parsing and formatting. */
	var grouping : String;
}

/**
 * Pattern to format and parse currency values according
 * to the client's user preferences and ISO 4217 currency code.
 */
typedef GlobalizationCurrencyPattern =
{
	/** The currency pattern to format and parse currency values. The patterns follow Unicode Technical Standard #35. */
	var pattern : String;
	/** The ISO 4217 currency code for the pattern. */
	var code : String;
	/** The number of fractional digits to use when parsing and formatting currency. */
	var fraction : Float;
	/** The rounding increment to use when parsing and formatting. */
	var rounding : Float;
	/** The decimal symbol to use for parsing and formatting. */
	var decimal : String;
	/** The grouping symbol to use for parsing and formatting. */
	var grouping : String;
}

/** An object representing a error from the Globalization API. */
typedef GlobalizationError =
{
	/** One of the following codes representing the error type:
	  * GlobalizationError.UNKNOWN_ERROR: 0
	  * GlobalizationError.FORMATTING_ERROR: 1
	  * GlobalizationError.PARSING_ERROR: 2
	  * GlobalizationError.PATTERN_ERROR: 3
	  */
	var code : Float;
	/** A text message that includes the error's explanation and/or details */
	var message : String;
}

/** An object representing a error from the Globalization API. */
declare var GlobalizationError:
{
	UNKNOWN_ERROR : Float,
	FORMATTING_ERROR : Float,
	PARSING_ERROR : Float,
	PATTERN_ERROR : Float
}