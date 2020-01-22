import 'package:chimpu_edu_i/data/dummy/index.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:chimpu_edu_i/core/theme/app_theme.dart';
import 'package:intl/intl.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key key}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage>
    with TickerProviderStateMixin {
  static final String path = "lib/pages/teacher/rollup/rollup.dart";

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
    var width = MediaQuery.of(context).size.width;
    var now = new DateTime.now();
    var myFormat = DateFormat('d-MM-yyyy');
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
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: childrens.length,
        itemBuilder: (BuildContext context, int index) {
          var children = childrens[index];
          return Card(
            elevation: 8.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              decoration:
                  BoxDecoration(color: Colors.blueAccent.withOpacity(0.7)),
              child: Container(
                height: 110,
                padding: EdgeInsets.all(12.0),
                child: Row(
                  children: <Widget>[
                    CircularProfileAvatar(
                      children.avatarUrl,
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
                        left:
                            BorderSide(width: 2.0, color: Color(0xFFFFFFFFFF)),
                      )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(children.name, style: AppTheme.h1),
                          SizedBox(
                            height: 4,
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
