package cordova.plugins;

import js.html.*;

extern class Contacts
{
	/**
	 * The navigator.contacts.create method is synchronous, and returns a new Contact object.
	 * This method does not retain the Contact object in the device contacts database,
	 * for which you need to invoke the Contact.save method.
	 * @param  properties Object with contact fields
	 */
	function create(?properties:ContactProperties) : Contact;
	/**
	 * The navigator.contacts.find method executes asynchronously, querying the device contacts database
	 * and returning an array of Contact objects. The resulting objects are passed to the onSuccess
	 * callback function specified by the onSuccess parameter.
	 * @param fields The fields parameter specifies the fields to be used as a search qualifier,
	 * and only those results are passed to the onSuccess callback function. A zero-length fields parameter
	 * is invalid and results in ContactError.INVALID_ARGUMENT_ERROR. A contactFields value of "*" returns all contact fields.
	 * @param onSuccess Success callback function invoked with the array of Contact objects returned from the database
	 * @param onError Error callback function, invoked when an error occurs.
	 * @param options Search options to filter navigator.contacts.
	 */
	function find(fields:Array<String>,
		onSuccess:Array<Contact>->Void,
		?onError:ContactError->Void,
		?options:ContactFindOptions) : Void;
	/**
	 * The navigator.contacts.pickContact method launches the Contact Picker to select a single contact.
	 * The resulting object is passed to the contactSuccess callback function specified by the contactSuccess parameter.
	 * @param onSuccess Success callback function invoked with the array of Contact objects returned from the database
	 * @param onError Error callback function, invoked when an error occurs.
	 */
	function pickContact(onSuccess:Contact->Void,
		onError:ContactError->Void) : Void
}

extern class ContactProperties
{
	/** A globally unique identifier. */
	@:optional var id : String;
	/** The name of this Contact, suitable for display to end users. */
	@:optional var displayName : String;
	/** An object containing all components of a persons name. */
	@:optional var name : ContactName;
	/** A casual name by which to address the contact. */
	@:optional var nickname : String;
	/** An array of all the contact's phone numbers. */
	@:optional var phoneNumbers : Array<ContactField>;
	/** An array of all the contact's email addresses. */
	@:optional var emails : Array<ContactField>;
	/** An array of all the contact's addresses. */
	@:optional var addresses : Array<ContactAddress>;
	/** An array of all the contact's IM addresses. */
	@:optional var ims : Array<ContactField>;
	/** An array of all the contact's organizations. */
	@:optional var organizations : Array<ContactOrganization>;
	/** The birthday of the contact. */
	@:optional var birthday : Date;
	/** A note about the contact. */
	@:optional var note : String;
	/** An array of the contact's photos. */
	@:optional var photos : Array<ContactField>;
	/** An array of all the user-defined categories associated with the contact. */
	@:optional var categories : Array<ContactField>;
	/** An array of web pages associated with the contact. */
	@:optional var urls : Array<ContactField>;
}

/**
 * The Contact object represents a user's contact. Contacts can be created, stored, or removed
 * from the device contacts database. Contacts can also be retrieved (individually or in bulk)
 * from the database by invoking the navigator.contacts.find method.
 */
extern class Contact extends ContactProperties
{
	/**
	 * Returns a new Contact object that is a deep copy of the calling object, with the id property set to null
	 */
	function clone() : Contact;
	/**
	 * Removes the contact from the device contacts database, otherwise executes an error callback with a ContactError object.
	 * @param onSuccess Success callback function invoked on success operation.
	 * @param onError Error callback function, invoked when an error occurs.
	 */
	function remove(
		onSuccess: Void->Void,
		onError:Error->Void) : Void;
	/**
	 * Saves a new contact to the device contacts database, or updates an existing contact if a contact with the same id already exists.
	 * @param onSuccess Success callback function invoked on success operation with che Contact object.
	 * @param onError Error callback function, invoked when an error occurs.
	 */
	function save(
		onSuccess:Contact->Void,
		onError:Error->Void) : Void;
}

declare var Contact:
{
	/** Constructor of Contact object */
	function new(?id:String,
		?displayName:String,
		?name:ContactName,
		?nickname:String,
		?phoneNumbers:Array<ContactField>,
		?emails:Array<ContactField>,
		?addresses:Array<ContactAddress>,
		?ims:Array<ContactField>,
		?organizations:Array<ContactOrganization>,
		?birthday:Date,
		?note:String,
		?photos:Array<ContactField>,
		?categories:ContactField,
		?urls:Array<ContactField>) : Contact
}

/** The ContactError object is returned to the user through the contactError callback function when an error occurs. */
extern class ContactError
{
	/** Error code */
	var code : Float;
	/** Error message */
	var message : String;
}

