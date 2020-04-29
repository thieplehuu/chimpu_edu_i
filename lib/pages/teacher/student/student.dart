import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chimpu_edu_i/core/animations/face_animation.dart';
import 'package:chimpu_edu_i/models/media.dart';
import 'package:chimpu_edu_i/models/user.dart';
import 'package:chimpu_edu_i/pages/blocs/main/bloc/main_bloc.dart';
import 'package:chimpu_edu_i/pages/teacher/student/bloc/student_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentPage extends StatefulWidget {
  final User user;
  const StudentPage({@required this.user, Key key}) : super(key: key);

  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage>
    with TickerProviderStateMixin {
  static final String path = "lib/pages/teacher/child/child.dart";
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  VoidCallback _showPersBottomSheetCallBack;
  StudentBloc bloc;
  Map<String, String> files= new  Map();
  @override
  void initState() {
    super.initState();
    bloc = StudentBloc(
      mainBloc: BlocProvider.of<MainBloc>(context),
    )..add(LoadStudentData(user: widget.user));
    _showPersBottomSheetCallBack = _showBottomSheet;    
    loadImageList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var user = widget.user;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 450,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(user.avatarUrl),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black,
                            Colors.black.withOpacity(.3)
                          ])),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FadeAnimation(
                                1,
                                Text(
                                  user.name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: <Widget>[
                                FadeAnimation(
                                    1.2,
                                    Text(
                                      "Hình ảnh",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                    )),
                                SizedBox(
                                  width: 50,
                                ),
                                FadeAnimation(
                                    1.3,
                                    Text(
                                      "Sổ liên lạc",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(
                            1.6,
                            Text(
                              "Emma Charlotte Duerre Watson was born in Paris, France, to English parents, Jacqueline Luesby and Chris Watson, both lawyers. She moved to Oxfordshire when she was five, where she attended the Dragon School.",
                              style: TextStyle(color: Colors.grey, height: 1.4),
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "Born",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "April, 15th 1990, Paris, France",
                              style: TextStyle(color: Colors.grey),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "Today",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.8,
                            Container(
                                height: 200,
                                child: BlocBuilder<StudentBloc, StudentState>(
                                    bloc: bloc,
                                    builder: (_, state) {
                                      if (state is LoadDataOK){
                                        List<Widget> childs = List<Widget>();
                                        childs.add(makeUpload());
                                        state.medias.forEach((media) => childs.add(makeMedia(media: media)));    
                                        return ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: childs,
                                      );
                                      } else {
                                        return ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: <Widget>[
                                          makeUpload(),
                                        ],
                                      );
                                      }
                                      
                                    }))),
                        SizedBox(
                          height: 120,
                        )
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }

  

  void _showBottomSheet() {
    setState(() {
      _showPersBottomSheetCallBack = null;
    });
    double width = MediaQuery.of(context).size.width;
    _scaffoldKey.currentState
        .showBottomSheet((context) {
          return new Container(
            height: width,
            color: Colors.greenAccent,
            child: new Center(
              child: makeBottomSheet(),
            ),
          );
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              _showPersBottomSheetCallBack = _showBottomSheet;
            });
          }
        });
  }

  Widget makeMedia({media}) {
    if(media.type == MediaType.image){
      return AspectRatio(
        aspectRatio: 1.5 / 1,
        child: Container(
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: CachedNetworkImageProvider(media.url),fit: BoxFit.cover)),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.3)
            ])),
          ),
        ),
      );
      
    } else if ( media.type == MediaType.video){
      return AspectRatio(
        aspectRatio: 1.5 / 1,
        child: Container(
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/images/emma-1.jpg'), fit: BoxFit.cover)),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.3)
            ])),
            child: Align(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 70,
              ),
            ),
          ),
        ),
      );
    }
    return Container();
  }

  Widget makeUpload() {
    return AspectRatio(
      aspectRatio: 1.5 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        child: Card(
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: _showPersBottomSheetCallBack,
        ),
      ),
      ),
    );
  }

  Widget makeTakePhoto() {
    return Container(
      margin: EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[IconButton(
          icon: Icon(Icons.camera_enhance),
          iconSize: 96,
          onPressed: _showPersBottomSheetCallBack,
        ),
        Text("Chụp Ảnh")],
        )
      );
  }

  Widget makeCamera() {
    return Container(
      margin: EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[IconButton(
          icon: Icon(Icons.camera_alt),
          iconSize: 96,
          onPressed: _showPersBottomSheetCallBack,
        ),
        Text("Quay Camera")],
        )
      );
  }
  Future<void> loadImageList() async {
     files = await FilePicker.getMultiFilePath(
          type: FileType.custom,
          allowedExtensions: ['jpg','png', 'mp4'],
        );
 }
  Widget makeBottomSheet(){
    List<Widget> items = List<Widget>();
    items.add(makeTakePhoto());
    items.add(makeCamera());
    files.forEach((k,v){
      items.add(makeTakePhoto());
    });

    return GridView.builder(      
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 0),
      itemBuilder: (_, index) {        
        return items[index];
      },
      itemCount: items.length,
    );
  }
}
