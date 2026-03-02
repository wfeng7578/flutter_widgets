import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false, // 关闭返回按钮箭头
        title: Text("我的页面"),
      ),
    );
  }
}
