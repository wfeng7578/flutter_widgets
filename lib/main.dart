import 'package:code/pages/home/home_page.dart';
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
      debugShowCheckedModeBanner: false, // 关闭右上角DEBUG横幅
      theme: ThemeData(
        useMaterial3: true, // 启用Material3风格
      ),
      home: MyHome(),
    );
  }
}
