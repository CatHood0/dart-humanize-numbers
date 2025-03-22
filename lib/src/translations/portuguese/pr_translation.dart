import 'package:humanize_numbers/src/translations/default_get_humanize_translations_impl.dart';
import 'package:humanize_numbers/src/translations/translations.dart';

class PortugueseTranslation extends HumanizeTranslation
    with DefaultGetNumbersHumanizeTranslation {
  @override
  bool get isRTL => false;

  @override
  String get lang => "pt";

  @override
  String get connector => ' ';

  @override
  String and(
    int left,
    int right, {
    int columnIndex = -1,
    int totalColumns = -1,
  }) {
    if (columnIndex != -1 &&
        totalColumns != -1 &&
        columnIndex < totalColumns - 1) {
      return (right > 0 && right < 100) ? " e " : " ";
    }

    // 2. Conector dentro de las centenas (ej: "trezentos e oitenta")
    if (left >= 100 && right > 0) {
      return " e ";
    }

    // 3. Conector entre decenas (≥20) y unidades (ej: "oitenta e seis")
    if (left >= 20 && right > 0 && left < 100) {
      return " e ";
    }

    return " ";
  }

  @override
  Map<String, String> get ones => <String, String>{
        "_0": "zero",
        "_1": "um",
        "_2": "dois",
        "_3": "três",
        "_4": "quatro",
        "_5": "cinco",
        "_6": "seis",
        "_7": "sete",
        "_8": "oito",
        "_9": "nove",
      };

  @override
  Map<String, String> get teens => <String, String>{
        "_11": "onze",
        "_12": "doze",
        "_13": "treze",
        "_14": "catorze",
        "_15": "quinze",
        "_16": "dezesseis",
        "_17": "dezessete",
        "_18": "dezoito",
        "_19": "dezenove",
      };

  @override
  Map<String, String> get tens => <String, String>{
        "_10": "dez",
        "_20": "vinte",
        "_30": "trinta",
        "_40": "quarenta",
        "_50": "cinquenta",
        "_60": "sessenta",
        "_70": "setenta",
        "_80": "oitenta",
        "_90": "noventa",
      };

  @override
  Map<String, String> get hundreds => <String, String>{
        "_100": "cem",
        "_200": "duzentos",
        "_300": "trezentos",
        "_400": "quatrocentos",
        "_500": "quinhentos",
        "_600": "seiscentos",
        "_700": "setecentos",
        "_800": "oitocentos",
        "_900": "novecentos",
      };

  @override
  Map<String, String> get thousands => <String, String>{
        "singular": "mil",
        "binary": "dois mil",
        "plural": "mil",
      };

  @override
  Map<String, String> get millions => <String, String>{
        "singular": "um milhão",
        "binary": "dois milhões",
        "plural": "milhões",
      };

  @override
  Map<String, String> get billions => <String, String>{
        "singular": "um bilhão",
        "binary": "dois bilhões",
        "plural": "bilhões",
      };

  @override
  Map<String, String> get trillions => <String, String>{
        "singular": "um trilhão",
        "binary": "dois trilhões",
        "plural": "trilhões",
      };

  @override
  Map<String, String> get quadrillions => <String, String>{
        "singular": "um quatrilhão",
        "binary": "dois quatrilhões",
        "plural": "quatrilhões",
      };

  @override
  Map<String, String> get quintillions => <String, String>{
        "singular": "um quintilhão",
        "binary": "dois quintilhões",
        "plural": "quintilhões",
      };
}
