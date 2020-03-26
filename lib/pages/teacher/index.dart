import 'package:chimpu_edu_i/data/model/user.dart';
import 'package:chimpu_edu_i/pages/blocs/main/bloc/main_bloc.dart';
import 'package:chimpu_edu_i/pages/login/login.dart';
import 'package:chimpu_edu_i/pages/teacher/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with TickerProviderStateMixin {
  static final String path = "lib/pages/teacher/home/home.dart";
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state is AppReady) {
          return NavigationScreen();
        }
        if (state is Unauthenticated) {
          return LoginPage(accountType: UserAccountType.getValue(AccountType.teacher));
        }
        return Container();
      }
    );
  }
}