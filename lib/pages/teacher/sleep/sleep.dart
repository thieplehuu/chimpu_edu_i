import 'package:chimpu_edu_i/core/theme/app_theme.dart';
import 'package:chimpu_edu_i/models/user.dart';
import 'package:chimpu_edu_i/pages/blocs/main/bloc/main_bloc.dart';
import 'package:chimpu_edu_i/pages/teacher/sleep/blocs/sleep/sleep_bloc.dart';
import 'package:chimpu_edu_i/pages/teacher/student/student.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'comment.dart';

class SleepPage extends StatefulWidget {
  @override
  _SleepPageState createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  SleepBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = SleepBloc(mainBloc: BlocProvider.of<MainBloc>(context))
      ..add(LoadCommentsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
          title: Text('Giấc ngủ của bé'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {},
            )
          ],
        ),
        body: BlocBuilder<SleepBloc, SleepState>(
            bloc: bloc,
            builder: (_, state) {
              List<User> users;
              if (state is SleepReady) {
                users = state.users;
              } else {
                users = (BlocProvider.of<MainBloc>(context).state as AppReady)
                    .users;
              }

              return SafeArea(
                  child: Padding(
                      padding: EdgeInsets.all(12),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: new List.generate(
                              users.length,
                              (index) => Card(
                                    elevation: 8.0,
                                    margin: EdgeInsets.symmetric(vertical: 6.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.6)),
                                      child: Container(
                                        height: 110,
                                        padding: EdgeInsets.all(12.0),
                                        child: Row(
                                          children: <Widget>[
                                            GestureDetector(
                                                onTap: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (_) => StudentPage(
                                                        user: users[index],
                                                      ),
                                                    )),
                                                child: CircularProfileAvatar(
                                                  users[index].avatarUrl,
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Image.asset(
                                                    'assets/placeholder.jpg',
                                                    fit: BoxFit.cover,
                                                  ),
                                                  radius: 110 / 2 - 12,
                                                  borderWidth: 2,
                                                  borderColor: Colors.white70,
                                                )),
                                            Expanded(
                                                child: Container(
                                              margin: EdgeInsets.only(left: 12),
                                              padding:
                                                  EdgeInsets.only(left: 12),
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                left: BorderSide(
                                                    width: 2.0,
                                                    color: Color(0xFFFFFFFFFF)),
                                              )),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(users[index].name,
                                                      style: AppTheme.h1),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Expanded(
                                                          child: users[index]
                                                                      .sleepComment !=
                                                                  null
                                                              ? Text(
                                                                  users[index]
                                                                      .sleepComment
                                                                      .content,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .white,
                                                                  ))
                                                              : Container()),
                                                      RaisedButton(
                                                        onPressed: () =>
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (_) =>
                                                                      CommentPage(
                                                                    comment: users[
                                                                            index]
                                                                        .sleepComment,
                                                                    onSave: (task,
                                                                        user) {
                                                                      bloc.add(UpdateCommentUser(
                                                                          user:
                                                                              user));
                                                                    },
                                                                    user: users[
                                                                        index],
                                                                  ),
                                                                )),
                                                        color: Colors.pinkAccent
                                                            .withOpacity(0.7),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 4,
                                                                  bottom: 4),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: <Widget>[
                                                              Text(
                                                                'Nhận xét ',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              Icon(
                                                                FontAwesomeIcons
                                                                    .plus,
                                                                color: Colors
                                                                    .white,
                                                                size: 18,
                                                              )
                                                            ],
                                                          ),
                                                        ),
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
                                  )),
                        ),
                      )));
            }));
  }

  Widget _buildAddMenuButton() {
    return RaisedButton(
      onPressed: () {},
      color: Colors.green,
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Giờ ngủ từ 11: 30 tới 13:00',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
