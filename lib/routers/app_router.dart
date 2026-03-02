import 'package:code/pages/home/home_page.dart';
import 'package:code/pages/main_page.dart';
import 'package:code/pages/mine/mine_page.dart';
import 'package:get/get.dart';

class AppRouter {
  static const String main = "/";
  static const String home = "/home";
  static const String mine = "/mine";
  static final routers = [
    GetPage(name: main, page: () => MainPage()),
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: mine, page: () => MinePage()),
  ];
}
