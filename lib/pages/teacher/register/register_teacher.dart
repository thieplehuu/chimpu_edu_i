import 'package:chimpu_edu_i/core/widgets/network_image.dart';
import 'package:chimpu_edu_i/pages/teacher/home/home.dart';
/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
  */

import 'package:flutter/material.dart';

import '../../../core/res/assets.dart';

class RegisterTeacherPage extends StatelessWidget {
  static final String path = "lib/pages/login/login.dart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
        padding: const EdgeInsets.all(16.0),
        height: double.infinity,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.lightGreen, Colors.green]))),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(top: 40.0, bottom: 20.0),
                          height: 80,
                          child: PNetworkImage(foodLogo)),
                      Center(
                        child: Text(
                          "Have a nice day".toUpperCase(),
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 80.0),
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(16.0),
                          prefixIcon: Container(
                              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                              margin: const EdgeInsets.only(right: 8.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      bottomLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                      bottomRight: Radius.circular(10.0))),
                              child: Icon(
                                Icons.person,
                                color: Colors.lightGreen,
                              )),
                          hintText: "First name",
                          hintStyle: TextStyle(color: Colors.white54),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.1),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(16.0),
                          prefixIcon: Container(
                              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                              margin: const EdgeInsets.only(right: 8.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      bottomLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                      bottomRight: Radius.circular(10.0))),
                              child: Icon(
                                Icons.person,
                                color: Colors.lightGreen,
                              )),
                          hintText: "Last name",
                          hintStyle: TextStyle(color: Colors.white54),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.1),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(16.0),
                          prefixIcon: Container(
                              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                              margin: const EdgeInsets.only(right: 8.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      bottomLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                      bottomRight: Radius.circular(10.0))),
                              child: Icon(
                                Icons.person,
                                color: Colors.lightGreen,
                              )),
                          hintText: "Username",
                          hintStyle: TextStyle(color: Colors.white54),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.1),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(16.0),
                          prefixIcon: Container(
                              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                              margin: const EdgeInsets.only(right: 8.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      bottomLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                      bottomRight: Radius.circular(10.0))),
                              child: Icon(
                                Icons.lock,
                                color: Colors.lightGreen,
                              )),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white54),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.1),
                        ),
                        obscureText: true,
                      ),

                      SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(16.0),
                          prefixIcon: Container(
                              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                              margin: const EdgeInsets.only(right: 8.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      bottomLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                      bottomRight: Radius.circular(10.0))),
                              child: Icon(
                                Icons.lock,
                                color: Colors.lightGreen,
                              )),
                          hintText: "Re password",
                          hintStyle: TextStyle(color: Colors.white54),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.1),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 30.0),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          color: Colors.white,
                          textColor: Colors.lightGreen,
                          padding: const EdgeInsets.all(20.0),
                          child: Text("Sign up".toUpperCase()),
                          onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => HomePage(),
                                )),
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                      ),
                      //Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            textColor: Colors.white70,
                            child: Text("Already have an account? Login"),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => RegisterTeacherPage(),
                                )),
                          ),
                          
                        ],
                      ),
                      SizedBox(height: 10.0),
                    ],                              
              ),
            ),
          ),
        ],
      ),
    );
  }
}
