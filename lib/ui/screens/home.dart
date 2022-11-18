import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_cup_2022/ui/screens.dart';
import 'package:world_cup_2022/ui/screens/news.dart';
import '../managers/match_manager.dart';
import '../shared/drawer.dart';
import '../widgets.dart';

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
  int _selectedIndex = 1;
  String titlePage = '';
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    NewsScreen(),
    MatchSchedule(),
    RatingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
   
  }

  static const listTitle = [
    'Tin Tức',
    'Lịch Thi đấu',
    'Bảng Xếp Hạng',
    'Thống Kê'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(listTitle[_selectedIndex]),
      actions: [
        _selectedIndex == 1 ? buildProductFilterMenu(): const SizedBox(),
      ],
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: 
        _selectedIndex == 1 ?
        FutureBuilder(  
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
                        child: Column(  
                          children: [
                            buildProductFilterMenu(),
                            Consumer<MatchManager>(  
                              builder: (context, matchManager, child) => ListView.builder(
                                shrinkWrap: true,
                                itemCount: matchManager.favoriteItems.length,
                                itemBuilder: (BuildContext context, int index){
                                  return CardNation(matchManager.favoriteItems[index]);
                                },
                              ),
                            )
                          ],
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
        )
        :_widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Tin Tức',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_sharp),
            label: 'Lịch Thi Đấu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Bản Xếp Hạng',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 44, 77, 195),
        onTap: _onItemTapped,
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
