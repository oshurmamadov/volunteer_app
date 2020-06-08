
import 'package:volunteerapp/data/resources.dart';

var englishLanguage = 'English';
var pamiriLanguage = 'Pamiri';

extension Translate on String {
  String translate() {
    if (TranslationWrapper().currentLanguage == pamiriLanguage) {
      return retrieveValueByKey(this, pamiriTranslations);
    }
    return retrieveValueByKey(this, englishTranslations);
  }
}

String retrieveValueByKey(String key, Map map) {
  return map.containsKey(key) ? map[key] : key;
}

class TranslationWrapper {
  static final TranslationWrapper _instance = TranslationWrapper._internal();
  factory TranslationWrapper() => _instance;
  TranslationWrapper._internal();

  String currentLanguage = pamiriLanguage;
  void switchLanguage() {
    currentLanguage =
      currentLanguage == pamiriLanguage ? englishLanguage : pamiriLanguage;
  }
}