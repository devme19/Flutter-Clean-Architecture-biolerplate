import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/presantation/bindings/main_binding.dart';
import 'package:flutter_clean_architecture/app/presantation/bindings/setting_page_binding.dart';
import 'package:flutter_clean_architecture/app/presantation/controllers/setting_controller.dart';
import 'package:flutter_clean_architecture/app/presantation/routes/app_routes.dart';
import 'package:flutter_clean_architecture/app/presantation/theme/themes.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_clean_architecture/app/data/data_sources/remote/client.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/presantation/utils/messages.dart';
void main() async{
  Client().init();
  await GetStorage.init();
  SettingPageBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends GetView<SettingController> {
   MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        GetMaterialApp(
          getPages: App.pages,
          title: 'Flutter Clean Architecture',
          theme: Themes.light,
          locale: controller.isEn.value?const Locale('en', 'US'):const Locale('fa','IR'),
          darkTheme: Themes.dark,
          themeMode: ThemeMode.system,
          initialRoute: AppRoutes.loginPage,
          builder: EasyLoading.init(),
          translations: Messages(),
          fallbackLocale: const Locale('en', 'US'),
          // initialBinding:SettingPageBinding()
          // initialBinding: MainBinding(),
        ));
  }
}
