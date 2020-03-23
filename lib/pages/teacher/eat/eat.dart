import 'package:chimpu_edu_i/core/theme/app_theme.dart';
import 'package:chimpu_edu_i/data/dummy/index.dart';
import 'package:chimpu_edu_i/data/model/children.dart';
import 'package:chimpu_edu_i/pages/teacher/eat/comment.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'menu_food.dart';

class EatPage extends StatefulWidget {
  @override
  _EatPageState createState() => _EatPageState();
}

class _EatPageState extends State<EatPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    widgets.add(_buildAddMenuButton());
    for (var child in childrens) {
      widgets.add(_buildChildCard(child));
    }
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
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.max, children: widgets),
        ),
      )),
    );
  }

  Widget _buildAddMenuButton(){
    return RaisedButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MenuFoodPage(),
          )),
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Thực đơn hôm nay',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Icon(
                FontAwesomeIcons.plus,
                color: Colors.white,
              )
            ],
          ),
        ),
      );
  }

  Widget _buildAddCommentButton(Children child){
    return RaisedButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CommentPage(),
          )),
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Nhận xét',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Icon(
                FontAwesomeIcons.plus,
                color: Colors.white,
              )
            ],
          ),
        ),
      );
  }

  Widget _buildChildCard(Children child) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.deepOrange.withOpacity(0.7)),
        child: Container(
          height: 110,
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: <Widget>[
              CircularProfileAvatar(
                child.avatarUrl,
                errorWidget: (context, url, error) => Image.asset(
                  'assets/placeholder.jpg',
                  fit: BoxFit.cover,
                ),
                radius: 110 / 2 - 12,
                borderWidth: 2,
                borderColor: Colors.white70,
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(left: 12),
                padding: EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    border: Border(
                  left: BorderSide(width: 2.0, color: Color(0xFFFFFFFFFF)),
                )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(child.name, style: AppTheme.h1),
                    SizedBox(
                      height: 4,
                    ),
                    _buildAddCommentButton(child)
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
