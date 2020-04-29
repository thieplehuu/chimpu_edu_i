import 'package:chimpu_edu_i/core/theme/app_theme.dart';
import 'package:chimpu_edu_i/models/user.dart';
import 'package:chimpu_edu_i/pages/blocs/main/bloc/main_bloc.dart';
import 'package:chimpu_edu_i/pages/teacher/eat/blocs/eat/eat_bloc.dart';
import 'package:chimpu_edu_i/pages/teacher/eat/comment.dart';
import 'package:chimpu_edu_i/pages/teacher/student/student.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'menu_food.dart';

class EatPage extends StatefulWidget {
  @override
  _EatPageState createState() => _EatPageState();
}

class _EatPageState extends State<EatPage> {
  EatBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = EatBloc(mainBloc: BlocProvider.of<MainBloc>(context))
      ..add(LoadCommentsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EatBloc, EatState>(
        bloc: bloc,
        builder: (_, state) {
          List<User> users;
          if (state is EatReady) {
            users = state.users;
          } else {
            users =
                (BlocProvider.of<MainBloc>(context).state as AppReady).users;
          }
          List<Widget> widgets = List<Widget>();
          widgets.add(_buildAddMenuButton());
          for (var user in users) {
            widgets.add(_buildChildCard(user));
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
                child:
                    Column(mainAxisSize: MainAxisSize.max, children: widgets),
              ),
            )),
          );
        });
  }

  Widget _buildAddMenuButton() {
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

  Widget _buildAddCommentButton(User user) {
    return RaisedButton(
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CommentPage(
              comment: user.eatComment,
              onSave: (task, user) {
                bloc.add(UpdateCommentUser(user: user));
              },
              user: user,
            ),
          )),
      color: Colors.green,
      child: Padding(
        padding: EdgeInsets.only(top: 4, bottom: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              'Nhận xét ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Icon(
              FontAwesomeIcons.plus,
              color: Colors.white,
              size: 18,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildChildCard(User user) {
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
              GestureDetector(
                onTap:  () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => StudentPage(
                      user: user,
                    ),
                  )),
                child: CircularProfileAvatar(
                user.avatarUrl,
                errorWidget: (context, url, error) => Image.asset(
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
                padding: EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    border: Border(
                  left: BorderSide(width: 2.0, color: Color(0xFFFFFFFFFF)),
                )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(user.name, style: AppTheme.h1),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: user.eatComment != null
                                ? Text(user.eatComment.content,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ))
                                : Container()),
                        _buildAddCommentButton(user)
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
  }
}
