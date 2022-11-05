import 'package:flutter/material.dart';
import 'package:world_cup_2022/models/Nation.dart';
import '../widgets/cart_nation.dart';
import '../managers/nation_manager.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final nationManager = NationManager();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
          ),
        ),        
      ),
      body: Container(  
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://i.pinimg.com/originals/ee/3f/c2/ee3fc2bbd8a5425f4b1c3500f925f21d.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: nationManager.itemCount,
          itemBuilder: (BuildContext context, int index){
            final id1 = nationManager.matchs.id_team_1;
            final id2 = nationManager.matchs.id_team_2;
            final nation1 = nationManager.getNation(id1);
            final nation2 = nationManager.getNation(id2);
            return CardNation(
              nation1: Nation(id: nation1.id, name: nation1.name, logo: nation1.logo), 
              nation2: Nation(id: nation2.id, name: nation2.name, logo: nation2.logo),
              date: nationManager.matchs.date,
              time: nationManager.matchs.time,
              team1: nationManager.matchs.team1,
              team2: nationManager.matchs.team2,
            );
          },
        ),
      ),
    );
  }
}
