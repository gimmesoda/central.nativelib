import nativelib.Json;

class JsonTest {
	public static function main() {
		final root = JsonDocument.read("
			{
				coolstring: 'cool string',
				coolint: 84,
				cooldouble: 214.2,
				cooltrue: true,
				coolfalse: false,
				coolobject: {
					cools: 'cool second string',
					coolarray: [ 'cool inner string', 123, true, false, 24.1 ],
				},
			}
		", JsonReadFlags.JReadJson5).getRoot();

		trace(root.getValue('coolstring').asString());
		trace(root.getValue('coolint').asInt());
		trace(root.getValue('cooldouble').asFloat());
		trace(root.getValue('cooltrue').asBool());
		trace(root.getValue('coolfalse').asBool());
		trace(root.getValue('coolobject').getValue('cools').asString());

		trace(root.getValue('coolobject').getValue('coolarray').arraySize());
		trace(root.getValue('coolobject').getValue('coolarray').arrayGet(0).asString());
		trace(root.getValue('coolobject').getValue('coolarray').arrayGet(1).asInt());
		trace(root.getValue('coolobject').getValue('coolarray').arrayGet(2).asBool());
		trace(root.getValue('coolobject').getValue('coolarray').arrayGet(3).asBool());
		trace(root.getValue('coolobject').getValue('coolarray').arrayGet(4).asFloat());
	}
}
