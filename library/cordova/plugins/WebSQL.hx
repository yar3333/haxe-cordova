package cordova.plugins;

import js.html.*;

extern class Window
{
	/**
	 * Creates (opens, if exist) database with supplied parameters.
	 * @param  name        Database name
	 * @param  version     Database version
	 * @param  displayname Database display name
	 * @param  size        Size, in bytes
	 * @param  creationCallback Callback, that executed on database creation. Accepts Database object.
	 */
	function openDatabase(name:String,
		version: String,
		displayname: String,
		size: Float,
		?creationCallback:Database->Void) : Database;
}

typedef Database =
{
	/**
	 * Starts new transaction.
	 * @param callback        Function, that will be called when transaction starts.
	 * @param errorCallback   Called, when Transaction fails.
	 * @param successCallback Called, when transaction committed.
	 */
	function transaction(callback:SqlTransaction->Void,
		?errorCallback:SqlError->Void,
		?successCallback:Void->Void) : Void;
	/**
	 * Starts new transaction.
	 * @param callback        Function, that will be called when transaction starts.
	 * @param errorCallback   Called, when Transaction fails.
	 * @param successCallback Called, when transaction committed.
	 */
	function readTransaction(callback:SqlTransaction->Void,
		?errorCallback:SqlError->Void,
		?successCallback:Void->Void) : Void;
	var name : String;
	var version : String;
	var displayName : String;
	var size : Float;
}

declare var Database:
{
	/** Constructor for Database object */
	function new(name:String,
		version: String,
		displayname: String,
		size: Float,
		creationCallback:Database->Void) : Database;
}

typedef SqlTransaction =
{
	/**
	 * Executes SQL statement via current transaction.
	 * @param sql SQL statement to execute.
	 * @param arguments SQL stetement arguments.
	 * @param successCallback Called in case of query has been successfully done.
	 * @param errorCallback   Called, when query fails. Return false to continue transaction; true or no return to rollback.
	 */
	function executeSql(sql:String,
		?arguments:Array<Dynamic>,
		?successCallback:SqlTransaction->SqlResultSet->Void,
		?errorCallback:SqlTransaction->SqlError->Dynamic) : Void;
}

declare SqlTransaction:
{
	function new() : SqlTransaction;
}

typedef SqlResultSet =
{
	var insertId : Float;
	var rowsAffected : Float;
	var rows : SqlResultSetRowList;
}

typedef SqlResultSetRowList =
{
	var length : Float;
	function item(index:Float) : Dynamic;
}

typedef SqlError =
{
	var code : Float;
	var message : String;
}

declare SqlError:
{
	// Error code constants from http://www.w3.org/TR/webdatabase/#sqlerror
	static var UNKNOWN_ERR : Float;
	static var DATABASE_ERR : Float;
	static var VERSION_ERR : Float;
	static var TOO_LARGE_ERR : Float;
	static var QUOTA_ERR : Float;
	static var SYNTAX_ERR : Float;
	static var CONSTRAINT_ERR : Float;
	static var TIMEOUT_ERR : Float;
}