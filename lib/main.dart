import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/domain/use_cases/setting/language/get_language_use_case.dart';
import 'package:flutter_clean_architecture/app/domain/use_cases/setting/theme/get_theme_mode_use_case.dart';
import 'package:flutter_clean_architecture/app/presantation/bindings/main_binding.dart';
import 'package:flutter_clean_architecture/app/presantation/bindings/setting_page_binding.dart';
import 'package:flutter_clean_architecture/app/presantation/controllers/setting_controller.dart';
import 'package:flutter_clean_architecture/app/presantation/routes/app_routes.dart';
import 'package:flutter_clean_architecture/app/presantation/theme/themes.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_clean_architecture/app/data/data_sources/remote/client.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/use_case.dart';
import 'app/presantation/utils/messages.dart';

bool isEn = true;
Future<bool> getLanguage() async{
  GetLanguageUseCase getLanguageUseCase = Get.find();
  return (await getLanguageUseCase.call(NoParams())).right;
}
getThemeMode() async{
  bool isDarkMode = false;
  GetThemeModeUseCase getThemeModeUseCase = Get.find();
  isDarkMode = (await getThemeModeUseCase.call(NoParams())).right;
  Get.changeThemeMode(isDarkMode?ThemeMode.dark:ThemeMode.light);
}
void main() async{
  Client().init();
  await GetStorage.init();
  MainBinding().dependencies();
  isEn = await getLanguage();
  await getThemeMode();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: App.pages,
      title: 'Flutter Clean Architecture',
      theme: Themes.light,
      locale: isEn?const Locale('en', 'US'):const Locale('fa','IR'),
      darkTheme: Themes.dark,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.loginPage,
      builder: EasyLoading.init(),
      translations: Messages(),
      fallbackLocale: const Locale('en', 'US'),
      // initialBinding:SettingPageBinding()
      // initialBinding: MainBinding(),
    );
  }

}
