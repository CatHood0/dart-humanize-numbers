import 'package:meta/meta.dart';

@internal
extension SerializeNumExtension on int {
  List<List<String>> get serializeNumber {
    final List<List<String>> serialized = <List<String>>[];
    List<String> tmp = <String>[];
    int inc = 1;
    List<String> reversedDigits = toString().split("").reversed.toList();

    for (int index = 0; index < reversedDigits.length; index++) {
      tmp.add(reversedDigits[index]);
      if (inc == 3 || index == reversedDigits.length - 1) {
        serialized.insert(0, tmp);
        tmp = <String>[];
        inc = 0;
      }
      inc++;
    }

    return serialized;
  }
}
