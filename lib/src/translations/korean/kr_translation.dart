import 'package:humanize_numbers/src/translations/default_get_humanize_translations_impl.dart';
import 'package:humanize_numbers/src/translations/translations.dart';

class KoreanTranslation extends HumanizeTranslation
    with DefaultGetNumbersHumanizeTranslation {
  @override
  bool get isRTL => false;

  @override
  String get lang => "ko";

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
        "_0": "영",
        "_1": "일",
        "_2": "이",
        "_3": "삼",
        "_4": "사",
        "_5": "오",
        "_6": "육",
        "_7": "칠",
        "_8": "팔",
        "_9": "구"
      };

  @override
  Map<String, String> get teens => <String, String>{
        "_11": "십일",
        "_12": "십이",
        "_13": "십삼",
        "_14": "십사",
        "_15": "십오",
        "_16": "십육",
        "_17": "십칠",
        "_18": "십팔",
        "_19": "십구"
      };

  @override
  Map<String, String> get tens => <String, String>{
        "_10": "십",
        "_20": "이십",
        "_30": "삼십",
        "_40": "사십",
        "_50": "오십",
        "_60": "육십",
        "_70": "칠십",
        "_80": "팔십",
        "_90": "구십"
      };

  @override
  Map<String, String> get hundreds => <String, String>{
        "_100": "백",
        "_200": "이백",
        "_300": "삼백",
        "_400": "사백",
        "_500": "오백",
        "_600": "육백",
        "_700": "칠백",
        "_800": "팔백",
        "_900": "구백"
      };

  @override
  Map<String, String> get thousands => <String, String>{
        "singular": "천",
        "binary": "이천",
        "plural": "천",
      };

  @override
  Map<String, String> get millions => <String, String>{
        "singular": "백만",
        "binary": "이백만",
        "plural": "백만",
      };

  @override
  Map<String, String> get billions => <String, String>{
        "singular": "십억",
        "binary": "이십억",
        "plural": "십억",
      };

  @override
  Map<String, String> get trillions => <String, String>{
        "singular": "조",
        "binary": "이조",
        "plural": "조",
      };

  @override
  Map<String, String> get quadrillions => <String, String>{
        "singular": "천조",
        "binary": "이천조",
        "plural": "천조",
      };

  @override
  Map<String, String> get quintillions => <String, String>{
        "singular": "백경",
        "binary": "이백경",
        "plural": "백경",
      };
}
