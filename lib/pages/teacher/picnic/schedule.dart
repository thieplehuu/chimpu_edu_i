import 'package:cached_network_image/cached_network_image.dart';
import 'package:chimpu_edu_i/core/theme/app_theme.dart';
import 'package:chimpu_edu_i/pages/teacher/picnic/booking.dart';
import 'package:chimpu_edu_i/pages/teacher/picnic/picnic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:chimpu_edu_i/data/dummy/index.dart';
import 'package:intl/intl.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {

  void _handleNewDate(date) {
    setState(() {
      _selectedDay = date;
      _selectedEvents = picnics[_selectedDay] ?? [];
    });
    print(_selectedEvents);
  }

  List _selectedEvents;
  DateTime _selectedDay;

  

  @override
  void initState() {
    super.initState();
    _selectedEvents = picnics[_selectedDay] ?? [];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
         title: Text('Schedule'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              child: Calendar(
                  events: picnics,
                  onRangeSelected: (range) =>
                      print("Range is ${range.from}, ${range.to}"),
                  onDateSelected: (date) => _handleNewDate(date),
                  isExpandable: true,
                  isExpanded: true,
                  showTodayIcon: true,
                  eventDoneColor: Colors.green,
                  eventColor: Colors.grey),                  
            ),
            _buildEventList()
          ],
        ),
      ),
    );
  }

  Widget _buildEventList() {
    var myFormat = DateFormat('d-MM-yyyy');
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index){
          var picnic = _selectedEvents[index];
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
                            imageUrl:picnic['thumbnail_url'].toString(),
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
                                picnic['name'].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTheme.h2),
                              SizedBox(
                                height: 4,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                picnic['description'].toString(),
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
                                          builder: (_) => BookingPage(),
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
        itemCount: _selectedEvents.length,
      ),
    );
  }
}