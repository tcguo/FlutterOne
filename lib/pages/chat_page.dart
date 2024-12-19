import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/team/team_list_viewmodel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TeamListViewModel _vm = TeamListViewModel();

  void loadData() {}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("球队"),
      ),
      body: const Center(
        child: Text('球队页面'),
      ),
    );
  }
}
