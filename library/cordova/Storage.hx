package cordova;

typedef Database =
{
	/**
	 * Runs a database transaction.
	 */
	function transaction(populate:SQLTransaction->Void, error:SQLTransaction->String->Void, success:Void->Void) : Void;
	
	/**
	 * Method allows scripts to atomically verify the version number and change it at the same time as doing a schema update. 
	 */
	function changeVersion(v1:String, v2:String) : Void;
}

typedef SQLTransaction = 
{
	function executeSql(sql:String) : SQLResultSet;
}

typedef SQLResultSet =
{
	var insertId : Int;
	var rowsAffected : Int;
	var rows : SQLResultSetList;
}

typedef SQLResultSetList =
{
	var length : Int;
	function item(index:Int) : Dynamic;
}

extern class SQLError
{
    static var UNKNOWN_ERR : Int;
    static var DATABASE_ERR : Int;
    static var VERSION_ERR : Int;
    static var TOO_LARGE_ERR : Int;
    static var QUOTA_ERR : Int;
    static var SYNTAX_ERR : Int;
    static var CONSTRAINT_ERR : Int;
    static var TIMEOUT_ERR : Int;

	var code : Int;
	var message : String;
}

typedef LocalStorage =
{
	function key(index:Int) : String;
	function getItem(key:String) : String;
	function setItem(key:String, value:String) : Void;
	function removeItem(key:String) : Void;
	function clear() : Void;
}

@:native("window") extern class Storage
{
	/**
	 * This method will create a new SQL Lite Database and return a Database object. Use the Database Object to manipulate the data.
	 * var db = window.openDatabase("test", "1.0", "Test DB", 1000000);
	 */
	static function openDatabase(name:String, version:String, displayName:String, size:Int) : Database;
	static var localStorage : LocalStorage;
	static var sessionStorage : LocalStorage;
}
