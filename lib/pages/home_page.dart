import 'package:flutter/material.dart';

import 'package:flutter_polak/application.dart';
import 'package:flutter_polak/locale/app_translations.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final List<String> languagesList = application.supportedLanguages;
  static final List<String> languageCodesList =
      application.supportedLanguagesCodes;

  final Map<dynamic, dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
  };

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(AppTranslations.of(context).text('app_name')),
        ),
        body: _buildLanguagesList(),
      );

  _buildLanguagesList() => ListView.builder(
        itemCount: languagesList.length,
        itemBuilder: (context, index) =>
            _buildLanguageItem(languagesList[index]),
      );

  _buildLanguageItem(String language) => InkWell(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              language,
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        ),
        onTap: () => application.onLocaleChanged(
          Locale(languagesMap[language]),
        ),
      );
}
