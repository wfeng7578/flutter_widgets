import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280,
      child: Column(
        children: [
          _getDrawerHeader(),
          _getListTile(Icon(Icons.person), "我的", "/mine"),
          // todo
          _getListTile(Icon(Icons.playlist_add), "历史播放", "todo"),
          // todo
          _getListTile(Icon(Icons.close), "定时关闭", "todo"),
          // todo
          _getListTile(Icon(Icons.close), "最近播放", "todo"),
        ],
      ),
    );
  }

  Widget _getDrawerHeader() {
    return DrawerHeader(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 100,
            width: 100,
            decoration: BoxDecoration(),
            child: Image.asset(
              "assets/images/favicon.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Pika Music",
            style: TextStyle(
                fontFamily: "CuteFont",
                fontSize: 25,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget _getListTile(Icon icon, String title, String toPage) {
    return ListTile(
      leading: icon,
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        Get.toNamed(toPage);
      },
    );
  }
}
