import 'package:quotes/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LangLocalDataSource {
  Future<bool> changeLang({required String langCode});
  Future<String> getSavedLang();
}

class LangLocalDataSourceImp implements LangLocalDataSource {
  final SharedPreferences sharedPreferences;
  LangLocalDataSourceImp({
    required this.sharedPreferences,
  });
  @override
  Future<bool> changeLang({required String langCode}) async {
    return await sharedPreferences.setString(AppStrings.locale, langCode);
  }

  @override
  Future<String> getSavedLang() async {
    if (await sharedPreferences.containsKey(AppStrings.locale)) {
      return await sharedPreferences.getString(AppStrings.locale)!;
    }
    return AppStrings.englishCode;
  }
}
