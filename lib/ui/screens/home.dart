import 'package:flutter/material.dart';
import 'package:world_cup_2022/ui/managers/match_manager.dart';
import '../widgets/card_nation.dart';
import '../shared/drawer.dart';
import 'package:provider/provider.dart';
enum FilterOptions {favorites, all}
class MyHomePage extends StatefulWidget {
  static const routeName = '/home';

  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _showOnlyFavorites = ValueNotifier<bool>(false);
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
        actions: <Widget>[
          buildProductFilterMenu(),
        ],
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(  
        future: _fetchMatchs,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return ValueListenableBuilder<bool>(
              valueListenable: _showOnlyFavorites,
              builder: (ctx, onlyFollow, child){
                  if(onlyFollow){
                    return Container(  
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://i.pinimg.com/originals/ee/3f/c2/ee3fc2bbd8a5425f4b1c3500f925f21d.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Consumer<MatchManager>(  
                        builder: (context, matchManager, child) => ListView.builder(
                          itemCount: matchManager.favoriteItems.length,
                          itemBuilder: (BuildContext context, int index){
                            return CardNation(matchManager.favoriteItems[index]);
                          },
                        ),
                      )
                    );
                  }else{
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
                  
              }
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildProductFilterMenu(){
    return PopupMenuButton(
      onSelected: (FilterOptions selectedValue){
        setState(() {
          if(selectedValue == FilterOptions.favorites){
            _showOnlyFavorites.value = true;
          }else{
            _showOnlyFavorites.value = false;
          }
        });
      },
      icon: const Icon(  
        Icons.more_vert
      ),
      itemBuilder: (ctx) => [
        const PopupMenuItem(
          value: FilterOptions.favorites,
          child: Text('Trận đấu theo dõi'),
        ),
        const PopupMenuItem(
          value: FilterOptions.all,
          child: Text('Tất cả trận đấu'),
        )
      ],
    );
  }
}
