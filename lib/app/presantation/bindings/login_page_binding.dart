import 'package:flutter_clean_architecture/app/data/data_sources/local/local_data_source.dart';
import 'package:flutter_clean_architecture/app/data/data_sources/remote/remote_data_source.dart';
import 'package:flutter_clean_architecture/app/data/repository/app_repository_impl.dart';
import 'package:flutter_clean_architecture/app/domain/repository/app_repository.dart';
import 'package:flutter_clean_architecture/app/domain/use_cases/user/login_use_case.dart';
import 'package:flutter_clean_architecture/app/domain/use_cases/user/verification_use_case.dart';
import 'package:flutter_clean_architecture/app/presantation/controllers/auth_controller.dart';
import 'package:get/get.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {

    // Get.lazyPut<LoginUseCase>(() => LoginUseCase(repository: Get.put<AppRepository>(AppRepositoryImpl(
    //     localDataSource: Get.put<AppLocalDataSource>(AppLocalDateSourceImpl()),
    //     remoteDataSource: Get.put<AppRemoteDataSource>(AppRemoteDataSourceImpl())
    // )
    // )));
    // Get.lazyPut<VerificationUseCase>(() => VerificationUseCase(repository: Get.put<AppRepository>(AppRepositoryImpl(
    //     localDataSource: Get.put<AppLocalDataSource>(AppLocalDateSourceImpl()),
    //     remoteDataSource: Get.put<AppRemoteDataSource>(AppRemoteDataSourceImpl())
    // )
    // )));
    Get.lazyPut<LoginUseCase>(()=>LoginUseCase(repository: Get.find()));
    Get.lazyPut<VerificationUseCase>(()=>VerificationUseCase(repository: Get.find()));
    Get.lazyPut(()=>AuthController());
  }
}
