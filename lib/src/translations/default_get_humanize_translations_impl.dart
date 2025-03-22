import 'package:humanize_numbers/src/humanize_context.dart';
import 'package:humanize_numbers/src/translations/translations.dart';

/// This creates a general implementation for get some numbers
///
/// It is useful, because in most of the languages, we only require
/// this default implementation
mixin DefaultGetNumbersHumanizeTranslation implements HumanizeTranslation {
  @override
  String getOne(int number,
      {required HumanizeContext context, int? remainder}) {
    return ones["_$number"] ?? "";
  }

  @override
  String getTeen(
    int number, {
    required HumanizeContext context,
    int? remainder,
  }) {
    return teens["_$number"] ?? "";
  }

  @override
  String getTen(int number,
      {required HumanizeContext context, int? remainder}) {
    return tens["_$number"] ?? "";
  }

  @override
  String getHundred(
    int number, {
    required HumanizeContext context,
    int? remainder,
  }) {
    return hundreds["_$number"] ?? "";
  }

  @override
  String getThousand(String type,
      {required HumanizeContext context, int? remainder}) {
    return thousands[type] ?? "";
  }

  @override
  String getMilion(String type,
      {required HumanizeContext context, int? remainder}) {
    return millions[type] ?? "";
  }

  @override
  String getBilion(String type,
      {required HumanizeContext context, int? remainder}) {
    return billions[type] ?? "";
  }

  @override
  String getTrilion(String type,
      {required HumanizeContext context, int? remainder}) {
    return trillions[type] ?? "";
  }

  @override
  String getQuadrillion(String type,
      {required HumanizeContext context, int? remainder}) {
    return quadrillions[type] ?? "";
  }

  @override
  String getQuintillion(String type,
      {required HumanizeContext context, int? remainder}) {
    return quintillions[type] ?? "";
  }
}
