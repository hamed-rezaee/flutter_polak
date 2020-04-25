import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_polak/constants.dart';

class Helper {
  static Future<Locale> getDefaultLocale() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String languageCode =
        sharedPreferences.getString(LANGUAGE_CODE_KEY) ?? 'en';

    return Locale(languageCode);
  }

  static Future<void> setDefaultLocale(String languageCode) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString(LANGUAGE_CODE_KEY, languageCode);
  }
}
