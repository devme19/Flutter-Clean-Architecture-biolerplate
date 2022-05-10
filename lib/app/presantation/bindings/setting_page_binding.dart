import 'package:flutter_clean_architecture/app/domain/repository/app_repository.dart';
import 'package:flutter_clean_architecture/app/domain/use_cases/setting/language/get_language_use_case.dart';
import 'package:flutter_clean_architecture/app/domain/use_cases/setting/language/set_language_use_case.dart';
import 'package:flutter_clean_architecture/app/domain/use_cases/setting/theme/get_theme_mode_use_case.dart';
import 'package:flutter_clean_architecture/app/domain/use_cases/setting/theme/set_theme_mode_use_case.dart';
import 'package:get/get.dart';

import '../../data/data_sources/local/local_data_source.dart';
import '../../data/data_sources/remote/remote_data_source.dart';
import '../../data/repository/app_repository_impl.dart';
import '../controllers/setting_controller.dart';

class SettingPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SetThemeModeUseCase>(() => SetThemeModeUseCase(
        repository: Get.put<AppRepository>(
            AppRepositoryImpl(
              localDataSource: Get.put<AppLocalDataSource>(AppLocalDateSourceImpl()),
              remoteDataSource: Get.put<AppRemoteDataSource>(AppRemoteDataSourceImpl()),
            )
        )
    ));
    Get.lazyPut<GetThemeModeUseCase>(() => GetThemeModeUseCase(
        repository: Get.put<AppRepository>(
            AppRepositoryImpl(
              localDataSource: Get.put<AppLocalDataSource>(AppLocalDateSourceImpl()),
              remoteDataSource: Get.put<AppRemoteDataSource>(AppRemoteDataSourceImpl()),
            )
        )
    ));
    Get.lazyPut<SetLanguageUseCase>(() => SetLanguageUseCase(
        repository: Get.put<AppRepository>(
            AppRepositoryImpl(
              localDataSource: Get.put<AppLocalDataSource>(AppLocalDateSourceImpl()),
              remoteDataSource: Get.put<AppRemoteDataSource>(AppRemoteDataSourceImpl()),
            )
        )
    ));
    Get.lazyPut<GetLanguageUseCase>(() => GetLanguageUseCase(
        repository: Get.put<AppRepository>(
            AppRepositoryImpl(
              localDataSource: Get.put<AppLocalDataSource>(AppLocalDateSourceImpl()),
              remoteDataSource: Get.put<AppRemoteDataSource>(AppRemoteDataSourceImpl()),
            )
        )
    ));
    Get.lazyPut(() => SettingController());
  }

}