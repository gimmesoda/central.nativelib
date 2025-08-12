function main() {
	final root = nativelib.Json.JsonDocument.read('
		{
			"coolstring": "cool string",
			"coolint": 84,
			"cooldouble": 214.2,
			"cooltrue": true,
			"coolfalse": false,
			"coolobject": {
				"cools": "cool second string"
			}
		}
	').getRoot();

	trace(root.getValue('coolstring').toString());
	trace(root.getValue('coolint').toInt());
	trace(root.getValue('cooldouble').toFloat());
	trace(root.getValue('cooltrue').toBool());
	trace(root.getValue('coolfalse').toBool());
	trace(root.getValue('coolobject').getValue('cools').toString());
}
