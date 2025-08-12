#include "wrap.h"

#include <yyjson.h>

#define _JSONDOC _ABSTRACT(yyjson_doc*)
#define _JSONVAL _ABSTRACT(yyjson_val*)

HL_PRIM yyjson_doc* HL_NAME(json_read)(vstring* json, uint32_t flags) {
	char* json_str = hl_to_utf8(json->bytes);
	return yyjson_read(json_str, strlen(json_str), flags);
}

HL_PRIM yyjson_doc* HL_NAME(json_read_file)(vstring* path, uint32_t flags) {
	char* path_str = hl_to_utf8(path->bytes);
	return yyjson_read_file(path_str, flags, nullptr, nullptr);
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

HL_PRIM vbyte* HL_NAME(json_as_raw)(yyjson_val* val) {
	return (vbyte*)yyjson_get_raw(val);
}

HL_PRIM bool HL_NAME(json_as_bool)(yyjson_val* val) {
	return yyjson_get_bool(val);
}

HL_PRIM int64_t HL_NAME(json_as_int)(yyjson_val* val) {
	return yyjson_get_sint(val);
}

HL_PRIM double HL_NAME(json_as_float)(yyjson_val* val) {
	return yyjson_get_real(val);
}

HL_PRIM vbyte* HL_NAME(json_as_string)(yyjson_val* val) {
	return (vbyte*)yyjson_get_str(val);
}

HL_PRIM int HL_NAME(json_array_size)(yyjson_val* val) {
	return yyjson_arr_size(val);
}

HL_PRIM yyjson_val* HL_NAME(json_array_get)(yyjson_val* val, int idx) {
	return yyjson_arr_get(val, idx);
}

DEFINE_PRIM(_JSONDOC, json_read, _STRING _I32)
DEFINE_PRIM(_JSONDOC, json_read_file, _STRING _I32)

DEFINE_PRIM(_JSONVAL, json_get_root, _JSONDOC)
DEFINE_PRIM(_JSONVAL, json_get_value, _JSONVAL _STRING)

DEFINE_PRIM(_I8, json_get_type, _JSONVAL)
DEFINE_PRIM(_I8, json_get_subtype, _JSONVAL)

DEFINE_PRIM(_BYTES, json_as_raw, _JSONVAL)
DEFINE_PRIM(_BOOL, json_as_bool, _JSONVAL)
DEFINE_PRIM(_I64, json_as_int, _JSONVAL)
DEFINE_PRIM(_F64, json_as_float, _JSONVAL)
DEFINE_PRIM(_BYTES, json_as_string, _JSONVAL)

DEFINE_PRIM(_I32, json_array_size, _JSONVAL)
DEFINE_PRIM(_JSONVAL, json_array_get, _JSONVAL _I32)
