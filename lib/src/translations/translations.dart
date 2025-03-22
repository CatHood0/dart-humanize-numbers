@internal
library;

import 'package:humanize_numbers/src/translations/arabic/ar_translation.dart';
import 'package:humanize_numbers/src/translations/german/german_translation.dart';
import 'package:humanize_numbers/src/translations/english/en_translation.dart';
import 'package:humanize_numbers/src/translations/humanize_translation.dart';
import 'package:humanize_numbers/src/translations/japan/jp_translation.dart';
import 'package:humanize_numbers/src/translations/korean/kr_translation.dart';
import 'package:humanize_numbers/src/translations/portuguese/pr_translation.dart';
import 'package:humanize_numbers/src/translations/spanish/es_translation.dart';
import 'package:meta/meta.dart';

export 'humanize_translation.dart';
export 'arabic/ar_translation.dart';
export 'english/en_translation.dart';

final class Translations {
  static final Map<String, HumanizeTranslation> supportedTranslations =
      Map<String, HumanizeTranslation>.unmodifiable(
    <String, HumanizeTranslation>{
      'en': EnglishTranslation(),
      'es': SpanishTranslation(),
      'pt': PortugueseTranslation(),
      'de': GermanTranslation(),
      'ar': ArabicTranslation(),
      'ko': KoreanTranslation(),
      'ja': JapaneseTranslation(),
    },
  );

  static HumanizeTranslation getTranslation(String lan) {
    return supportedTranslations[lan] ?? EnglishTranslation();
  }
}
