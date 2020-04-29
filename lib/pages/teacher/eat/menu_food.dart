import 'package:chimpu_edu_i/pages/teacher/eat/blocs/menufood/bloc/menufood_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuFoodPage extends StatefulWidget {
  @override
  _MenuFoodPageState createState() => _MenuFoodPageState();
}

class _MenuFoodPageState extends State<MenuFoodPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuFoodBloc, MenuFoodState>(
        bloc: MenuFoodBloc(),
        builder: (_, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.1,
              backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
              title: Text('Bữa trưa của bé'),
            ),
            body: Center(
                child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: <Widget>[
                  Text(
                    'Thực đơn hôm nay',
                    style: TextStyle(color: Colors.green, fontSize: 18),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    maxLines: 20,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      hintText: 'Nhập thực đơn hôm nay ở đây',
                    ),
                  ),
                  FlatButton(
                      onPressed: () => {},
                      child: Text(
                        'Thêm thực đơn',
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: new RoundedRectangleBorder(
                          side: BorderSide(color: Colors.green)),
                      color: Colors.green),
                ],
              ),
            )),
          );
        });
  }
}
