import 'dart:ui';

typedef void LocaleChangeCallback(Locale locale);

Application application = Application();

class Application {
  final List<String> supportedLanguagesCodes = ['en', 'fa'];
  final List<String> supportedLanguages = ['English', 'Persian'];

  static final Application _application = Application._internal();

  factory Application() => _application;

  Application._internal();

  Iterable<Locale> supportedLocales() =>
      supportedLanguagesCodes.map<Locale>((language) => Locale(language));

  LocaleChangeCallback onLocaleChanged;
}
