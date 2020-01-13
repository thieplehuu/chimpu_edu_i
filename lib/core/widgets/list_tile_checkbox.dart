import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

class ListTileCheckBox extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final BoxFit fit;
  final double height;
  const ListTileCheckBox({this.title, this.subTitle, this.image, Key key,this.fit,this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      padding: EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          CircularProfileAvatar(
            image,
            errorWidget: (context, url, error) => Image.asset('assets/placeholder.jpg',fit: BoxFit.cover,),
            radius: height/2-12,
            borderWidth: 2,
            borderColor: Colors.white70,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 12),
              padding: EdgeInsets.only(left: 12),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(width: 2.0, color: Color(0xFFFFFFFFFF)),
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(height: 8,),
                  Text(
                    subTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    )
                  ),
              ],),
            )
          ),
          Container(
            width: 50,
            child: CircularCheckBox(
              value: true,
              materialTapTargetSize: MaterialTapTargetSize.padded,
              onChanged: (bool x) {
                
              }
            ),
          )
        ],
      ),
    );
  }
}