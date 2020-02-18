import 'package:chimpu_edu_i/authentication/bloc/authentication.dart';
import 'package:chimpu_edu_i/common/loading_indicator.dart';
import 'package:chimpu_edu_i/pages/login/login.dart';
import 'package:chimpu_edu_i/pages/teacher/navigation_screen.dart';
import 'package:chimpu_edu_i/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with TickerProviderStateMixin {
  static final String path = "lib/pages/teacher/home/home.dart";
  UserRepository userRepository;
  @override
  void initState() {
    userRepository = new UserRepository();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AppStarted());
      },
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            return NavigationScreen();
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginPage(userRepository: userRepository);
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }}
        ),
    );
  }
}