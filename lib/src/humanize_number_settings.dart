import 'package:meta/meta.dart';

/// Configuration settings for number humanization output formatting
///
/// This class is for internal library use only and should not be used directly.
@internal
class HumanizeNumberSettings {
  /// Currency symbol to append to the result (e.g., "$", "€")
  String currency;

  /// Prefix text to prepend to the result
  String prefix;

  /// Suffix text to append to the result
  String suffix;

  /// Creates number formatting settings with default values
  HumanizeNumberSettings({
    this.prefix = "",
    this.suffix = "",
    this.currency = "",
  });
}
