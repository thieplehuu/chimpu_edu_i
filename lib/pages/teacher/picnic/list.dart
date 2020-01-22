import 'package:cached_network_image/cached_network_image.dart';
import 'package:chimpu_edu_i/core/widgets/list_tile_checkbox.dart';
import 'package:chimpu_edu_i/pages/teacher/picnic/picnic.dart';
import 'package:chimpu_edu_i/pages/teacher/rollup/rollup.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:chimpu_edu_i/core/theme/app_theme.dart';
import 'package:intl/intl.dart';
import 'package:chimpu_edu_i/data/dummy/index.dart';
class PicNicsPage extends StatefulWidget {
  const PicNicsPage({Key key}) : super(key: key);

  @override
  _PicNicsPageState createState() => _PicNicsPageState();
}

class _PicNicsPageState extends State<PicNicsPage> with TickerProviderStateMixin {
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
                decoration:
                    BoxDecoration(color: Colors.indigo.withOpacity(0.8)),
                child: Container(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 80,
                          height: 80,
                          color: Colors.white,
                          margin: EdgeInsets.only(right: 12.0),
                          child: CachedNetworkImage(
                            imageUrl:
                                "http://giaitrithotrang.vn/wp-content/uploads/2016/08/Du-quay-day-vang.png",
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                picnic.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTheme.h2),
                              SizedBox(
                                height: 4,
                              ),
                              Text(myFormat.format(picnic.datetime),
                                  style: AppTheme.h3),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                picnic.description,
                                overflow: TextOverflow.ellipsis,
                                style: AppTheme.h3,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  FlatButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => PicNicPage(),
                                        )),
                                    color: Colors.green,
                                    padding: EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Row(
                                      // Replace with a Row for horizontal icon + text
                                      children: <Widget>[
                                        Icon(
                                          Icons.playlist_add_check,
                                          color: Colors.white,
                                        ),
                                        Text("DS Đăng ký", style: AppTheme.h3,)
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  FlatButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => PicNicPage(),
                                        )),
                                    color: Colors.blue,
                                    padding: EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Row(
                                      // Replace with a Row for horizontal icon + text
                                      children: <Widget>[
                                        Icon(
                                          Icons.watch_later,
                                          color: Colors.white,
                                        ),
                                        Text("Lịch trình", style: AppTheme.h3)
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ))),
          );
        },
      ),
    );
  }
}
