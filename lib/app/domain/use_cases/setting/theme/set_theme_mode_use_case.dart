import 'package:flutter_clean_architecture/app/core/either.dart';
import 'package:flutter_clean_architecture/app/core/failures.dart';
import 'package:flutter_clean_architecture/app/core/use_case.dart';
import 'package:flutter_clean_architecture/app/domain/repository/app_repository.dart';

class SetThemeModeUseCase implements UseCase<bool,Params>{
  final AppRepository? repository;

  SetThemeModeUseCase({this.repository});

  @override
  Future<Either<Failure, bool>> call(Params params) {
    return repository!.setThemeMode(params.boolValue!);
  }

}