import 'package:flutter/material.dart';
import 'package:world_cup_2022/models/Nation.dart';
import 'package:world_cup_2022/ui/managers/match_manager.dart';
import '../widgets/card_nation.dart';
import '../../models/Match.dart';
import '../../models/Stats.dart';
import '../managers/nation_manager.dart';
import '../shared/drawer.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/home';

  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final matchManager = MatchManager();
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.title,
          ),       
      ),
      drawer: const AppDrawer(),
      body: Container(  
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://i.pinimg.com/originals/ee/3f/c2/ee3fc2bbd8a5425f4b1c3500f925f21d.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: matchManager.itemCount,
          itemBuilder: (BuildContext context, int index){
            return CardNation(matchManager.matchs[index]);
          },
        ),
      ),
    );
  }
}
