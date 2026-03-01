import 'package:code/controller/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHome extends StatelessWidget {
  MyHome({super.key});

  final NavigationController navigationController =
      Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
            selectedIndex: navigationController.selectionIndex.value,
            onDestinationSelected: navigationController.changeNavigationIndex,
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: "首页"),
              NavigationDestination(icon: Icon(Icons.person), label: "我的")
            ]),
      ),
    );
  }
}
