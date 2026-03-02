import 'package:code/controller/app_controller.dart';
import 'package:code/controller/navigation_controller.dart';
import 'package:code/pages/home/home_page.dart';
import 'package:code/pages/mine/mine_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final List<Widget> pages = [HomePage(), MinePage()];
  final NavigationController navigationController =
      Get.put(NavigationController());

  final AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[navigationController.selectionIndex.value],
        bottomNavigationBar: appController.isDrawerOpen.value
            ? null
            : NavigationBar(
                selectedIndex: navigationController.selectionIndex.value,
                onDestinationSelected:
                    navigationController.changeNavigationIndex,
                destinations: [
                  NavigationDestination(icon: Icon(Icons.home), label: "首页"),
                  NavigationDestination(icon: Icon(Icons.person), label: "我的")
                ],
              ),
      ),
    );
  }
}
