import 'package:humanize_numbers/src/humanize_context.dart';
import 'package:humanize_numbers/src/translations/default_get_humanize_translations_impl.dart';
import 'package:humanize_numbers/src/translations/translations.dart';
import 'package:humanize_numbers/src/utils/range_num.dart';

class SpanishTranslation extends HumanizeTranslation
    with DefaultGetNumbersHumanizeTranslation {
  @override
  bool get isRTL => false;

  @override
  String get lang => "es";

  @override
  String get connector => ' ';

  @override
  String and(
    int left,
    int right, {
    int columnIndex = -1,
    int totalColumns = -1,
  }) {
    if (left >= 30 && right > 0 && left < 100) {
      return " y ";
    }
    return connector;
  }

  @override
  Map<String, String> get ones => <String, String>{
        "_0": "cero",
        "_1": "uno",
        "_2": "dos",
        "_3": "tres",
        "_4": "cuatro",
        "_5": "cinco",
        "_6": "seis",
        "_7": "siete",
        "_8": "ocho",
        "_9": "nueve"
      };

  @override
  Map<String, String> get teens => <String, String>{
        "_11": "once",
        "_12": "doce",
        "_13": "trece",
        "_14": "catorce",
        "_15": "quince",
        "_16": "dieciséis",
        "_17": "diecisiete",
        "_18": "dieciocho",
        "_19": "diecinueve"
      };

  @override
  Map<String, String> get tens => <String, String>{
        "_10": "diez",
        "_20": "veinte",
        "_30": "treinta",
        "_40": "cuarenta",
        "_50": "cincuenta",
        "_60": "sesenta",
        "_70": "setenta",
        "_80": "ochenta",
        "_90": "noventa"
      };

  @override
  Map<String, String> get hundreds => <String, String>{
        "_100": "cien",
        "_200": "doscientos",
        "_300": "trescientos",
        "_400": "cuatrocientos",
        "_500": "quinientos",
        "_600": "seiscientos",
        "_700": "setecientos",
        "_800": "ochocientos",
        "_900": "novecientos"
      };

  @override
  Map<String, String> get thousands => <String, String>{
        "singular": "mil",
        "binary": "dos mil",
        "plural": "miles",
      };

  @override
  Map<String, String> get millions => <String, String>{
        "singular": "un millón",
        "binary": "dos millones",
        "plural": "millones",
      };

  @override
  Map<String, String> get billions => <String, String>{
        "singular": "mil millones", // 10^9 (US billion)
        "binary": "dos mil millones",
        "plural": "mil millones"
      };

  @override
  Map<String, String> get trillions => <String, String>{
        "singular": "un billón", // 10^12 (US trillion)
        "binary": "dos billones",
        "plural": "billones"
      };

  @override
  Map<String, String> get quadrillions => <String, String>{
        "singular": "un cuatrillón", // 10^15 (US quadrillion)
        "binary": "dos cuatrillones",
        "plural": "cuatrillones"
      };

  @override
  Map<String, String> get quintillions => <String, String>{
        "singular": "un quintillón", // 10^18 (US quintillion)
        "binary": "dos quintillones",
        "plural": "quintillones"
      };

  @override
  String getTen(
    int number, {
    required HumanizeContext context,
    int? remainder,
  }) {
    // in some cases, spanish has a different way to manages
    // twenty numbers cases
    //
    // like:
    //
    // "Veintiuno" instead of "Veinte uno"
    // "Veintidos" instead of "Veinte dos"
    // "Veintitres" instead of "Veinte tres"
    final String ten =
        super.getTen(number, context: context, remainder: remainder);
    if (number.checkRange(min: 20, max: 29, strict: false) &&
        remainder != null &&
        remainder.checkRange(min: 0, max: 10)) {
      // ignore "and"
      context.ignoreNextConnector = true;
      final String replace = ten.replaceRange(ten.length - 1, ten.length, 'i');
      return replace;
    }
    return ten;
  }

  @override
  String getHundred(int number,
      {required HumanizeContext context, int? remainder}) {
    // this is a special case that appears with spanish
    // numbers
    //
    // like:
    //
    // ciento uno
    // ciento dos
    // ciento tres
    //
    // instead of (this is a bad translation)
    //
    // cien uno
    // cien dos
    // cien tres
    if (number == 100 && remainder != null && remainder > 0) {
      return "ciento";
    }
    return super.getHundred(number, context: context, remainder: remainder);
  }
}
