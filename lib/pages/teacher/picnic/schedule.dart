import 'package:cached_network_image/cached_network_image.dart';
import 'package:chimpu_edu_i/core/theme/app_theme.dart';
import 'package:chimpu_edu_i/models/picnic.dart';
import 'package:chimpu_edu_i/pages/teacher/picnic/add_picnic.dart';
import 'package:chimpu_edu_i/pages/teacher/picnic/booking.dart';
import 'package:chimpu_edu_i/pages/teacher/picnic/picnic.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:chimpu_edu_i/data/dummy/index.dart';
import 'package:intl/intl.dart';

final Map<DateTime, List> _holidays = {
  DateTime(2019, 1, 1): ['New Year\'s Day'],
  DateTime(2019, 1, 6): ['Epiphany'],
  DateTime(2019, 2, 14): ['Valentine\'s Day'],
  DateTime(2019, 4, 21): ['Easter Sunday'],
  DateTime(2019, 4, 22): ['Easter Monday'],
};

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>
    with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;
  void _handleNewDate(date) {
    setState(() {
      _selectedDay = date;
      _selectedEvents = picnics[_selectedDay] ?? [];
    });
    print(_selectedEvents);
  }

  DateTime _selectedDay;

  @override
  void initState() {
    //_calendarController = CalendarController();
    super.initState();

    final _selectedDay = DateTime.now();
    _selectedEvents = picnics[_selectedDay] ?? [];
    //_events = picnics;
    _events = Map<DateTime, List>();
    _events[DateTime(2020, 4, 29)] = [Picnic(
      id: 1,
      title: 'Tham quan công viên thỏ trắng',
      address: 'Công viên thỏ trắng-520 CMT8',
      thumbnailUrl: 'http://giaitrithotrang.vn/wp-content/uploads/2016/08/Du-quay-day-vang.png',
      content: 'Các bé sẽ tham quan công viên thỏ trắng, hoạt động ngoài trời, chơi các trò chơi vận động'
    )];
    _events[DateTime(2020, 4, 30)] = [Picnic(
      id: 2,
      title: 'Tham quan công viên thỏ trắng',
      address: 'Công viên thỏ trắng-520 CMT8',
      thumbnailUrl: 'http://giaitrithotrang.vn/wp-content/uploads/2016/08/Du-quay-day-vang.png',
      content: 'Các bé sẽ tham quan công viên thỏ trắng, hoạt động ngoài trời, chơi các trò chơi vận động'
    )];
    _events[DateTime(2020, 5, 1)] = [Picnic(
      id: 3,
      title: 'Tham quan công viên thỏ trắng',
      address: 'Công viên thỏ trắng-520 CMT8',
      thumbnailUrl: 'http://giaitrithotrang.vn/wp-content/uploads/2016/08/Du-quay-day-vang.png',
      content: 'Các bé sẽ tham quan công viên thỏ trắng, hoạt động ngoài trời, chơi các trò chơi vận động'
    )];
    _events[DateTime(2020, 5, 2)] = [Picnic(
      id: 4,
      title: 'Tham quan công viên thỏ trắng',
      address: 'Công viên thỏ trắng-520 CMT8',
      thumbnailUrl: 'http://giaitrithotrang.vn/wp-content/uploads/2016/08/Du-quay-day-vang.png',
      content: 'Các bé sẽ tham quan công viên thỏ trắng, hoạt động ngoài trời, chơi các trò chơi vận động'
    )];
    _events[DateTime(2020, 5, 7)] = [Picnic(
      id: 5,
      title: 'Tham quan công viên thỏ trắng',
      address: 'Công viên thỏ trắng-520 CMT8',
      thumbnailUrl: 'http://giaitrithotrang.vn/wp-content/uploads/2016/08/Du-quay-day-vang.png',
      content: 'Các bé sẽ tham quan công viên thỏ trắng, hoạt động ngoài trời, chơi các trò chơi vận động'
    )];
    _events[DateTime(2020, 5, 8)] = [Picnic(
      id: 6,
      title: 'Tham quan công viên thỏ trắng',
      address: 'Công viên thỏ trắng-520 CMT8',
      thumbnailUrl: 'http://giaitrithotrang.vn/wp-content/uploads/2016/08/Du-quay-day-vang.png',
      content: 'Các bé sẽ tham quan công viên thỏ trắng, hoạt động ngoài trời, chơi các trò chơi vận động'
    )];
    /*
    _events = {
      _selectedDay.subtract(Duration(days: 30)): [
        'Event A0',
        'Event B0',
        'Event C0'
      ],
      _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
      _selectedDay.subtract(Duration(days: 20)): [
        'Event A2',
        'Event B2',
        'Event C2',
        'Event D2'
      ],
      _selectedDay.subtract(Duration(days: 16)): ['Event A3', 'Event B3'],
      _selectedDay.subtract(Duration(days: 10)): [
        'Event A4',
        'Event B4',
        'Event C4'
      ],
      _selectedDay.subtract(Duration(days: 4)): [
        'Event A5',
        'Event B5',
        'Event C5'
      ],
      _selectedDay.subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
      _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
      _selectedDay.add(Duration(days: 1)): [
        'Event A8',
        'Event B8',
        'Event C8',
        'Event D8'
      ],
      _selectedDay.add(Duration(days: 3)):
          Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
      _selectedDay.add(Duration(days: 7)): [
        'Event A10',
        'Event B10',
        'Event C10'
      ],
      _selectedDay.add(Duration(days: 11)): ['Event A11', 'Event B11'],
      _selectedDay.add(Duration(days: 17)): [
        'Event A12',
        'Event B12',
        'Event C12',
        'Event D12'
      ],
      _selectedDay.add(Duration(days: 22)): ['Event A13', 'Event B13'],
      _selectedDay.add(Duration(days: 26)): [
        'Event A14',
        'Event B14',
        'Event C14'
      ],
    };
    */
    _selectedEvents = _events[_selectedDay] ?? [];
    
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Dã Ngoại'),
      ),
      body: SafeArea(
        child: Padding(padding: EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            RaisedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AddPicNicPage(),
                  )),
              color: Colors.green,
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Thêm mới',
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
            ),
            SizedBox(height: 8,),
            Container(child: _buildTableCalendarWithBuilders()),
            _buildEventList()
          ],
        ),),
      ),
    );
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
        holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              color: Colors.deepOrange[300],
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
            color: Colors.amber[400],
            width: 100,
            height: 100,
            child: Text(
              '${date.day}',
              style: TextStyle().copyWith(fontSize: 16.0),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          if (holidays.isNotEmpty) {
            children.add(
              Positioned(
                right: -2,
                top: -2,
                child: _buildHolidaysMarker(),
              ),
            );
          }

          return children;
        },
      ),
      onDaySelected: (date, events) {
        _onDaySelected(date, events);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _calendarController.isSelected(date)
            ? Colors.brown[500]
            : _calendarController.isToday(date)
                ? Colors.brown[300]
                : Colors.blue[400],
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
  /*
  Widget _buildEventList() {
    return Expanded(
        child: ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Text(event.toString()),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
    ));
  }
  */
  Widget _buildEventList() {
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
                            imageUrl:picnic.thumbnailUrl,
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
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                picnic.content,
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
