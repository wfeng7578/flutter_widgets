import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBoxController extends GetxController {
  TextEditingController textEditingController = TextEditingController();

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }

  // 用户实时输入文本
  final inputText = "".obs;

  // 监听用户输入
  void listInputText(String value) {
    inputText.value = value;
    // print("$value");
  }

  // 监听搜索框后缀图标
  Widget? listenSuffixIcon() {
    if (inputText.value.isEmpty) {
      return null;
    }
    return IconButton(
      onPressed: () {
        textEditingController.clear(); // 清空输入文本
        inputText.value = "";
      },
      icon: const Icon(Icons.close),
    );
  }
}
