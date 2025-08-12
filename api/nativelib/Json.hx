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
	public static function read(json:String, flags:JsonReadFlags = JReadNoFlag):JsonDocument {
		return _read(json, flags);
	}

	public static function readFile(path:String, flags:JsonReadFlags = JReadNoFlag):JsonDocument {
		return _read_file(path, flags);
	}

	public function getRoot():JsonValue {
		return _get_root(this);
	}

	@:hlNative('nativelib', 'json_read')
	private static function _read(json:String, flags:Int):JsonDocumentPtr{
		return null;
	}

	@:hlNative('nativelib', 'json_read_file')
	private static function _read_file(path:String, flags:Int):JsonDocumentPtr {
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

	public inline function asRaw():String {
		return @:privateAccess String.fromUTF8(_as_raw(this));
	}
	
	public inline function asBool():Bool {
		return _as_bool(this);
	}

	public inline function asInt():Int64 {
		return _as_int(this);
	}

	public inline function asFloat():Float {
		return _as_float(this);
	}

	public inline function asString():String {
		return @:privateAccess String.fromUTF8(_as_string(this));
	}

	public inline function arraySize():Int {
		return _array_size(this);
	}

	public inline function arrayGet(idx:Int):JsonValue {
		return _array_get(this, idx);
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

	@:hlNative('nativelib', 'json_as_raw')
	private static function _as_raw(val:JsonValuePtr):Bytes {
		return null;
	}

	@:hlNative('nativelib', 'json_as_bool')
	private static function _as_bool(val:JsonValuePtr):Bool {
		return false;
	}

	@:hlNative('nativelib', 'json_as_int')
	private static function _as_int(val:JsonValuePtr):I64 {
		return 0;
	}

	@:hlNative('nativelib', 'json_as_float')
	private static function _as_float(val:JsonValuePtr):F64 {
		return 0;
	}

	@:hlNative('nativelib', 'json_as_string')
	private static function _as_string(val:JsonValuePtr):Bytes {
		return null;
	}

	@:hlNative('nativelib', 'json_array_size')
	private static function _array_size(val:JsonValuePtr):Int {
		return 0;
	}

	@:hlNative('nativelib', 'json_array_get')
	private static function _array_get(val:JsonValuePtr, idx:Int):JsonValuePtr {
		return null;
	}
}

enum abstract JsonType(UI8) from UI8 to UI8 {
	var JNone:UI8 = 0;
	var JRaw:UI8 = 1;
	var JNull:UI8 = 2;
	var JBool:UI8 = 3;
	var JNumber:UI8 = 4;
	var JString:UI8 = 5;
	var JArray:UI8 = 6;
	var JObject:UI8 = 7;
}

enum abstract JsonSubtype(UI8) from UI8 to UI8 {
	var JSubNone:UI8 = 0 << 3;
	var JSubFalse:UI8 = 0 << 3;
	var JSubTrue:UI8 = 1 << 3;
	var JSubUInt:UI8 = 0 << 3;
	var JSubSInt:UI8 = 1 << 3;
	var JSubReal:UI8 = 2 << 3;
}

enum abstract JsonReadFlags(Int) from Int to Int {
	var JReadNoFlag:Int = 0;
	var JReadInsitu:Int = 1 << 0;
	var JReadStopWhenDone:Int = 1 << 1;
	var JReadFollowTrailingCommas:Int = 1 << 2;
	var JReadAllowComments:Int = 1 << 3;
	var JReadAllowInfAndNan:Int = 1 << 4;
	var JReadNumberAsRaw:Int = 1 << 5;
	var JReadAllowInvalidUnicode:Int = 1 << 6;
	var JReadBigNumAsRaw:Int = 1 << 7;
	var JReadAllowBom:Int = 1 << 8;
	var JReadAllowExtNumber:Int = 1 << 9;
	var JReadAllowExtEscape:Int = 1 << 10;
	var JReadAllowExtWhitespace:Int = 1 << 11;
	var JReadAllowSingleQuotedStr:Int = 1 << 12;
	var JReadAllowUnquotedKey:Int = 1 << 13;
	var JReadJson5:Int =
		(1 << 2)  |
		(1 << 3)  |
		(1 << 4)  |
		(1 << 9)  |
		(1 << 10) |
		(1 << 11) |
		(1 << 12) |
		(1 << 13);
}
