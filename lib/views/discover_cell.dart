import 'package:flutter/material.dart';

class DiscoverCell extends StatefulWidget {
  final String title;
  final String subTitle;
  final String imageName;

  // const DiscoverCell({
  //   super.key,
  //   required this.title,
  //   required this.subTitle,
  //   this.imageName = "",
  // });

  const DiscoverCell(
      {Key? key,
      required this.title,
      required this.subTitle,
      this.imageName = ""})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => DiscoverState();
}

class DiscoverState extends State<DiscoverCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: 100,
            height: 50,
            color: Colors.yellow,
            child: Row(
              children: const [
                Image(
                    width: 20,
                    height: 20,
                    image: AssetImage("images/done.png")),
                SizedBox(
                  width: 15,
                ),
                Text("1212")
              ],
            ),
          ),
          Container(
            width: 100,
            height: 50,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
