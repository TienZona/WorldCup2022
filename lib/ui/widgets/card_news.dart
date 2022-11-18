import 'package:flutter/material.dart';

class CardNews extends StatelessWidget {
  CardNews ({super.key});

  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: Center(
        child: SizedBox(
          width: 500,
          height: 130,
          child: Card(
            child: Row(  
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,  
                      children: [
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          strutStyle: StrutStyle(fontSize: 12.0),
                          maxLines: 1,
                          text: const TextSpan(
                              style: TextStyle(
                                color: Color.fromARGB(255, 27, 66, 225),
                                fontSize: 18,
                              ),
                              text: 'Hình ảnh khác lạ của Son Heung Min ở đội tuyển Hàn Quốc'
                          ),
                        ),
                        const Spacer(),
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          strutStyle: StrutStyle(fontSize: 12.0),
                          maxLines: 2, 
                          text: const TextSpan(
                              style: TextStyle(color: Colors.black, height: 1.3),
                              text: 'Son Heung Min lần đầu tiên lộ diện với một chiếc mặt nạ đeo ở mặt trong buổi tập luyện cùng các đồng đội của tuyển Hàn Quốc trước thềm World Cup 2022 ở Qatar.'),
                        ),
                        const Spacer(),
                        Text('Thứ năm, 17/11/2022 - 06:30'),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Image(  
                    image: NetworkImage('https://kenh14cdn.com/thumb_w/620/203336854389633024/2022/11/17/photo-2-166864605165246369067.jpg'),
              
                    fit: BoxFit.contain,
                  )
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}