import 'package:chimpu_edu_i/core/widgets/list_tile_checkbox.dart';
import 'package:chimpu_edu_i/data/dummy/index.dart';
import 'package:flutter/material.dart';

class PickUpPage extends StatefulWidget {
  const PickUpPage({Key key}) : super(key: key);

  @override
  _PickUpPageState createState() => _PickUpPageState();
}

class _PickUpPageState extends State<PickUpPage> with TickerProviderStateMixin {
  static final String path = "lib/pages/teacher/pickup/pickup.dart";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text('Điểm danh'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            var children = childrens[index];
            return Card(
              elevation: 8.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.lightGreen, Colors.green])),
                child: ListTileCheckBox(
                  title: children.name,
                  subTitle: children.birth.toString(),
                  image: children.avatarUrl,
                  height: 90,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
