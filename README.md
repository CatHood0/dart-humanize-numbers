# Dart humanize number 

> [!NOTE]
>
> This is a package based on [number_to_string](https://pub.dev/packages/number_to_string). However, since it doesn't add translations or is regularly maintained, I opted to create my own version that works with a wide variety of languages (and is more extensible and readable). In other words, this is a version that improves on absolutely every aspect of [number_to_string](https://pub.dev/packages/number_to_string).

A Dart library to convert numbers into their word representation in multiple languages. Perfect for financial, educational, or localization-focused applications.

## Supported Languages
| Language          | Code  | Example Input | Output (Word Form)                        |
|-------------------|-------|---------------|--------------------------------------------|
| English (US)      | `en`  | 2386          | Two thousand three hundred eighty-six      |
| German            | `de`  | 2386          | Zweitausenddreihundertsechsundachtzig      |
| Japanese          | `ja`  | 2386          | 二千三百八十六                             |
| Korean            | `ko`  | 2386          | 이천삼백팔십육                             |
| Spanish           | `es`  | 2386          | Dos mil trescientos ochenta y seis         |
| Portuguese        | `pt`  | 2386          | Dois mil trezentos e oitenta e seis        |
| Arabic            | `ar`  | 2386          | ألفان وثلاثمائة وستة وثمانون               |

## Usage Example

```dart
import 'package:humanize_numbers/dart_humanize_numbers.dart';

void main() {
  final humanizer = HumanizeNumber();
  humanizer.settings(currency: 'USD');
  
  print(humanizer.parse(2386, 'en')); // Output: Two thousand three hundred eighty six USD
  print(humanizer.lastResult); // ----------------^
  print(humanizer.lastNumberParsed); // 2386
  print(humanizer.currentTranslationLanguage); // en
}
```

## Language-Specific Examples

### German (Deutsch)
```dart
// 2386 → "Zweitausenddreihundertsechsundachtzig"
humanizer.parse(2386, 'de');
```

### Arabic (العربية)
```dart
// 1000001 → "مليون وواحد"
humanizer.parse(1000001, 'ar');
```

### Spanish (Español)
```dart
// 1500 → "Mil quinientos"
humanizer.parse(1500, 'es');
```

## You can also customize 

### Settings

Configure prefixes, suffixes, or currency:

```dart
humanizer.settings(
  prefix: 'Total: ',
  suffix: ' (final amount)',
  currency: '€',
);
print(humanizer.parse(20, 'es'));   
// Output: "Total: Veintiseis € (final ammount)"
```

## Key Concepts

### 1. Number Grouping & Hierarchy

Numbers are decomposed into **3-digit groups** (from right to left) to handle large values systematically.  
This mirrors the natural language structure of numbers across most languages.

#### How It Works:
1. **Reverse & Split**:  
   `2,386` → reversed digits → `["6", "8", "3", "2"]` → grouped as `[["6", "8", "3"], ["2"]]`.
2. **Process Groups**:  
   Each group is mapped to its word equivalent (units, thousands, millions, etc.).
3. **Recombine**:  
   Apply language-specific connectors between groups.

#### Example (2,386):
| Group Value | Unit            | German Output          |
|-------------|-----------------|------------------------|
| 2           | Thousands       | `Zweitausend`          |
| 300         | Hundreds        | `dreihundert`          |
| 86          | Tens/Units      | `sechsundachtzig`      |

### 2. Connector Rules & Positioning

Connectors glue number parts together. Rules vary dramatically between languages:

#### Connector Types:
| Language   | Connector | Placement Rule                             | Example (86)       |
|------------|-----------|--------------------------------------------|--------------------|
| **German** | `und`     | Between units and tens: **units + und + tens** | `sechsundachtzig`  |
| **English**| `-`       | Between tens and units: **tens + - + units**  | `eighty-six`       |
| **Arabic** | `و`       | Between **all non-zero groups**              | `ستة وثمانون`     |
| **Spanish**| `y`       | Between tens and units only                  | `ochenta y seis`   |

### 3. Special Cases Handling

#### A. Zero & Empty Groups

- **Zero**: Explicitly handled (e.g., Arabic `صفر` vs. English omitting it in 1000).
- **Empty Groups**: Skipped (e.g., `1,000,000` → `eine Million`, not `eine Million null`).

#### B. Teen Numbers (11-19)

Treated as unique words in most languages:  

- English: `eleven`, `twelve` (not `ten-one`).
- German: `elf`, `zwölf`.

#### C. Gender & Pluralization (Arabic/Spanish)

- Arabic: Gender agreement for units (e.g., `مليون` vs. `مليونان`).
- Spanish: `ciento` (101) vs. `cien` (100).

## Contributing

We greatly appreciate your time and effort.

To keep the project consistent and maintainable, we have a few guidelines that we ask all contributors to follow. These guidelines help ensure that everyone can understand and work with the code easier.

See [Contributing](https://github.com/CatHood0/dart-humanize-numbers/blob/master/CONTRIBUTING.md) for more details.

