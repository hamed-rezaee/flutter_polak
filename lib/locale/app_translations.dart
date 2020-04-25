import 'dart:ui';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class AppTranslations {
  Locale locale;

  static Map<String, dynamic> _enLocaleValues;
  static Map<String, dynamic> _faLocaleValues;

  get currentLanguage => locale.languageCode;

  AppTranslations(Locale locale) {
    this.locale = locale;
  }

  static Future<void> _getLocaleResources() async {
    final String enLocalizationPath = 'assets/locale/localization_en.json';
    final String faLocalizationPath = 'assets/locale/localization_fa.json';

    _enLocaleValues = _enLocaleValues ??
        json.decode(await rootBundle.loadString(enLocalizationPath));

    _faLocaleValues = _faLocaleValues ??
        json.decode(await rootBundle.loadString(faLocalizationPath));
  }

  static AppTranslations of(BuildContext context) =>
      Localizations.of<AppTranslations>(context, AppTranslations);

  static Future<AppTranslations> load(Locale locale) async {
    await _getLocaleResources();

    return AppTranslations(locale);
  }

  String text(String key) =>
      (locale.languageCode == 'en'
          ? _enLocaleValues[key]
          : _faLocaleValues[key]) ??
      '$key not found.';
}
