import 'package:chimpu_edu_i/core/theme/app_theme.dart';
import 'package:chimpu_edu_i/data/model/user.dart';
import 'package:chimpu_edu_i/pages/blocs/main/bloc/main_bloc.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

typedef OnSaveCallback = Function(User);

class RollUpPage extends StatefulWidget {
  final List<User> users;
  const RollUpPage({
    Key key,
    @required this.users,
    @required this.onSave,
  }) : super(key: key);

  final OnSaveCallback onSave;
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
    return  BlocBuilder<MainBloc, MainState>(
        builder: (_, state) {
          List<User> users = (state as DataLoaded).users;
          var totalOff = 0;
          var totalRollup = 0;
          for (var i = 0; i < users.length; i++) {
            var user = users[i];
            if (user.isOff) {
              totalOff++;
            }

            if (user.isRollup) {
              totalRollup++;
            }
          }
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
                      borderRadius:
                          BorderRadius.all(const Radius.circular(8.0))),
                  height: 100,
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
                                users.length.toString(),
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
                                (users.length - totalOff).toString() +
                                    '/' +
                                    users.length.toString(),
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
                                (totalRollup).toString() +
                                    '/' +
                                    (users.length - totalOff).toString(),
                                style: AppTheme.h1,
                              ),
                              Text(
                                'Điểm danh',
                                style: AppTheme.h1,
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                (totalOff).toString() +
                                    '/' +
                                    users.length.toString(),
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
                          borderSide: const BorderSide(
                              color: Colors.purpleAccent, width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                          borderSide: const BorderSide(
                              color: Colors.purpleAccent, width: 1.0),
                        ),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                          borderSide: const BorderSide(
                              color: Colors.purpleAccent, width: 1.0),
                        ),
                        hintText: 'Search'),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int index) {
                      var user = users[index];
                      return Card(
                        elevation: 8.0,
                        margin: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.purpleAccent.withOpacity(0.7)),
                          child: Container(
                            height: 110,
                            padding: EdgeInsets.all(12.0),
                            child: Row(
                              children: <Widget>[
                                CircularProfileAvatar(
                                  user.avatarUrl,
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(user.name,
                                          style: AppTheme.h1
                                              .copyWith(color: Colors.black)),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                'Điểm danh',
                                                style: AppTheme.h2,
                                              ),
                                              CircularCheckBox(
                                                  value: user.isRollup,
                                                  inactiveColor: Colors.white,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .padded,
                                                  onChanged: (bool x) {                                                    
                                                    BlocProvider.of<MainBloc>(context).add(
                                                      RollupUser(user:user.copyWith(
                                                          isRollup:
                                                              !user.isRollup)),
                                                    );                                                    
                                                  })
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                'Nghỉ học',
                                                style: AppTheme.h2,
                                              ),
                                              CircularCheckBox(
                                                  value: user.isOff,
                                                  inactiveColor: Colors.white,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .padded,
                                                  onChanged: (bool x) {BlocProvider.of<MainBloc>(context).add(
                                                      RollupUser(user:user.copyWith(
                                                          isOff:
                                                              !user.isOff)),
                                                    );})
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
        });
  }
}