declare ContactError:
{
	function new(code:Float) : ContactError;
	UNKNOWN_ERROR : Float,
	INVALID_ARGUMENT_ERROR : Float,
	TIMEOUT_ERROR : Float,
	PENDING_OPERATION_ERROR : Float,
	IO_ERROR : Float,
	NOT_SUPPORTED_ERROR : Float,
	PERMISSION_DENIED_ERROR: Float
}

/** Contains different kinds of information about a Contact object's name. */
extern class ContactName
{
	/** The complete name of the contact. */
	@:optional var formatted : String;
	/** The contact's family name. */
	@:optional var familyName : String;
	/** The contact's given name. */
	@:optional var givenName : String;
	/** The contact's middle name. */
	@:optional var middleName : String;
	/** The contact's prefix (example Mr. or Dr.) */
	@:optional var honorificPrefix : String;
	/** The contact's suffix (example Esq.). */
	@:optional var honorificSuffix : String;
}

declare ContactName:
{
	/** Constructor for ContactName object */
	function new(?formatted:String,
		?familyName:String,
		?givenName:String,
		?middleName:String,
		?honorificPrefix:String,
		?honorificSuffix:String) : ContactName
}

/**
 * The ContactField object is a reusable component that represents contact fields generically.
 * Each ContactField object contains a value, type, and pref property. A Contact object stores
 * several properties in ContactField[] arrays, such as phone numbers and email addresses.
 * 
 * In most instances, there are no pre-determined values for a ContactField object's type attribute.
 * For example, a phone number can specify type values of home, work, mobile, iPhone,
 * or any other value that is supported by a particular device platform's contact database.
 * However, for the Contact photos field, the type field indicates the format of the returned image:
 * url when the value attribute contains a URL to the photo image, or base64 when the value
 * contains a base64-encoded image string.
 */
extern class ContactField
{
	/** A string that indicates what type of field this is, home for example. */
	var type : String;
	/** The value of the field, such as a phone number or email address. */
	var value : String;
	/** Set to true if this ContactField contains the user's preferred value. */
	var pref : Bool;
}

declare ContactField:
{
	/** Constructor for ContactField object */
	function new(?type:String,
		?value:String,
		?pref:Bool) : ContactField
}

/**
 * The ContactAddress object stores the properties of a single address of a contact.
 * A Contact object may include more than one address in a ContactAddress[] array.
 */
extern class ContactAddress
{
	/** Set to true if this ContactAddress contains the user's preferred value. */
	@:optional var pref : Bool;
	/** A string indicating what type of field this is, home for example. */
	@:optional var type : String;
	/** The full address formatted for display. */
	@:optional var formatted : String;
	/** The full street address. */
	@:optional var streetAddress : String;
	/** The city or locality. */
	@:optional var locality : String;
	/** The state or region. */
	@:optional var region : String;
	/** The zip code or postal code. */
	@:optional var postalCode : String;
	/** The country name. */
	@:optional var country : String;
}

declare ContactAddress:
{
	/** Constructor of ContactAddress object */
	function new(?pref:Bool,
		?type:String,
		?formatted:String,
		?streetAddress:String,
		?locality:String,
		?region:String,
		?postalCode:String,
		?country:String) : ContactAddress
}

/**
 * The ContactOrganization object stores a contact's organization properties. A Contact object stores
 * one or more ContactOrganization objects in an array.
 */
extern class ContactOrganization
{
	/** Set to true if this ContactOrganization contains the user's preferred value. */
	@:optional var pref : Bool;
	/** A string that indicates what type of field this is, home for example. */
	@:optional var type : String;
	/** The name of the organization. */
	@:optional var name : String;
	/** The department the contract works for. */
	@:optional var department : String;
	/** The contact's title at the organization. */
	@:optional var title : String;
}

declare ContactOrganization:
{
	/** Constructor for ContactOrganization object */
	function new(?pref:Bool,
		?type:String,
		?name:String,
		?department:String,
		?title:String) : ContactOrganization
}

/** Search options to filter navigator.contacts.  */
extern class ContactFindOptions
{
	/** The search string used to find navigator.contacts. */
	@:optional var filter : String;
	/** Determines if the find operation returns multiple navigator.contacts. */
	@:optional var multiple : Bool;
	/* Contact fields to be returned back. If specified, the resulting Contact object only features values for these fields. */
	@:optional var desiredFields : Array<String>;
}

declare ContactFindOptions:
{
	/** Constructor for ContactFindOptions object */
	function new(?filter:String,
		?multiple:Bool,
		?desiredFields:Array<String>) : ContactFindOptions
}