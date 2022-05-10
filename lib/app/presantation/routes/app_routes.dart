import 'package:flutter_clean_architecture/app/presantation/bindings/login_page_binding.dart';
import 'package:flutter_clean_architecture/app/presantation/bindings/main_binding.dart';
import 'package:flutter_clean_architecture/app/presantation/pages/login/login_page.dart';
import 'package:get/get.dart';

import '../bindings/setting_page_binding.dart';
import '../pages/home/home_page.dart';
import '../pages/setting/setting_page.dart';

class AppRoutes {
  static const String loginPage = "/loginPage";
  static const String homePage = "/homePage";
  static const String settingPage = "/settingPage";
}

class App {
  static final pages = [
    GetPage(
        name: AppRoutes.loginPage,
        page: () => LoginPage(),
        binding: LoginPageBinding()),
    GetPage(
        name: AppRoutes.homePage,
        page: () => const HomePage(),),
    GetPage(
        name: AppRoutes.settingPage,
        page: () => const SettingPage(),
        bindings: [MainBinding(),SettingPageBinding()]),
  ];
}
