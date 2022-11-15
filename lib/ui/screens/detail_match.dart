import 'package:flutter/material.dart';
import 'package:world_cup_2022/ui/managers/nation_manager.dart';
import '../../models/match.dart';
import 'package:provider/provider.dart';

class DetailMatch extends StatelessWidget {
  static const routeName = '/detail_match';

  const DetailMatch(
    this.match,{
      super.key,
    }
  );


  final Match match;

  @override 
  Widget build(BuildContext context){

    return Scaffold( 
      appBar: AppBar(  
        title: const Text('World Cup 2022'),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(Icons.edit),
        //     onPressed: null,
        //   )
        // ],
      ),
      body:  TopCard(match),
    );
  } 

  Widget TopCard(Match match){
    final nation1 = NationManager().findById(match.t1_name);
    final nation2 = NationManager().findById(match.t2_name);

    return Card(
      margin: EdgeInsets.all(16.0),
      child: SizedBox(
        height: 500,
        child: Padding(  
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row( 
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 120,
                        child: Column(
                          children: [
                            Image(
                              image: NetworkImage(nation1.imgURL),
                              width: 50,
                              height: 50,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              nation1.name,
                              style: TextStyle( 
                                fontSize: 16
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(match.date),
                      SizedBox(height: 10),
                      Text(match.time),
                      SizedBox(height: 10),
                      Text(
                        '${match.t1_goal}   -   ${match.t2_goal}',
                        style: TextStyle(  
                          fontSize: 28
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 120,
                        child: Column(
                          children: [
                            Image(
                              image: NetworkImage(nation2.imgURL),
                              width: 50,
                              height: 50,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              nation2.name,
                              style: TextStyle( 
                                fontSize: 16
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Divider(  
                height: 40,
                color: Colors.black,
                indent: 30,
                endIndent: 30,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'TEAM STATS',
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${match.t1_shot}'),
                        Text('Số lần sút'),
                        Text('${match.t2_shot}'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${match.t1_onTarget}'),
                        Text('Sút trúng đích'),
                        Text('${match.t2_onTarget}'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${match.t1_possession}%'),
                        Text('Kiểm soát bóng'),
                        Text('${match.t2_possession}%'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${match.t1_foul}'),
                        Text('Phạm lỗi'),
                        Text('${match.t2_foul}'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${match.t1_yellowCard}'),
                        Text('Thẻ vàng'),
                        Text('${match.t2_redCard}'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${match.t1_redCard}'),
                        Text('Thẻ đỏ'),
                        Text('${match.t2_redCard}'),
                      ],
                    )
                  ],
                ),
              )
              
            ],
          )
        ),
      )
    );
  }

}