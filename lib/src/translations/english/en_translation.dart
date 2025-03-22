import 'package:humanize_numbers/src/translations/default_get_humanize_translations_impl.dart';
import 'package:humanize_numbers/src/translations/translations.dart';

class EnglishTranslation extends HumanizeTranslation
    with DefaultGetNumbersHumanizeTranslation {
  @override
  bool get isRTL => false;

  @override
  String get connector => ' ';

  @override
  String get lang => "en";

  @override
  String and(
    int left,
    int right, {
    int columnIndex = -1,
    int totalColumns = -1,
  }) {
    // in american english, we need to
    // ignore "and" in int numbers.
    return connector;
  }

  @override
  Map<String, String> get ones => <String, String>{
        "_0": "zero",
        "_1": "one",
        "_2": "two",
        "_3": "three",
        "_4": "four",
        "_5": "five",
        "_6": "six",
        "_7": "seven",
        "_8": "eight",
        "_9": "nine"
      };

  @override
  Map<String, String> get teens => <String, String>{
        "_11": "eleven",
        "_12": "twelve",
        "_13": "thirteen",
        "_14": "fourteen",
        "_15": "fifteen",
        "_16": "sixteen",
        "_17": "seventeen",
        "_18": "eighteen",
        "_19": "nineteen"
      };

  @override
  Map<String, String> get tens => <String, String>{
        "_10": "ten",
        "_20": "twenty",
        "_30": "thirty",
        "_40": "forty",
        "_50": "fifty",
        "_60": "sixty",
        "_70": "seventy",
        "_80": "eighty",
        "_90": "ninety"
      };

  @override
  Map<String, String> get hundreds => <String, String>{
        "_100": "one hundred",
        "_200": "two hundred",
        "_300": "three hundred",
        "_400": "four hundred",
        "_500": "five hundred",
        "_600": "six hundred",
        "_700": "seven hundred",
        "_800": "eight hundred",
        "_900": "nine hundred"
      };

  @override
  Map<String, String> get thousands => <String, String>{
        "singular": "one thousand",
        "binary": "two thousand",
        "plural": "thousands",
      };

  @override
  Map<String, String> get millions => <String, String>{
        "singular": "one million",
        "binary": "two million",
        "plural": "millions",
      };

  @override
  Map<String, String> get billions => <String, String>{
        "singular": "one billion",
        "binary": "two billion",
        "plural": "billions",
      };

  @override
  Map<String, String> get trillions => <String, String>{
        "singular": "one trillion",
        "binary": "two trillion",
        "plural": "trillions",
      };

  @override
  Map<String, String> get quadrillions => <String, String>{
        "singular": "one quadrillion",
        "binary": "two quadrillion",
        "plural": "quadrillions",
      };

  @override
  Map<String, String> get quintillions => <String, String>{
        "singular": "one quintillion",
        "binary": "two quintillion",
        "plural": "quintillions",
      };
}
