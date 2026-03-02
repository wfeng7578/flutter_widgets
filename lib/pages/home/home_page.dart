import 'package:code/controller/app_controller.dart';
import 'package:code/pages/home/widgets/search_box.dart';
import 'package:code/pages/home/widgets/songs_list.dart';
import 'package:code/widgets/app_drawer.dart';
import 'package:code/widgets/mini_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      onDrawerChanged: appController.onChangedDrawer,
      drawer: AppDrawer(),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Color(0xfffbeaff),
        title: SearchBox(),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("搜索"),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Stack(
        children: [
          SongsList(),
          MiniPlayer(),
        ],
      ),
    );
  }
}
