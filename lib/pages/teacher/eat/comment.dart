import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text('Nhận xét bé ăn trưa'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            Text('Nhận xét bé ăn trưa',
                  style: TextStyle(color: Colors.green, fontSize: 18),),
            SizedBox(height: 12,),
            TextField(
              maxLines: 20,
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
                hintText: 'Nhận xét bữa trưa của bé ở đây',
              ),
            ),
            FlatButton(
                onPressed: () => {},
                child: Text(
                  'Thêm Nhận xét',
                  style: TextStyle(color: Colors.white),
                ),
                shape: new RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green)),
                color: Colors.green),
          ],
        ),
      )),
    );
  }
}
