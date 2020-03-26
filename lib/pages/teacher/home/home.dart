import 'package:chimpu_edu_i/core/res/assets.dart';
import 'package:chimpu_edu_i/data/dummy/index.dart';
import 'package:chimpu_edu_i/data/model/user.dart';
import 'package:chimpu_edu_i/pages/blocs/main/bloc/main_bloc.dart';
import 'package:chimpu_edu_i/pages/message/message.dart';
import 'package:chimpu_edu_i/pages/teacher/eat/eat.dart';
import 'package:chimpu_edu_i/pages/teacher/pickup/pickup.dart';
import 'package:chimpu_edu_i/pages/teacher/picnic/schedule.dart';
import 'package:chimpu_edu_i/pages/teacher/rollup/rollup.dart';
import 'package:chimpu_edu_i/pages/teacher/sleep/sleep.dart';
import 'package:chimpu_edu_i/routers/custom_route.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  static final String path = "lib/pages/teacher/home/home.dart";

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
    return BlocBuilder<MainBloc, MainState>(
        builder: (_, state) {
          if (state is AppReady) {
            final users = state.users;
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                    child: BlocBuilder<MainBloc, MainState>(
                  builder: (_, state) {
                    if(state is AppReady){                     
                      final user = state.auth;             
                      return CircleAvatar(
                        maxRadius: 15.0,
                        backgroundImage: CachedNetworkImageProvider(user.avatarUrl),
                      );
                    } else {                                  
                      return ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(60.0)),
                        child: Image.asset('assets/images/default_user.png'),
                      );
                    }              
                  },
                ),
                  )
                ],
              ),
              body: ListView(
                padding: const EdgeInsets.all(16.0),
                children: <Widget>[
                  Text(
                    "Album ảnh",
                    style: Theme.of(context).textTheme.display1.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(height: 16.0),
                  _buildImageSlider(users, Colors.blue.withOpacity(0.6)),
                  const SizedBox(height: 16.0),
                  Text(
                    "Hoạt động",
                    style: Theme.of(context).textTheme.display1.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          child: _buildActionWidget(FontAwesomeIcons.pen,
                              "Điểm danh", Colors.deepOrange.withOpacity(0.7)),
                          onTap: () => Navigator.of(context).push(
                            FadeRoute(
                              widget: RollUpPage(
                                users: users,
                                onSave: (user) => {},
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: GestureDetector(
                          child: _buildActionWidget(FontAwesomeIcons.sms,
                              "Lời nhắn", Colors.blue.withOpacity(0.6)),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MesssagePage(),
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          child: _buildActionWidget(
                              FontAwesomeIcons.truckPickup,
                              "Đón về",
                              Colors.indigo.withOpacity(0.7)),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PickUpPage(),
                              )),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: GestureDetector(
                          child: _buildActionWidget(FontAwesomeIcons.mountain,
                              "Dã ngoại", Colors.greenAccent),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SchedulePage(),
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          child: _buildActionWidget(FontAwesomeIcons.utensils,
                              "Ăn", Colors.pinkAccent.withOpacity(0.7)),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => EatPage(),
                              )),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: GestureDetector(
                          child: _buildActionWidget(
                              FontAwesomeIcons.bed, "Ngủ", Colors.purpleAccent),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SleepPage(),
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Container(
              child: Text("Data loading"),
            );
          }
        });
  }

  Container _buildImageSlider(List<User> childrens, Color color) {
    return Container(
      height: 106.0,
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: childrens.length,
        itemBuilder: (BuildContext context, int index) {
          var children = childrens[index];
          return Container(
            width: 106,
            height: 106,
            margin: EdgeInsets.only(right: 4.0),
            child: CircularProfileAvatar(
              children.avatarUrl,
              errorWidget: (context, url, error) => Image.asset(
                'assets/images/default_doctor.png',
                fit: BoxFit.cover,
              ),
              radius: 106 / 2,
              borderWidth: 2,
              borderColor: Colors.green,
            ),
          );
        },
      ),
    );
  }

  Stack _buildActionWidget(IconData icon, String label, Color color) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(26.0),
          alignment: Alignment.centerRight,
          child: Opacity(
              opacity: 0.3,
              child: Icon(
                icon,
                size: 40,
                color: Colors.white,
              )),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(height: 16.0),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
