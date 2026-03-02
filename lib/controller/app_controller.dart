import 'package:get/get.dart';

class AppController extends GetxController {
  final isDrawerOpen = false.obs; // 监听Drawer是否打开 注意打开是flase, 关闭是true

  void onChangedDrawer(bool onDrawerChanged) {
    print(isDrawerOpen.value);
    isDrawerOpen.value = onDrawerChanged;
  }
}
