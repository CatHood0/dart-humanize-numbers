// This script has one task, which is to prevent the translations from
// being accidentally deleted, as we probably will have more than 7 soon
import 'dart:io' show exit;
import 'package:humanize_numbers/src/translations/translations.dart';

// This must be updated once add or remove some translation keys
const int _expectedTranslationKeysLength = 7;

Future<void> main(List<String> args) async {
  checkLength();
  for (final HumanizeTranslation trans in Translations.supportedTranslations.values) {
    _validateMap(
      trans.ones,
      List<String>.generate(10, (int i) => "_$i"),
      "ones",
    );
    _validateMap(
      trans.teens,
      List<String>.generate(9, (int i) => "_${i + 11}"),
      "teens",
    );
    _validateMap(
      trans.tens,
      List<String>.generate(9, (int i) => "_${(i + 1) * 10}"),
      "tens",
    );
    _validateMap(
      trans.hundreds,
      List<String>.generate(9, (int i) => "_${(i + 1) * 100}"),
      "hundreds",
    );
    _validateMap(
      trans.thousands,
      <String>["singular", "binary", "plural"],
      "thousands",
    );
    _validateMap(
      trans.millions,
      <String>["singular", "binary", "plural"],
      "millions",
    );
    _validateMap(
      trans.billions,
      <String>["singular", "binary", "plural"],
      "billions",
    );
    _validateMap(
      trans.trillions,
      <String>["singular", "binary", "plural"],
      "trillions",
    );
  }

  print('All translations passed the check successfully');

  exit(1);
}


void _validateMap(Map<String, dynamic> map, List<String> requiredKeys, String mapName) {
  for (String key in requiredKeys) {
    if (!map.containsKey(key)) {
      print("Missing key '$key' in $mapName");
      exit(1);
    }
  }
}

void checkLength() {
  final int newTranslationKeysLength = Translations.supportedTranslations.keys.length;

  if (newTranslationKeysLength > _expectedTranslationKeysLength) {
    print(
      "You have add a new keys, please update the '_expectedTranslationKeysLength' value",
    );
    print('$newTranslationKeysLength > $_expectedTranslationKeysLength');
    exit(1);
  }
  if (newTranslationKeysLength < _expectedTranslationKeysLength) {
    print(
      "You have removed some keys, please update the '_expectedTranslationKeysLength' value",
    );
    print('$newTranslationKeysLength < $_expectedTranslationKeysLength');
    exit(1);
  }
  if (newTranslationKeysLength != _expectedTranslationKeysLength) {
    print(
      "It's looks like you have modified the keys length without updating the `_expectedTranslationKeysLength` value",
    );
    print('$newTranslationKeysLength != $_expectedTranslationKeysLength');
    exit(1);
  }
}
