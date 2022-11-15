import 'package:flutter/material.dart';
import 'package:world_cup_2022/ui/managers/nation_manager.dart';
import 'package:provider/provider.dart';
import '../shared/drawer.dart';
import '../widgets/card_nation_2.dart';


class ListNation extends StatelessWidget {
  static const routeName = '/list-nation';
  ListNation({super.key});

  final Nations = NationManager();

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh Sách Các Đội'),
      ),
      drawer: const AppDrawer(),
      body: Container(  
        decoration: new BoxDecoration(color: Color.fromARGB(255, 14, 53, 95)),
        child: GridView.builder(  
          padding: const EdgeInsets.all(20.0),
          itemCount: Nations.itemCount,
          itemBuilder: (ctx, i) => CardNation2(nation: Nations.nations[i]),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30
          ),
        ),
      )
      
      
    );
  }

}