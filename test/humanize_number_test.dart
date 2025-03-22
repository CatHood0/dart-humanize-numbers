import 'package:humanize_numbers/humanize_numbers.dart';
import 'package:test/test.dart';

void main() {
  final HumanizeNumber humanizer = HumanizeNumber();

  group('english', () {
    test('should convert simple number', () {
      final String humanNumber = humanizer.parse(50, 'en');
      expect(humanNumber, 'Fifty');
    });
    test('should convert complex number', () {
      final String humanNumber = humanizer.parse(2386, 'en');
      expect(humanNumber, 'Two thousand three hundred eighty-six');
    });
    test('should convert large number', () {
      final String humanNumber = humanizer.parse(1000000, 'en');
      expect(humanNumber, 'One million');
    });
  });

  group('spanish', () {
    test('should convert simple number', () {
      final String humanNumber = humanizer.parse(50, 'es');
      expect(humanNumber, 'Cincuenta');
    });

    test('should convert complex number', () {
      final String humanNumber = humanizer.parse(2386, 'es');
      expect(humanNumber, 'Dos mil trescientos ochenta y seis');
    });
    test('should convert large number', () {
      final String humanNumber = humanizer.parse(1000000, 'es');
      expect(humanNumber, 'Un millón');
    });
  });

  group('german', () {
    test('should convert simple number', () {
      final String humanNumber = humanizer.parse(50, 'de');
      expect(humanNumber, 'Fünfzig');
    });
    test('should convert complex number', () {
      final String humanNumber = humanizer.parse(2386, 'de');
      expect(humanNumber, 'Zweitausenddreihundertsechsundachtzig');
    });
    test('should convert large number', () {
      final String humanNumber = humanizer.parse(1000000, 'de');
      expect(humanNumber, 'Eine Million');
    });
  });

  group('arabic', () {
    test('should convert simple number', () {
      final String humanNumber = humanizer.parse(50, 'ar');
      expect(humanNumber, 'خمسون');
    });
    test('should convert complex number', () {
      final String humanNumber = humanizer.parse(2386, 'ar');
      expect(humanNumber, 'ألفان وثلاثمائة وستة وثمانون');
    });
    test('should convert large number', () {
      final String humanNumber = humanizer.parse(1000000, 'ar');
      expect(humanNumber, 'مليون');
    });
  });

  group('portuguese', () {
    test('should convert simple number', () {
      final String humanNumber = humanizer.parse(50, 'pt');
      expect(humanNumber, 'Cinquenta');
    });
    test('should convert complex number', () {
      final String humanNumber = humanizer.parse(2386, 'pt');
      expect(humanNumber, 'Dois mil trezentos e oitenta e seis');
    });
    test('should convert large number', () {
      final String humanNumber = humanizer.parse(1000000, 'pt');
      expect(humanNumber, 'Um milhão');
    });
  });

  group('Korean', () {
    test('should convert simple number', () {
      final String humanNumber = humanizer.parse(50, 'ko');
      expect(humanNumber, '오십');
    });
    test('should convert complex number', () {
      final String humanNumber = humanizer.parse(2386, 'ko');
      expect(humanNumber, '이천삼백팔십육');
    });
    test('should convert large number', () {
      final String humanNumber = humanizer.parse(1000000, 'ko');
      expect(humanNumber, '백만');
    });
  });

  group('Japan', () {
    test('should convert simple number', () {
      final String humanNumber = humanizer.parse(50, 'ja');
      expect(humanNumber, '五十');
    });
    test('should convert complex number', () {
      final String humanNumber = humanizer.parse(2386, 'ja');
      expect(humanNumber, '二千三百八十六');
    });
    test('should convert large number', () {
      final String humanNumber = humanizer.parse(1000000, 'ja');
      expect(humanNumber, '百万');
    });
  });
}
