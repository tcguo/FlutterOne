import 'package:flutter/material.dart';
import 'package:hello_flutter/views/discover_cell.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<DiscoverDataItem> datas = [
    DiscoverDataItem("1", "我是subtitle1", "done"),
    DiscoverDataItem("2", "我是subtitle2", "done"),
    DiscoverDataItem("3", "我是subtitle3", "done"),
    DiscoverDataItem("4", "我是subtitle3", "done"),
    DiscoverDataItem("5", "我是subtitle3", "done"),
    DiscoverDataItem("6", "我是subtitle3", "done"),
    DiscoverDataItem("7", "我是subtitle3", "done"),
    DiscoverDataItem("8", "我是subtitle3", "done"),
    DiscoverDataItem("8", "我是subtitle8", "done"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("发现页面"),
      ),

      // 外层最好用container包一下，方便后续扩展
      body: Container(
          color: Colors.white,
          child: ListView.builder(
              padding: const EdgeInsets.only(top: 20),
              scrollDirection: Axis.vertical,
              itemCount: datas.length,
              itemBuilder: (context, index) {
                DiscoverDataItem item = datas[index];
                return DiscoverCell(
                  title: item.title,
                  subTitle: item.subTitle,
                );
              })),
    );
  }
}

class DiscoverDataItem {
  final String title;
  final String subTitle;
  final String imageName;

  DiscoverDataItem(this.title, this.subTitle, this.imageName);
}
