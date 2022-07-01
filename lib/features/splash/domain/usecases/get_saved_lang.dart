// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:quotes/core/error/failures.dart';
import 'package:quotes/core/usecases/usecase.dart';
import 'package:quotes/features/splash/domain/repositories/lang_repository.dart';

class GetSavedLangUsecase implements UseCase<String, NoParams> {
  final LangRepository langRepository;
  GetSavedLangUsecase({
    required this.langRepository,
  });
  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await langRepository.getSavedLang();
  }
}
