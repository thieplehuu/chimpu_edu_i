import 'package:chimpu_edu_i/models/teacher_comment.dart';
import 'package:chimpu_edu_i/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chimpu_edu_i/pages/blocs/main/bloc/main_bloc.dart';
import 'package:chimpu_edu_i/pages/teacher/sleep/blocs/comment/comment_bloc.dart';

typedef OnSaveCallback = Function(String task, User user);
class CommentPage extends StatefulWidget {
  final OnSaveCallback onSave;
  final User user;
  final TeacherComment comment;
  CommentPage({
    Key key,
    @required this.onSave,
    @required this.comment,
    @required this.user,
  }) : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  CommentBloc bloc;
  final TextEditingController _commentController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if(widget.comment != null){
      _commentController.text = widget.comment.content;
    }
    bloc = CommentBloc(
      mainBloc: BlocProvider.of<MainBloc>(context),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
          //var user = widget.user;
          //user.copyWith(sleepComment: )
          //widget.onSave("Save", widget.user);
          return true;
      },
      child: Scaffold(
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
        body: Center(
            child: Padding(
          padding: EdgeInsets.all(12),
          child: BlocBuilder<CommentBloc, CommentState>(
              bloc: bloc,
              builder: (_, state) {
                if (state is AddCommentOK) {
                  var user = widget.user;
                  user = user.copyWith(sleepComment: state.comment);
                  widget.onSave("Save", user);
                  return Container(
                    child: Text("Add Success"),
                  );
                } else {
                  return Column(
                    children: <Widget>[
                      Text(
                        'Nhận xét bé ngủ trưa',
                        style: TextStyle(color: Colors.green, fontSize: 18),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextField(
                        maxLines: 20,
                        decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.greenAccent, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.0),
                          ),
                          hintText: 'Nhập nhận xét vào đây',
                        ),
                        controller: _commentController,
                      ),
                      FlatButton(
                          onPressed: () {
                            bloc.add(
                                AddComment(user: widget.user, content: _commentController.text));
                          },
                          child: Text(
                            'Thêm nhận xét',
                            style: TextStyle(color: Colors.white),
                          ),
                          shape: new RoundedRectangleBorder(
                              side: BorderSide(color: Colors.green)),
                          color: Colors.green),
                    ],
                  );
                }
              }),
        )),
      ),
    );
  }
}
