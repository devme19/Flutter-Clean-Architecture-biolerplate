import 'package:flutter_clean_architecture/app/core/either.dart';
import 'package:flutter_clean_architecture/app/core/failures.dart';
import 'package:flutter_clean_architecture/app/core/use_case.dart';
import 'package:flutter_clean_architecture/app/domain/repository/app_repository.dart';

class GetThemeModeUseCase implements UseCase<bool,NoParams>{
  final AppRepository? repository;

  GetThemeModeUseCase({this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return repository!.getThemeMode();
  }
}