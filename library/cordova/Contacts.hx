package cordova;

typedef Contact 
{
	@:optional var id:String;
	@:optional var displayName:String;
	@:optional var name:ContactName;
	@:optional var nickname:String;
	@:optional var phoneNumbers:Array <ContactField>;
	@:optional var emails:Array <ContactField>;
	@:optional var addresses:Array <ContactAddress>;
	@:optional var ims:Array <ContactField>;
	@:optional var organizations:Array <ContactOrganizations>;
	@:optional var birthday:Date;
	@:optional var note:String;
	@:optional var photos:Array <ContactField>;
	@:optional var categories:Array <ContactField>;
	@:optional var urls:Array <ContactField>;
	
	@:optional function clone ():Contact;
	@:optional function remove ():Void;
	@:optional function save ():Void;
}

typedef ContactName
{
	@:optional var formatted:String;
	@:optional var familyName:String;
	@:optional var givenName:String;
	@:optional var middleName:String;
	@:optional var honorificPrefix:String;
	@:optional var honorificSuffix:String;
}

typedef ContactField
{
	@:optional var type:String;
	@:optional var value:String;
	@:optional var pref:Bool;
}

typedef ContactAddress 
{
	@:optional var pref:Bool;
	@:optional var type:String;
	@:optional var formatted:String;
	@:optional var streetAddress:String;
	@:optional var locality:String;
	@:optional var region:String;
	@:optional var postalCode:String;
	@:optional var country:String;
}

typedef ContactOrganization
{
	@:optional var pref:Bool;
	@:optional var type:String;
	@:optional var name:String;
	@:optional var department:String;
	@:optional var title:String;
}

typedef ContactFindOptions
{
	@:optional var filter:String;
	@:optional var multiple:Bool;
}

@:native("navigator.contacts") extern class Contacts
{
	static function create(properties:Contact) : Contact;
	static function find(fields:Array<String>, success:Array<Contact> -> Void, error:Dynamic->Void, options:ContactFindOptions) : Void;
}
