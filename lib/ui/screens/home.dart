import 'package:flutter/material.dart';
import 'package:world_cup_2022/ui/managers/match_manager.dart';
import '../widgets/card_nation.dart';
import '../shared/drawer.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/home';

  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<void> _fetchMatchs;
  @override 
  void initState(){
    super.initState();
    _fetchMatchs = context.read<MatchManager>().fetchMatchs();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.title,
          ),       
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(  
        future: _fetchMatchs,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Container(  
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://i.pinimg.com/originals/ee/3f/c2/ee3fc2bbd8a5425f4b1c3500f925f21d.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Consumer<MatchManager>(  
                builder: (context, matchManager, child) => ListView.builder(
                  itemCount: matchManager.itemCount,
                  itemBuilder: (BuildContext context, int index){
                    return CardNation(matchManager.matchs[index]);
                  },
                ),
              )
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
