import 'package:humanize_numbers/src/humanize_context.dart';
import 'package:humanize_numbers/src/translations/default_get_humanize_translations_impl.dart';
import 'package:humanize_numbers/src/translations/translations.dart';
import 'package:humanize_numbers/src/utils/range_num.dart';

class GermanTranslation extends HumanizeTranslation
    with DefaultGetNumbersHumanizeTranslation {
  @override
  String get lang => "de";

  /// German does not add any space type between its numbers
  @override
  String get connector => '';

  @override
  bool get isRTL => true;

  @override
  String and(
    int left,
    int right, {
    int columnIndex = -1,
    int totalColumns = -1,
  }) {
    if (left.checkRange(min: 1, max: 9, strict: false) &&
        right.checkRange(min: 10, max: 100, strict: false)) {
      return "und";
    }
    return "";
  }

  @override
  Map<String, String> get ones => <String, String>{
        "_0": "null",
        "_1": "eins",
        "_2": "zwei",
        "_3": "drei",
        "_4": "vier",
        "_5": "fünf",
        "_6": "sechs",
        "_7": "sieben",
        "_8": "acht",
        "_9": "neun",
      };

  @override
  Map<String, String> get teens => <String, String>{
        "_11": "elf",
        "_12": "zwölf",
        "_13": "dreizehn",
        "_14": "vierzehn",
        "_15": "fünfzehn",
        "_16": "sechzehn",
        "_17": "siebzehn",
        "_18": "achtzehn",
        "_19": "neunzehn",
      };

  @override
  Map<String, String> get tens => <String, String>{
        "_10": "zehn",
        "_20": "zwanzig",
        "_30": "dreißig",
        "_40": "vierzig",
        "_50": "fünfzig",
        "_60": "sechzig",
        "_70": "siebzig",
        "_80": "achtzig",
        "_90": "neunzig",
      };

  @override
  Map<String, String> get hundreds => <String, String>{
        "_100": "einhundert",
        "_200": "zweihundert",
        "_300": "dreihundert",
        "_400": "vierhundert",
        "_500": "fünfhundert",
        "_600": "sechshundert",
        "_700": "siebenhundert",
        "_800": "achthundert",
        "_900": "neunhundert",
      };

  @override
  Map<String, String> get thousands => <String, String>{
        "singular": "tausend",
        "binary": "zweitausend",
        "plural": "tausend",
      };

  @override
  Map<String, String> get millions => <String, String>{
        "singular": "eine Million",
        "binary": "zwei Millionen",
        "plural": "Millionen",
      };

  @override
  Map<String, String> get billions => <String, String>{
        "singular": "eine Milliarde",
        "binary": "zwei Milliarden",
        "plural": "Milliarden",
      };

  @override
  Map<String, String> get trillions => <String, String>{
        "singular": "eine Billion",
        "binary": "zwei Billionen",
        "plural": "Billionen",
      };

  @override
  Map<String, String> get quadrillions => <String, String>{
        "singular": "eine Billiarde",
        "binary": "zwei Billiarden",
        "plural": "Billiarden",
      };

  @override
  Map<String, String> get quintillions => <String, String>{
        "singular": "eine Trillion",
        "binary": "zwei Trillionen",
        "plural": "Trillionen",
      };

  @override
  String getOne(int number, {required HumanizeContext context, int? remainder}) {
    // "eins" needs to be "ein" when:
    // - is not odd (ej: 21 → einundzwanzig).
    if (number == 1) {
      if (context.nextGroup > 0) {
        return "ein";
      }
      if (remainder != null && remainder > 0) {
        return "ein";
      }
    }
    return super.getOne(number, remainder: remainder, context: context);
  }
}
