import 'package:code/constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SongsList extends StatelessWidget {
  const SongsList({super.key});
  final int _itemCount = 20;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstant.srceenWidth,
      height: AppConstant.srceenHeight,
      decoration: BoxDecoration(
        color: Color(0xfffbeaff),
      ),
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 64),
        itemCount: _itemCount,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onDoubleTap: () {
              print("双击播放音乐");
            },
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text("疑心病${index + 1}"),
              subtitle: Text("任然"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        Get.bottomSheet(
                          Container(
                            height: 320,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              gradient: LinearGradient(
                                colors: [Color(0xffe0c3fc), Color(0xff8ec5fc)],
                              ),
                            ),
                            child: Column(
                              children: [
                                _getListTile(
                                  Icon(Icons.person),
                                  "疑心病",
                                  subtitle: "任然",
                                ),
                                _getListTile(Icon(Icons.play_arrow), "播放"),
                                _getListTile(Icon(Icons.favorite_border), "喜欢"),
                                _getListTile(Icon(Icons.skip_next), "下一首播放"),
                                _getListTile(Icon(Icons.playlist_add), "添加到歌单"),
                                _getListTile(Icon(Icons.download), "下载到本地"),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: Icon(Icons.more_vert))
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getListTile(Icon icon, String title, {String subtitle = ""}) {
    return ListTile(
      leading: icon,
      title: Text(title),
      subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
    );
  }
}
