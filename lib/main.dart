import 'package:code/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Pika Music",
      initialRoute: AppRouter.main, // 初始路由
      getPages: AppRouter.routers, // 注册路由表
      debugShowCheckedModeBanner: false, // 关闭右上角DEBUG横幅
      theme: ThemeData(
        useMaterial3: true, // 启用Material3风格
      ),
    );
  }
}
