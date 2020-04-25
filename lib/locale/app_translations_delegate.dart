import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_polak/application.dart';
import 'package:flutter_polak/locale/app_translations.dart';

class AppTranslationsDelegate extends LocalizationsDelegate<AppTranslations> {
  final Locale locale;

  const AppTranslationsDelegate({this.locale});

  @override
  bool isSupported(Locale locale) =>
      application.supportedLanguagesCodes.contains(locale.languageCode);

  @override
  Future<AppTranslations> load(Locale locale) =>
      AppTranslations.load(this.locale ?? locale);

  @override
  bool shouldReload(LocalizationsDelegate<AppTranslations> old) => true;
}
