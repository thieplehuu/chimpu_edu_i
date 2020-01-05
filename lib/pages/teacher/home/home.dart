import 'package:chimpu_edu_i/core/res/assets.dart';
import 'package:chimpu_edu_i/pages/login/login.dart';
import 'package:chimpu_edu_i/pages/teacher/rollup/rollup.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
    var orangeTextStyle = TextStyle(
      color: Colors.deepOrange,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: CircleAvatar(
              maxRadius: 15.0,
              backgroundImage: CachedNetworkImageProvider(avatars[0]),
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
          Row(
            children: <Widget>[
              Expanded(
                  child: _buildActionWidget(FontAwesomeIcons.lock, "Images",
                      Colors.blue.withOpacity(0.6)))
            ],
          ),
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
                  child: _buildActionWidget(FontAwesomeIcons.calendarCheck,
                      "Điểm danh", Colors.deepOrange.withOpacity(0.7)),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RollUpPage(),
                      )),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: GestureDetector(
                  child: _buildActionWidget(FontAwesomeIcons.lock, "Lời nhắn",
                      Colors.blue.withOpacity(0.6)),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LoginPage(),
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
                  child: _buildActionWidget(FontAwesomeIcons.bookmark, "Đón về",
                      Colors.indigo.withOpacity(0.7)),
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: GestureDetector(
                  child: _buildActionWidget(
                      FontAwesomeIcons.file, "Dã ngoại", Colors.greenAccent),
                  onTap: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  child: _buildActionWidget(FontAwesomeIcons.bookmark, "Ăn",
                      Colors.indigo.withOpacity(0.7)),
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: GestureDetector(
                  child: _buildActionWidget(
                      FontAwesomeIcons.file, "Ngủ", Colors.greenAccent),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row _buildChannelListItem(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          FontAwesomeIcons.circle,
          size: 16.0,
        ),
        const SizedBox(width: 10.0),
        Text(title),
        Spacer(),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    );
  }

  Row _buildRecentWikiRow(String avatar, String title) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 15.0,
          backgroundImage: CachedNetworkImageProvider(avatar),
        ),
        const SizedBox(width: 10.0),
        Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
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
