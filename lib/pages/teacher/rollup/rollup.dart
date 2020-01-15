import 'package:chimpu_edu_i/core/widgets/list_tile_checkbox.dart';
import 'package:chimpu_edu_i/data/dummy/index.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:chimpu_edu_i/core/theme/app_theme.dart';
import 'package:intl/intl.dart';

class RollUpPage extends StatefulWidget {
  const RollUpPage({Key key}) : super(key: key);

  @override
  _RollUpPageState createState() => _RollUpPageState();
}

class _RollUpPageState extends State<RollUpPage> with TickerProviderStateMixin {
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
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.purpleAccent.withOpacity(0.7),
                borderRadius: BorderRadius.all(const Radius.circular(8.0))),
            height: 98,
            width: width,
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  myFormat.format(now),
                  style: AppTheme.h1,
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          '1/2',
                          style: AppTheme.h1,
                        ),
                        Text(
                          'Sĩ số',
                          style: AppTheme.h1,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          '1/2',
                          style: AppTheme.h1,
                        ),
                        Text(
                          'Đi học',
                          style: AppTheme.h1,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          '1/2',
                          style: AppTheme.h1,
                        ),
                        Text(
                          'Nghỉ',
                          style: AppTheme.h1,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            height: 44,
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                  borderSide: const BorderSide(color: Colors.purpleAccent, width: 1.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                  borderSide: const BorderSide(color: Colors.purpleAccent, width: 1.0),
                ),
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                  borderSide: const BorderSide(color: Colors.purpleAccent, width: 1.0),
                ),
                hintText: 'Search'
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: childrens.length,
              itemBuilder: (BuildContext context, int index) {
                var children = childrens[index];
                return Card(
                  elevation: 8.0,
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent.withOpacity(0.7)),
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
                              left: BorderSide(
                                  width: 2.0, color: Color(0xFFFFFFFFFF)),
                            )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(children.name, style: AppTheme.h1),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text('Đi học', style: AppTheme.h2,),
                                        CircularCheckBox(
                                          value: true,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.padded,
                                          onChanged: (bool x) {})
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text('Nghỉ học', style: AppTheme.h2,),
                                        CircularCheckBox(
                                          value: true,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.padded,
                                          onChanged: (bool x) {})
                                      ],
                                    )
                                  ],
                                )
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
          ),
        ],
      ),
    );
  }
}
