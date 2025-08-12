#include "wrap.h"

#include <yyjson.h>

#define _JSONDOC _ABSTRACT(yyjson_doc*)
#define _JSONVAL _ABSTRACT(yyjson_val*)

HL_PRIM yyjson_doc* HL_NAME(json_read)(vstring* json) {
	char* json_str = hl_to_utf8(json->bytes);
	return yyjson_read(json_str, strlen(json_str), 0);
}

HL_PRIM yyjson_doc* HL_NAME(json_read_file)(vstring* path) {
	char* path_str = hl_to_utf8(path->bytes);
	return yyjson_read_file(path_str, 0, nullptr, nullptr);
}

HL_PRIM yyjson_val* HL_NAME(json_get_root)(yyjson_doc* doc) {
	return yyjson_doc_get_root(doc);
}

HL_PRIM yyjson_val* HL_NAME(json_get_value)(yyjson_val* val, vstring* name) {
	char* name_str = hl_to_utf8(name->bytes);
	return yyjson_obj_get(val, name_str);
}

HL_PRIM uint8_t HL_NAME(json_get_type)(yyjson_val* val) {
	return yyjson_get_type(val);
}

HL_PRIM uint8_t HL_NAME(json_get_subtype)(yyjson_val* val) {
	return yyjson_get_subtype(val);
}

HL_PRIM bool HL_NAME(json_to_bool)(yyjson_val* val) {
	return yyjson_get_bool(val);
}

HL_PRIM int64_t HL_NAME(json_to_int)(yyjson_val* val) {
	return yyjson_get_sint(val);
}

HL_PRIM double HL_NAME(json_to_float)(yyjson_val* val) {
	return yyjson_get_real(val);
}

HL_PRIM vbyte* HL_NAME(json_to_string)(yyjson_val* val) {
	return (vbyte*)yyjson_get_str(val);
}

DEFINE_PRIM(_JSONDOC, json_read, _STRING)
DEFINE_PRIM(_JSONDOC, json_read_file, _STRING)

DEFINE_PRIM(_JSONVAL, json_get_root, _JSONDOC)
DEFINE_PRIM(_JSONVAL, json_get_value, _JSONVAL _STRING)

DEFINE_PRIM(_I8, json_get_type, _JSONVAL)
DEFINE_PRIM(_I8, json_get_subtype, _JSONVAL)

DEFINE_PRIM(_BOOL, json_to_bool, _JSONVAL)
DEFINE_PRIM(_I64, json_to_int, _JSONVAL)
DEFINE_PRIM(_F64, json_to_float, _JSONVAL)
DEFINE_PRIM(_BYTES, json_to_string, _JSONVAL)
