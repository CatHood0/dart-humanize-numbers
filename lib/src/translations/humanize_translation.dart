import 'package:humanize_numbers/src/humanize_context.dart';
import 'package:meta/meta.dart';

/// Abstract base class for number-to-word translation implementations
/// 
/// This class is for internal library use only and should not be used directly.
/// Implementations must provide localized translations for number components.
@internal
abstract class HumanizeTranslation {
  /// ISO 639-1 language code for the translation (e.g., "en", "es")
  String get lang;

  /// Default connector between number components
  String get connector;

  /// Generates appropriate conjunction between number groups
  ///
  /// If isRTL is true, left will be right, and right will be left
  /// 
  /// [left]: Left side number value
  /// [right]: Right side number value
  /// [columnIndex]: Current group position (0-based)
  /// [totalColumns]: Total number of groups
  String and(
    int left,
    int right, {
    int columnIndex = -1,
    int totalColumns = -1,
  });

  /// Whether the language uses right-to-left text direction
  bool get isRTL;

  /// Map of single-digit numbers (0-9)
  /// Keys: Number strings ("0"-"9")
  Map<String, String> get ones;

  /// Map of teen numbers (11-19)
  /// Keys: Number strings ("11"-"19")
  Map<String, String> get teens;

  /// Map of tens multiples (10-90)
  /// Keys: Number strings ("10"-"90")
  Map<String, String> get tens;

  /// Map of hundreds multiples (100-900)
  /// Keys: Number strings ("100"-"900")
  Map<String, String> get hundreds;

  /// Map of thousand group denominations
  /// Keys: "singular", "binary", "plural"
  Map<String, String> get thousands;

  /// Map of million group denominations
  /// Keys: "singular", "binary", "plural"
  Map<String, String> get millions;

  /// Map of billion group denominations
  /// Keys: "singular", "binary", "plural"
  Map<String, String> get billions;

  /// Map of trillion group denominations
  /// Keys: "singular", "binary", "plural"
  Map<String, String> get trillions;

  /// Map of quadrillion group denominations
  /// Keys: "singular", "binary", "plural"
  Map<String, String> get quadrillions;

  /// Map of quintillion group denominations
  /// Keys: "singular", "binary", "plural"
  Map<String, String> get quintillions;

  /// Converts a single-digit number to words
  /// 
  /// [number]: Value between 0-9
  /// [context]: Current humanization context
  /// [remainder]: Remaining value after current group
  String getOne(int number, {required HumanizeContext context, int? remainder});

  /// Converts a teen number (11-19) to words
  /// 
  /// [number]: Value between 11-19
  /// [context]: Current humanization context
  /// [remainder]: Remaining value after current group
  String getTeen(int number,
      {required HumanizeContext context, int? remainder});

  /// Converts a tens multiple (10-90) to words
  /// 
  /// [number]: Value between 10-90 (step 10)
  /// [context]: Current humanization context
  /// [remainder]: Remaining value after current group
  String getTen(int number, {required HumanizeContext context, int? remainder});

  /// Converts a hundreds multiple (100-900) to words
  /// 
  /// [number]: Value between 100-900 (step 100)
  /// [context]: Current humanization context
  /// [remainder]: Remaining value after current group
  String getHundred(int number,
      {required HumanizeContext context, int? remainder});

  /// Gets thousand group denomination
  /// 
  /// [type]: Denomination type ("singular", "binary", "plural")
  /// [context]: Current humanization context
  /// [remainder]: Remaining value after current group
  String getThousand(String type,
      {required HumanizeContext context, int? remainder});

  /// Gets million group denomination
  /// 
  /// [type]: Denomination type ("singular", "binary", "plural")
  /// [context]: Current humanization context
  /// [remainder]: Remaining value after current group
  String getMilion(String type,
      {required HumanizeContext context, int? remainder});

  /// Gets billion group denomination
  /// 
  /// [type]: Denomination type ("singular", "binary", "plural")
  /// [context]: Current humanization context
  /// [remainder]: Remaining value after current group
  String getBilion(String type,
      {required HumanizeContext context, int? remainder});

  /// Gets trillion group denomination
  /// 
  /// [type]: Denomination type ("singular", "binary", "plural")
  /// [context]: Current humanization context
  /// [remainder]: Remaining value after current group
  String getTrilion(String type,
      {required HumanizeContext context, int? remainder});

  /// Gets quadrillion group denomination
  /// 
  /// [type]: Denomination type ("singular", "binary", "plural")
  /// [context]: Current humanization context
  /// [remainder]: Remaining value after current group
  String getQuadrillion(String type,
      {required HumanizeContext context, int? remainder});

  /// Gets quintillion group denomination
  /// 
  /// [type]: Denomination type ("singular", "binary", "plural")
  /// [context]: Current humanization context
  /// [remainder]: Remaining value after current group
  String getQuintillion(String type,
      {required HumanizeContext context, int? remainder});
}
