import 'package:chimpu_edu_i/core/theme/app_theme.dart';
import 'package:chimpu_edu_i/data/model/children.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:chimpu_edu_i/data/dummy/index.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text('Bữa trưa của bé'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            Text('Nhận xét bé ngủ trưa',
                  style: TextStyle(color: Colors.green, fontSize: 18),),
            SizedBox(height: 12,),
            TextField(
              maxLines: 20,
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
                hintText: 'Nhập nhận xét vào đây',
              ),
            ),
            FlatButton(
                onPressed: () => {},
                child: Text(
                  'Thêm nhận xét',
                  style: TextStyle(color: Colors.white),
                ),
                shape: new RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green)),
                color: Colors.green),
          ],
        ),
      )),
    );
  }
}
