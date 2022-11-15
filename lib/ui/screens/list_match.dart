import 'package:flutter/material.dart';
import 'package:world_cup_2022/models/nation.dart';
import 'package:provider/provider.dart';
import 'package:world_cup_2022/ui/managers/match_manager.dart';
import 'package:world_cup_2022/ui/managers/nation_manager.dart';
import 'package:world_cup_2022/ui/screens/edit_match.dart';
import '../screens.dart';
import '../shared/drawer.dart';
import '../../models/match.dart';


class AdminMatch extends StatelessWidget {
  static const routeName = '/admin-matchs';
  const AdminMatch({super.key});


  Future<void> _refreshMatchs(BuildContext context) async {
    await context.read<MatchManager>().fetchMatchs(true);
  }

  @override

  Widget build(BuildContext context){
    final matchMangers = MatchManager();
    return Scaffold(
      appBar: AppBar(  
        title: const Text('Danh sách các trận đấu'),
        actions: <Widget>[
          buildAddButton(context),
        ],
      ),
      drawer: const AppDrawer(),
      // body: buildAdminMatchListView(matchs)
      body: FutureBuilder(  
        future: _refreshMatchs(context),
        builder: (ctx, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(  
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(  
            onRefresh: () => _refreshMatchs(context),
            child: buildAdminMatchListView(matchMangers.matchs),
          );
        },
      )
      
    );
  }

  Widget buildAdminMatchListView(List<Match> matchs){
    return Consumer<MatchManager>(
      builder:(context, matchManger, child) {
        return ListView.builder(  
            itemCount: matchManger.itemCount,
            itemBuilder: (context, index) => Card( 
              child: Padding(  
                padding: EdgeInsets.all(10),
                child: Row(  
                  children: [
                    Expanded(
                      flex: 7,
                      child: Column(
                        children: [
                          Row(  
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(matchManger.matchs[index].date),
                              const SizedBox(width: 20),
                              Text(matchManger.matchs[index].time)
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(  
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              buildNationItem(matchManger.matchs[index].t1_name),
                              const Text('vs'),
                              buildNationItem(matchManger.matchs[index].t2_name),
                              
                            ],
                            
                          ),
                        
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                          children: [
                            SizedBox(
                              width: 120,
                              child: Row(
                                children: [
                                  buildEditButton(context, matchManger.matchs[index].id),
                                  buildDeleteButton(context, matchManger.matchs[index].id)
                                ],
                              ),
                            ),
                          ],
                        ),
                    )
                    
                  ],
                ),
              ),
            )
          );
      },
    );
  }

  Widget buildNationItem(String id){
    Nation nation = NationManager().findById(id);
    return SizedBox(
      width: 120,
      child: Column(  
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(image: 
            NetworkImage(nation.imgURL),
            width: 30,
            height: 30,
          ),
          Text(nation.name)
        ],
      ),
    );
  }

  Widget buildAddButton(BuildContext context){
    return IconButton(  
      icon: const Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).pushNamed(
          EditMatch.routeName
        );
      },
    );
  }

  Widget buildEditButton(BuildContext context, String? id){
    return IconButton(  
      icon: const Icon(Icons.edit),
      onPressed: ()  {
        Navigator.of(context).pushNamed(  
          EditMatch.routeName,
          arguments: id
        );
      },
      color: Theme.of(context).primaryColor,
    );
  }

  Widget buildDeleteButton(BuildContext context, String? id){
    return IconButton(  
      icon: const Icon(Icons.delete),
      onPressed: () async {
        context.read<MatchManager>().deleteMatch(id!);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text(  
                'Match deleted',
                textAlign: TextAlign.center,
              ),
            )
          );
      },
      color: Theme.of(context).errorColor,
    );
  }
}