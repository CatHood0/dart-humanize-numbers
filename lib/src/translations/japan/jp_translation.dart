import 'package:humanize_numbers/src/translations/default_get_humanize_translations_impl.dart';
import 'package:humanize_numbers/src/translations/translations.dart';

class JapaneseTranslation extends HumanizeTranslation
    with DefaultGetNumbersHumanizeTranslation {
  @override
  bool get isRTL => false;

  @override
  String get lang => "ja";

  @override
  // we don't want to separate characters at this language
  String get connector => '';

  @override
  String and(
    int left,
    int right, {
    int columnIndex = -1,
    int totalColumns = -1,
  }) {
    return "";
  }

  @override
  Map<String, String> get ones => <String, String>{
        "_0": "零",
        "_1": "一",
        "_2": "二",
        "_3": "三",
        "_4": "四",
        "_5": "五",
        "_6": "六",
        "_7": "七",
        "_8": "八",
        "_9": "九"
      };

  @override
  Map<String, String> get teens => <String, String>{
        "_11": "十一",
        "_12": "十二",
        "_13": "十三",
        "_14": "十四",
        "_15": "十五",
        "_16": "十六",
        "_17": "十七",
        "_18": "十八",
        "_19": "十九"
      };

  @override
  Map<String, String> get tens => <String, String>{
        "_10": "十",
        "_20": "二十",
        "_30": "三十",
        "_40": "四十",
        "_50": "五十",
        "_60": "六十",
        "_70": "七十",
        "_80": "八十",
        "_90": "九十"
      };

  @override
  Map<String, String> get hundreds => <String, String>{
        "_100": "百",
        "_200": "二百",
        "_300": "三百",
        "_400": "四百",
        "_500": "五百",
        "_600": "六百",
        "_700": "七百",
        "_800": "八百",
        "_900": "九百"
      };

  @override
  Map<String, String> get thousands => <String, String>{
        "singular": "千",
        "binary": "二千",
        "plural": "千",
      };

  @override
  Map<String, String> get millions => <String, String>{
        "singular": "百万",
        "binary": "二百万",
        "plural": "百万",
      };

  @override
  Map<String, String> get billions => <String, String>{
        "singular": "十億",
        "binary": "二十億",
        "plural": "十億",
      };

  @override
  Map<String, String> get trillions => <String, String>{
        "singular": "一兆",
        "binary": "二兆",
        "plural": "兆",
      };

  @override
  Map<String, String> get quadrillions => <String, String>{
        "singular": "千兆",
        "binary": "二千兆",
        "plural": "千兆",
      };

  @override
  Map<String, String> get quintillions => <String, String>{
        "singular": "百京",
        "binary": "二百京",
        "plural": "百京",
      };
}
