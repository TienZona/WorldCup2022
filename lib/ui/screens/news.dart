import 'package:flutter/cupertino.dart';
import 'package:world_cup_2022/ui/widgets/card_news.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen ({super.key});

  @override 
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(  
        color: Color.fromARGB(255, 25, 9, 75),
      ),
      child: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return CardNews();
        },
      ),
    );
  }
}