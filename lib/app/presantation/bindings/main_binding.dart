import 'package:flutter_clean_architecture/app/presantation/controllers/setting_controller.dart';
import 'package:get/get.dart';

import '../../data/data_sources/local/local_data_source.dart';
import '../../data/data_sources/remote/remote_data_source.dart';
import '../../data/repository/app_repository_impl.dart';
import '../../domain/repository/app_repository.dart';
import '../../domain/use_cases/setting/theme/get_theme_mode_use_case.dart';
import '../../domain/use_cases/setting/theme/set_theme_mode_use_case.dart';

class MainBinding extends Bindings{
  @override
  void dependencies(){
    // Get.put<AppLocalDataSource>(AppLocalDateSourceImpl());
    // Get.put<AppRemoteDataSource>(AppRemoteDataSourceImpl());
    Get.put<AppRepository>(
        AppRepositoryImpl(
        localDataSource: Get.put<AppLocalDataSource>(AppLocalDateSourceImpl()),
        remoteDataSource: Get.put<AppRemoteDataSource>(AppRemoteDataSourceImpl()),
        )
    );

    // await Get.putAsync<AppLocalDataSource>(()async{
    //   return AppLocalDateSourceImpl();
    // });
    // await Get.putAsync<AppRemoteDataSource>(()async{
    //   return AppRemoteDataSourceImpl();
    // });
    // await Get.putAsync<AppRepository>(()async{
    //   return AppRepositoryImpl(
    //     localDataSource: Get.find(),
    //     remoteDataSource: Get.find(),
    //   );
    // });
  }

}