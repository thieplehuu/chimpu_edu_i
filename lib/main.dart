
import 'package:flutter/material.dart';

import 'pages/top/top.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter UIs',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.grey.shade300,
              primarySwatch: Colors.red,
              accentColor: Colors.indigo,
            ),
            home: TopPage(),
            routes: {
              "home": (_) => TopPage(),
            },
          );
  }
}
