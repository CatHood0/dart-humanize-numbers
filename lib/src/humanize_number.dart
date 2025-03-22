import 'package:humanize_numbers/src/constants.dart';
import 'package:humanize_numbers/src/exceptions/out_of_supported_range_exception.dart';
import 'package:humanize_numbers/src/humanize_context.dart';
import 'package:humanize_numbers/src/humanize_number_settings.dart';
import 'package:humanize_numbers/src/translations/invalid_translation.dart';
import 'package:humanize_numbers/src/translations/translations.dart';
import 'package:humanize_numbers/src/utils/object_value.dart';
import 'package:humanize_numbers/src/utils/range_num.dart';
import 'package:humanize_numbers/src/utils/serialize_num_ext.dart';
import 'package:meta/meta.dart';

/// [HumanizeNumber] convert numbers to human-readable text representations.
@immutable
final class HumanizeNumber {
  HumanizeNumber()
      : _digit = ObjectValue<int>(value: 0),
        _context = HumanizeContext(
          nextGroup: -1,
          currentColumnIndex: -1,
          totalColumns: -1,
        ),
        _lastResult = ObjectValue<String>(value: ''),
        translation = ObjectValue<HumanizeTranslation>(
          value: InvalidTranslation(),
        );

  final HumanizeNumberSettings _settings = HumanizeNumberSettings();

  final ObjectValue<int> _digit;
  final ObjectValue<String> _lastResult;
  final ObjectValue<HumanizeTranslation> translation;
  final HumanizeContext _context;

  /// Gets currently active translation language code (ISO 639-1).
  ///
  /// Returns empty string if no valid translation is loaded.
  String get currentTranslationLanguage =>
      translation.value is InvalidTranslation ? '' : translation.value.lang;

  /// Gets last successfully generated textual representation.
  ///
  /// Empty string if no conversion has been performed yet.
  String get lastResult => _lastResult.value;

  /// Gets last processed numeric value.
  ///
  /// Returns 0 if no conversion has been performed yet.
  int get lastNumberParsed => _digit.value.toInt();

  /// Converts a numeric value to its localized textual representation.
  ///
  /// [number] : Integer value to convert (0 ≤ number < 10^18)
  /// [lang]   : ISO 639-1 language code (e.g., 'en', 'es', 'ar')
  ///
  /// Returns complete textual representation of the number.
  ///
  /// Throws [OutOfRangeSupportedException] if number exceeds 10^18.
  ///
  /// Caches results for repeated calls with same parameters.
  String parse(int number, String lang) {
    // we can avoid parse numbers when them are already processed and cached
    if (number == _digit.value && currentTranslationLanguage == lang) return lastResult;
    _context.regenerateContext();
    translation.value = Translations.getTranslation(lang);
    _digit.value = number;

    if (_digit.value.toString().length >= Constants.rangeSupported) {
      throw OutOfRangeSupportedException(
        value: _digit.value,
        supported: Constants.rangeSupported,
      );
    }

    final List<List<String>> serialized = _digit.value.serializeNumber;
    _context.totalColumns = serialized.length;

    // generates connectors or spaces between every group
    final List<String> concats = List.filled(serialized.length, "");
    for (int i = 0; i < serialized.length; i++) {
      int currentValue = int.parse(serialized[i].reversed.join());
      int nextValue =
          (i < serialized.length - 1) ? int.parse(serialized[i + 1].reversed.join()) : -1;
      if (currentValue > 0) {
        String connector = translation.value.and(
          currentValue,
          nextValue,
          columnIndex: i,
          totalColumns: _context.totalColumns,
        );
        concats[i] = connector;
      }
    }

    final StringBuffer str = StringBuffer(_settings.prefix);

    // if it has 3 numbers of length or less, we read it directly.
    if (_digit.toString().length <= 3) {
      str.write(_read(_digit.value));
    } else {
      for (int i = 0; i < serialized.length; i++) {
        int joinedNumber = int.parse(serialized[i].reversed.join());
        if (joinedNumber == 0) continue;
        _context.currentColumnIndex = i;

        // If it is the last group (less than 1000), we read it without suffix.
        if (i == serialized.length - 1) {
          str.write(_read(joinedNumber));
        } else {
          int adjustedColumn = (serialized.length - 2) - i;
          str.write(
            _addSuffixPrefix(serialized[i], serialized, adjustedColumn)! + concats[i],
          );
        }
      }
    }

    if (_settings.currency.isNotEmpty) {
      str.write(" ${_settings.currency}");
    }

    str.write(_settings.suffix);

    if (str.isNotEmpty) {
      final String result = str.toString();
      str
        ..clear()
        ..write('${result[0].toUpperCase()}${result.substring(1)}'.trim());
    }

    _lastResult.value = str.toString();

    return _lastResult.value;
  }

  // ========== Internal Processing Methods ========== //
  //
  // The following methods handle the core conversion logic and
  // are not intended for external use.

