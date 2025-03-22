import 'package:humanize_numbers/src/humanize_context.dart';
import 'package:humanize_numbers/src/translations/humanize_translation.dart';

class InvalidTranslation extends HumanizeTranslation {
  @override
  String and(int left, int right,
      {int columnIndex = -1, int totalColumns = -1}) {
    throw UnimplementedError();
  }

  @override
  String getBilion(String type,
      {required HumanizeContext context, int? remainder}) {
    throw UnimplementedError();
  }

  @override
  String getHundred(int number,
      {required HumanizeContext context, int? remainder}) {
    throw UnimplementedError();
  }

  @override
  String getMilion(String type,
      {required HumanizeContext context, int? remainder}) {
    throw UnimplementedError();
  }

  @override
  String getOne(int number,
      {required HumanizeContext context, int? remainder}) {
    throw UnimplementedError();
  }

  @override
  String getQuadrillion(String type,
      {required HumanizeContext context, int? remainder}) {
    throw UnimplementedError();
  }

  @override
  String getQuintillion(String type,
      {required HumanizeContext context, int? remainder}) {
    throw UnimplementedError();
  }

  @override
  String getTeen(int number,
      {required HumanizeContext context, int? remainder}) {
    throw UnimplementedError();
  }

  @override
  String getTen(int number,
      {required HumanizeContext context, int? remainder}) {
    throw UnimplementedError();
  }

  @override
  String getThousand(String type,
      {required HumanizeContext context, int? remainder}) {
    throw UnimplementedError();
  }

  @override
  String getTrilion(String type,
      {required HumanizeContext context, int? remainder}) {
    throw UnimplementedError();
  }

  @override
  Map<String, String> get billions => throw UnimplementedError();

  @override
  Map<String, String> get hundreds => throw UnimplementedError();

  @override
  bool get isRTL => throw UnimplementedError();

  @override
  String get lang => throw UnimplementedError();

  @override
  Map<String, String> get millions => throw UnimplementedError();

  @override
  Map<String, String> get ones => throw UnimplementedError();

  @override
  Map<String, String> get quadrillions => throw UnimplementedError();

  @override
  Map<String, String> get quintillions => throw UnimplementedError();

  @override
  Map<String, String> get teens => throw UnimplementedError();

  @override
  Map<String, String> get tens => throw UnimplementedError();

  @override
  Map<String, String> get thousands => throw UnimplementedError();

  @override
  Map<String, String> get trillions => throw UnimplementedError();

  @override
  String get connector => throw UnimplementedError();
}
