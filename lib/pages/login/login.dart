import 'package:chimpu_edu_i/authentication/bloc/authentication.dart';
import 'package:chimpu_edu_i/pages/login/login_form.dart';
import 'package:chimpu_edu_i/services/authenticate.dart';
/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
  */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';


class LoginPage extends StatelessWidget {
  static final String path = "lib/pages/login/login.dart";
  final AuthenticateService authenticateService;
  LoginPage({Key key, @required this.authenticateService})
      : assert(authenticateService != null),
        super(key: key);

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
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
              authenticateService: authenticateService,
            );
          },
          child: LoginForm(),
        ),
      ),
    );
  }
}
