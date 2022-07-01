import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes/core/usecases/usecase.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/splash/domain/usecases/change_lang_usecase.dart';
import 'package:quotes/features/splash/domain/usecases/get_saved_lang.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  final GetSavedLangUsecase getSavedLangUsecase;
  final ChangeLangUsecase changeLangUsecase;
  LocalCubit(
      {required this.getSavedLangUsecase, required this.changeLangUsecase})
      : super(ChangeLocalState(Locale(AppStrings.englishCode)));

  String currentLangCode = AppStrings.englishCode;
  Future<void> getSavedLang() async {
    final response = await getSavedLangUsecase(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLangCode = value;
      emit(ChangeLocalState(Locale(currentLangCode)));
    });
  }

  Future<void> _changeLang(String langCode) async {
    final response = await changeLangUsecase(langCode);
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLangCode = langCode;
      emit(ChangeLocalState(Locale(currentLangCode)));
    });
  }

  void toEnglish() => _changeLang(AppStrings.englishCode);
  void toArabic() => _changeLang(AppStrings.arabicCode);
}
