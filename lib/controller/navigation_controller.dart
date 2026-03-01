import 'package:get/get.dart';

class NavigationController extends GetxController {
  final selectionIndex = 0.obs; // 底部导航栏索引

  void changeNavigationIndex(int index) {
    selectionIndex.value = index;
  }
}
