import 'package:flutter/material.dart';

import 'bottom_tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.purple[700], accentColor: Colors.white),
        home: BottomNav());
  }
}
