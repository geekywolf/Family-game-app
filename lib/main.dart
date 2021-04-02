import 'package:flutter/material.dart';

import 'Pages/KMK.dart';
import 'Pages/charades.dart';
import 'mainscreen.dart';
import 'Pages/mysterywrd.dart';
import 'Pages/neverhavei.dart';
import 'Pages/riddles.dart';
import 'Pages/truthordare.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Hub',
      debugShowCheckedModeBanner: false,
      initialRoute: 'first_screen',
      routes: {
        'first_screen': (context) => Homescreen(),
        'Charades': (context) => Charades(),
        "Never Have I Ever": (context) => NeverHaveIEver(),
        "Truth or Dare": (context) => TruthorDare(),
        "Kiss,Marry,Kill": (context) => KissMaryKill(),
        "Mystery Word": (context) => MysteryWord(),
        "Riddles": (context) => Riddles(),
      },
    );
  }
}
