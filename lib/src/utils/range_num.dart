import 'package:meta/meta.dart';

@internal
extension RangeNum on int {
  bool checkRange({int? min, int? max, bool strict = true}) {
    if (min == null && max == null) return false;
    if (max == null) {
      return strict ? this > min! : this >= min!;
    }
    if (min == null) {
      return strict ? this < max : this <= max;
    }
    return strict ? this > min && this < max : this >= min && this < max;
  }
}

@internal
extension NullableRangeNum on int? {
  bool checkRange({int? min, int? max, bool strict = true}) {
    if (this == null) return false;
    if (min == null && max == null) return false;
    if (max == null) {
      return strict ? this! > min! : this! >= min!;
    }
    if (min == null) {
      return strict ? this! < max : this! <= max;
    }
    return strict ? this! > min && this! < max : this! >= min && this! <= max;
  }
}
