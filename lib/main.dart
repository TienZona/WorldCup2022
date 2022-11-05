import 'package:flutter/material.dart';
import 'package:world_cup_2022/ui/screens/detail_match.dart';
import 'ui/screens.dart';
import './models/Match.dart';
import './ui/managers/nation_manager.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    final match = NationManager().matchs;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const DetailMatch(),
    );
  }
}

