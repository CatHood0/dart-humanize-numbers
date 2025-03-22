# 🌍 Translation

## 🌐 Supported Translations 

Currently, translations are available for these 7 locales:

* `ar`, `de`, `en`
* `es`, `ja`  
* `pt`, `ko`

## 📌 Contributing to translations

The translation files are located in the [translations](../lib/src/translations/) folder. Feel free to contribute your own translations.

<details>
<summary>Add new translation</summary>

1. Create a new file in [translation](../lib/src/translation/) folder, with the following name: `${lan_name}_translation.dart` (e.g
   example: `italic_translation.dart`). See [locale codes](https://saimana.com/list-of-country-locale-code/).

2. Copy the [Translation template](../lib/src/translations/english/en_translation.dart) file and paste it into your new file, replace the values with
   your translations

3. Update the [Supported Locales](#supported-locales) section on this page to update the supported translations for both the
   number and the list
</details>
<details>
<summary>Update a translation</summary>
1. Search the translation that you want to update (e.g: [arabic translation](../lib/src/translation/arabic/ar_translation.dart)).

2. Make the modification that you want. 

3. Run `dart ./scripts/translations_check.dart` check to ensure that everything is right.  
</details>

<br>

> 🔧 If you added or removed translations, make sure add it in [Translations](../lib/src/translations/translations.dart) class and update the `_expectedTranslationKeysLength`
> variable in [scripts/translations_check.dart](../scripts/translations_check.dart) <br>

Then open a pull request so everyone can benefit from your translations!
