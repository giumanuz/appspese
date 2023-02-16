import 'package:flutter/material.dart';
import 'package:appspese/screens/home_screen.dart';
import 'package:appspese/screens/personalPayment.dart';
import 'package:appspese/screens/settings.dart';
import 'package:appspese/screens/totalPayment.dart';
import 'package:appspese/screens/adjustPayment.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => HomeScreen(),
      '/settings': (context) => Settings(),
      '/personalPayment': (context) => PersonalPayment(),
      '/totalPayment': (context) => TotalPayment(),
      '/adjustPayment': (context) => AdjustPayment(),
    },
  ));
}