  /// Adds suffix/prefix to number groups (thousands, millions, etc)
  String? _addSuffixPrefix(
    List<String> arr,
    List<List<String>> serialized,
    int columnIndex,
  ) {
    int joinedNumber = int.parse(arr.reversed.join());
    String columnName = Constants.columns[columnIndex];

    _context.nextGroup = (_context.currentColumnIndex > 0)
        ? int.parse(serialized[_context.currentColumnIndex - 1].reversed.join())
        : 0;

    if (arr.length == 1) {
      int digit = int.parse(arr[0]);
      if (digit == 1) {
        return _getUnit(columnName, "singular");
      } else if (digit == 2) {
        return _getUnit(columnName, "binary");
      } else if (digit > 2 && digit <= 9) {
        return "${_readOnes(digit)}${translation.value.connector}${_getUnit(
          columnName,
          "plural",
        )}"
            .trimRight();
      }
    } else if (joinedNumber == 1) {
      return _getUnit(columnName, "singular");
    } else if (joinedNumber == 2) {
      return _getUnit(columnName, "binary");
    } else if (joinedNumber > 2) {
      return "${_read(joinedNumber)}${translation.value.connector}${_getUnit(
        columnName,
        "plural",
      )}"
          .trimRight();
    }
    return '';
  }

  /// Gets unit denomination for number groups
  String _getUnit(String columnName, String type) {
    switch (columnName) {
      case "thousands":
        return translation.value.getThousand(type, context: _context);
      case "millions":
        return translation.value.getMilion(type, context: _context);
      case "billions":
        return translation.value.getBilion(type, context: _context);
      case "trillions":
        return translation.value.getTrilion(type, context: _context);
      case "quadrillions":
        return translation.value.getQuadrillion(type, context: _context);
      case "quintillions":
        return translation.value.getQuintillion(type, context: _context);
      default:
        return "";
    }
  }

  /// Dispatches number reading based on magnitude
  String _read(int d) {
    if (d.checkRange(max: 10)) return _readOnes(d);
    if (d.checkRange(max: 100)) return _readTens(d);
    if (d.checkRange(max: 1000)) return _readHundreds(d);
    return "";
  }

  /// Processes single-digit numbers (0-9)
  String _readOnes(int d) {
    return translation.value.getOne(d, context: _context);
  }

  /// Processes tens (10-99) with grammatical rules
  String _readTens(int d) {
    // no needs connector
    if (d % 10 == 0) {
      return translation.value.getTen(d, context: _context); // 10, 20, 30, etc.
    } else if (d.checkRange(min: 10, max: 20)) {
      return translation.value.getTeen(d, context: _context); // 11, 12, ..., 19
    } else if (d.checkRange(min: 19, max: 100)) {
      // needs connector
      final int ones = d % 10;
      final int tens = (d ~/ 10) * 10;
      final String onesPlace = translation.value.getOne(
        ones,
        context: _context,
        remainder: ones,
      );
      final String tensPlace = translation.value.getTen(
        tens,
        context: _context,
        remainder: ones,
      );
      final String connector = _context.ignoreNextConnector
          ? ''
          : translation.value.and(
              translation.value.isRTL ? ones : tens,
              translation.value.isRTL ? tens : ones,
              columnIndex: _context.currentColumnIndex,
              totalColumns: _context.totalColumns,
            );

      _context.ignoreNextConnector = false;
      return translation.value.isRTL
          ? "$onesPlace$connector$tensPlace"
          : "$tensPlace$connector$onesPlace";
    }
    return '';
  }

  /// Processes hundreds (100-999) with connector logic
  String _readHundreds(int d) {
    final int remainder = d % 100;
    final int hundreN = (d ~/ 100) * 100;
    final String hundredsPlace = translation.value.getHundred(
      hundreN,
      remainder: remainder,
      context: _context,
    );
    if (remainder == 0) return hundredsPlace; // 100, 200, etc.
    final String connector = _context.ignoreNextConnector
        ? ''
        : translation.value.and(
            hundreN,
            remainder,
            columnIndex: _context.currentColumnIndex,
            totalColumns: _context.totalColumns,
          );
    _context.ignoreNextConnector = false;

    // allows to some languages to add at the correct place the "and" operator
    //
    // like for **portuguese**, that needs "e" after the hundred numbers
    return "$hundredsPlace$connector${_read(remainder)}";
  }

  /// Configures output formatting options.
  ///
  /// [prefix]  : Text prepended to result (e.g., "Amount: ")
  /// [suffix]  : Text appended to result (e.g., "only")
  /// [currency]: Currency symbol (e.g., "$", "€", "£")
  void settings({
    String prefix = '',
    String suffix = '',
    String currency = '',
  }) {
    _settings.currency = currency;
    _settings.prefix = prefix;
    _settings.suffix = suffix;
  }
}
