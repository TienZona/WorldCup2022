import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_cup_2022/models/nation.dart';
import 'package:world_cup_2022/ui/managers/match_manager.dart';
import 'package:world_cup_2022/ui/managers/nation_manager.dart';
import 'package:world_cup_2022/ui/screens/detail_match.dart';
import '../../models/match.dart';

class CardNation extends StatelessWidget {
  const CardNation(
    this.match, {
      super.key,
    }
  );

  final Match match;

  @override
  Widget build(BuildContext context) {
    final Nation nation1 = NationManager().findById(match.t1_name);
    final Nation nation2 = NationManager().findById(match.t2_name);

    return  GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          DetailMatch.routeName,
          arguments: match.id,
        );
      },
      child: SizedBox(  
        height: 150,
        child: Card(
          color: Color.fromARGB(255, 5, 62, 62),
          margin: EdgeInsets.all(20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(75.0),
            side: const BorderSide(
              color: Color.fromARGB(255, 42, 114, 125),
              width: 2.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              Column(
                children:  <Widget>[
                  Card(
                    color: Color.fromARGB(255, 237, 240, 240),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: const BorderSide(
                        color: Color.fromARGB(255, 13, 13, 13),
                        width: 2.0,
                      ),
                    ),
                    
                    child: SizedBox(  
                      width: 100,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: NetworkImage(nation1.imgURL),
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            nation1.name,
                          )
                        ],
                      ),
                      
                    )
                  ),
                ]
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),

                child: Column(
                  children: [
                    Text(
                      '${match.date}',
                      style: const TextStyle(  
                        color: Colors.white,
                        fontSize: 16
                      ),
                    ),
                    Spacer(flex: 2),
                    Text(
                      '${match.time}',
                      style: const TextStyle(  
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '${match.t1_goal}' +' : ' + '${match.t2_goal}',
                      style: const TextStyle(  
                        color: Colors.white,
                        fontSize: 24
                      ),
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: match.isFollowListenable,
                      builder: (ctx, isFavorite, child) {
                        return SizedBox(
                          height: 20,
                          child: IconButton(  
                            icon: Icon(  
                              isFavorite ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
                            ),
                            color: Colors.white,
                            onPressed: () {
                                ctx.read<MatchManager>().toggleFavoriteStatus(match);
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Column(
                children:  <Widget>[
                  Card(
                    color: Color.fromARGB(255, 237, 240, 240),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: const BorderSide(
                        color: Color.fromARGB(255, 13, 13, 13),
                        width: 2.0,
                      ),
                    ),
                    
                    child: SizedBox(  
                      width: 100,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: NetworkImage(nation2.imgURL),
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            nation2.name,
                          )
                        ],
                      ),
                      
                    )
                  ),
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}