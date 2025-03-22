import 'package:humanize_numbers/src/translations/default_get_humanize_translations_impl.dart';
import 'package:humanize_numbers/src/translations/translations.dart';

class ArabicTranslation extends HumanizeTranslation
    with DefaultGetNumbersHumanizeTranslation {
  @override
  bool get isRTL => true;

  @override
  String get lang => 'ar';

  @override
  String get connector => ' ';

  @override
  String and(
    int left,
    int right, {
    int columnIndex = -1,
    int totalColumns = -1,
  }) {
    if (right > 0) {
      return " و";
    }
    return '';
  }

  @override
  Map<String, String> get ones => <String, String>{
        "_0": "صفر",
        "_1": "واحد",
        "_2": "اثنان",
        "_3": "ثلاثة",
        "_4": "أربعة",
        "_5": "خمسة",
        "_6": "ستة",
        "_7": "سبعة",
        "_8": "ثمانية",
        "_9": "تسعة"
      };

  @override
  Map<String, String> get teens => <String, String>{
        "_11": "أحد عشر",
        "_12": "اثني عشر",
        "_13": "ثلاثة عشر",
        "_14": "أربعة عشر",
        "_15": "خمسة عشر",
        "_16": "ستة عشر",
        "_17": "سبعة عشر",
        "_18": "ثمانية عشر",
        "_19": "تسعة عشر"
      };

  @override
  Map<String, String> get tens => <String, String>{
        "_10": "عشرة",
        "_20": "عشرون",
        "_30": "ثلاثون",
        "_40": "أربعون",
        "_50": "خمسون",
        "_60": "ستون",
        "_70": "سبعون",
        "_80": "ثمانون",
        "_90": "تسعون"
      };

  @override
  Map<String, String> get hundreds => <String, String>{
        "_100": "مائة",
        "_200": "مئتان",
        "_300": "ثلاثمائة",
        "_400": "أربعمائة",
        "_500": "خمسمائة",
        "_600": "ستمائة",
        "_700": "سبعمائة",
        "_800": "ثمانمائة",
        "_900": "تسعمائة"
      };

  @override
  Map<String, String> get thousands => <String, String>{
        "singular": "ألف",
        "binary": "ألفان",
        "plural": "آلاف",
      };

  @override
  Map<String, String> get millions => <String, String>{
        "singular": "مليون",
        "binary": "مليونان",
        "plural": "ملايين",
      };

  @override
  Map<String, String> get billions => <String, String>{
        "singular": "مليار",
        "binary": "ملياران",
        "plural": "مليارات",
      };

  @override
  Map<String, String> get trillions => <String, String>{
        "singular": "ترليون",
        "binary": "ترليونان",
        "plural": "ترليونات",
      };

  @override
  Map<String, String> get quadrillions => <String, String>{
        "singular": "كوادريليون",
        "binary": "كوادريليونان",
        "plural": "كوادريليونات",
      };

  @override
  Map<String, String> get quintillions => <String, String>{
        "singular": "كوينتيليون",
        "binary": "كوينتيليونان",
        "plural": "كوينتيليونات",
      };
}
