import 'package:code/constant/colors_constant.dart';
import 'package:code/controller/search_box_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final SearchBoxController searchBoxController =
      Get.put(SearchBoxController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Obx(
        () => TextField(
          onChanged: searchBoxController.listInputText,
          cursorHeight: 20,
          controller: searchBoxController.textEditingController,
          decoration: InputDecoration(
            hintText: "搜索歌曲",
            fillColor: Color(0xfffcf8ff),
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20),
            ),
            prefixIcon: Icon(Icons.search), // 前缀图标
            suffixIcon: searchBoxController.listenSuffixIcon(), // 后缀图标
          ),
        ),
      ),
    );
  }
}
