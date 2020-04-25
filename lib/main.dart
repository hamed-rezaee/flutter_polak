import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_polak/application.dart';
import 'package:flutter_polak/pages/home_page.dart';
import 'package:flutter_polak/locale/app_translations_delegate.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  AppTranslationsDelegate _newLocaleDelegate;

  @override
  void initState() {
    super.initState();

    _newLocaleDelegate = AppTranslationsDelegate(locale: null);

    application.onLocaleChanged = onLocaleChange;
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        localizationsDelegates: [
          _newLocaleDelegate,
          const AppTranslationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: application.supportedLocales(),
        title: 'Polak',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          fontFamily: 'yekan',
        ),
        home: Directionality(
          textDirection: _newLocaleDelegate?.locale?.languageCode == 'fa'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: HomePage(),
        ),
      );

  void onLocaleChange(Locale locale) => setState(
        () => _newLocaleDelegate = AppTranslationsDelegate(locale: locale),
      );
}
