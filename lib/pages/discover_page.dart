import 'package:flutter/material.dart';
import 'package:hello_flutter/extensions/safe_getter.dart';
import 'package:hello_flutter/request_api/team_list_request.dart';
import 'package:hello_flutter/widgets/discover_cell.dart';

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
    DiscoverDataItem("4", "我是subtitle3", "done"),
    DiscoverDataItem("4", "我是subtitle3", "done"),
    DiscoverDataItem("4", "我是subtitle3", "done"),
  ];

  TeamListRequest? _request;

  void requestTeamList() async {
    try {
      _request = TeamListRequest();
      dynamic data = await _request?.request();
      var safeAbleData = SafeAbleData(data);
      var conferences =
          safeAbleData.safeData("data")?.getList("conferences") ?? [];
      print(conferences);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("发现页面"),
      ),

      // 外层最好用container包一下，方便后续扩展
      body: Container(
          color: Colors.white,
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    requestTeamList();
                  },
                  child: const Text("122")),
              SizedBox(
                  height: 250,
                  child: ListView.builder(
                      itemCount: datas.length,
                      itemBuilder: (context, index) {
                        DiscoverDataItem item = datas[index];
                        return DiscoverCell(
                          title: item.title,
                          subTitle: item.subTitle,
                        );
                      })),
            ],
          )),
    );
  }
}

class DiscoverDataItem {
  final String title;
  final String subTitle;
  final String imageName;

  DiscoverDataItem(this.title, this.subTitle, this.imageName);
}
