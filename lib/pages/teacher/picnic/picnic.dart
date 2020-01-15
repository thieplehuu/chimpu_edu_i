import 'package:chimpu_edu_i/core/widgets/list_tile_checkbox.dart';
import 'package:chimpu_edu_i/data/dummy/index.dart';
import 'package:chimpu_edu_i/pages/teacher/rollup/rollup.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:chimpu_edu_i/core/theme/app_theme.dart';
import 'package:intl/intl.dart';

class PicNicPage extends StatefulWidget {
  const PicNicPage({Key key}) : super(key: key);

  @override
  _PicNicPageState createState() => _PicNicPageState();
}

class _PicNicPageState extends State<PicNicPage> with TickerProviderStateMixin {
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
    var myFormat = DateFormat('d-MM-yyyy');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text('Dã Ngoại'),
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
        itemCount: picnics.length,
        itemBuilder: (BuildContext context, int index) {
          var picnic = picnics[index];
          return Card(
            elevation: 8.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.blue.withOpacity(0.6)),
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 12),
                        padding: EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              picnic.title,
                              style: AppTheme.h2
                            ),
                            SizedBox(height: 4,),
                            Text(
                              myFormat.format(picnic.datetime),
                              style: AppTheme.h3
                            ),
                            SizedBox(height: 4,),
                            Text(
                              picnic.description,
                              style: AppTheme.h3
                            ),
                        ],),
                      )
                    ),
                    GestureDetector(
                      onTap: ()  => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RollUpPage(),
                        )),                      
                      child:Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                        size: 40.0,
                      ),
                    ),
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
