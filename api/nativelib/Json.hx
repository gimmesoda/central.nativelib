package nativelib;

import hl.Bytes;
import haxe.Int64;
import hl.F64;
import hl.I64;
import hl.UI8;

class Json {
	public static function parse() {
		
	}
}

private typedef JsonDocumentPtr = hl.Abstract<'yyjson_doc*'>;
abstract JsonDocument(JsonDocumentPtr) from JsonDocumentPtr to JsonDocumentPtr {
	public static function read(json:String):JsonDocument {
		return _read(json);
	}

	public static function readFile(path:String):JsonDocument {
		return _read_file(path);
	}

	public function getRoot():JsonValue {
		return _get_root(this);
	}

	@:hlNative('nativelib', 'json_read')
	private static function _read(json:String):JsonDocumentPtr{
		return null;
	}

	@:hlNative('nativelib', 'json_read_file')
	private static function _read_file(path:String):JsonDocumentPtr {
		return null;
	}

	@:hlNative('nativelib', 'json_get_root')
	private static function _get_root(doc:JsonDocumentPtr):JsonValuePtr {
		return null;
	}
}

private typedef JsonValuePtr = hl.Abstract<'yyjson_val*'>;
abstract JsonValue(JsonValuePtr) from JsonValuePtr to JsonValuePtr {
	public inline function getValue(name:String):JsonValue {
		return _get_value(this, name);
	}

	public inline function getType():JsonType {
		return _get_type(this);
	}

	public inline function getSubtype():JsonType {
		return _get_type(this);
	}

	public inline function toBool():Bool {
		return _to_bool(this);
	}

	public inline function toInt():Int64 {
		return _to_int(this);
	}

	public inline function toFloat():Float {
		return _to_float(this);
	}

	public inline function toString():String {
		return @:privateAccess String.fromUTF8(_to_string(this));
	}

	@:hlNative('nativelib', 'json_get_value')
	private static function _get_value(val:JsonValuePtr, name:String):JsonValuePtr {
		return null;
	}

	@:hlNative('nativelib', 'json_get_type')
	private static function _get_type(val:JsonValuePtr):UI8 {
		return 0;
	}

	@:hlNative('nativelib', 'json_get_subtype')
	private static function _get_subtype(val:JsonValuePtr):UI8 {
		return 0;
	}

	@:hlNative('nativelib', 'json_to_bool')
	private static function _to_bool(val:JsonValuePtr):Bool {
		return false;
	}

	@:hlNative('nativelib', 'json_to_int')
	private static function _to_int(val:JsonValuePtr):I64 {
		return 0;
	}

	@:hlNative('nativelib', 'json_to_float')
	private static function _to_float(val:JsonValuePtr):F64 {
		return 0;
	}

	@:hlNative('nativelib', 'json_to_string')
	private static function _to_string(val:JsonValuePtr):Bytes {
		return null;
	}
}

enum abstract JsonType(UI8) from UI8 to UI8 {
	var NONE:UI8 = 0;
	var RAW:UI8 = 1;
	var NULL:UI8 = 2;
	var BOOL:UI8 = 3;
	var NUM:UI8 = 4;
	var STR:UI8 = 5;
	var ARR:UI8 = 6;
	var OBJ:UI8 = 7;
}

enum abstract JsonSubtype(UI8) from UI8 to UI8 {
	var NONE:UI8 = 0 << 3;
	var FALSE:UI8 = 0 << 3;
	var TRUE:UI8 = 1 << 3;
	var UINT:UI8 = 0 << 3;
	var SINT:UI8 = 1 << 3;
	var REAL:UI8 = 2 << 3;
}
