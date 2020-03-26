import 'package:chimpu_edu_i/pages/blocs/main/bloc/main_bloc.dart';
import 'package:chimpu_edu_i/pages/login/login_form.dart';
/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
  */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';


class LoginPage extends StatelessWidget {
  static final String path = "lib/pages/login/login.dart";
  final int accountType;
  LoginPage({@required this.accountType,  key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        height: double.infinity,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.lightGreen, Colors.green])),
          child: BlocProvider(
          create: (context) {
            return LoginBloc(
              mainBloc: BlocProvider.of<MainBloc>(context),
            );
          },
          child: LoginForm(accountType: accountType,),
        ),
      ),
    );
  }
}
