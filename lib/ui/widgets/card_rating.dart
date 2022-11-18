import 'package:flutter/material.dart';

class CardRating extends StatelessWidget {
  const CardRating ({super.key});


  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: Center(
        child: SizedBox(
          width: 500,
          height: 280,
          child: Card(
            child: Padding(  
              padding: EdgeInsets.all(16),
              child: Column(  
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Bảng A',
                    style: TextStyle(  
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text('Đội'),
                      ),
                      Text('ĐĐ'),
                      Text('Thắng'),
                      Text('H'),
                      Text('Thua'),
                      Text('HS'),
                      Text('Đ'),

                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Row(  
                          children: [
                            const Text('1'),
                            const SizedBox(width: 10),
                            const Image(
                              image: NetworkImage('https://ssl.gstatic.com/onebox/media/sports/logos/h0FNA5YxLzWChHS5K0o4gw_48x48.png'),
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 10),
                            const Text('Qatar')

                          ],
                        ),
                      ),
                      Text('0'),
                      Text('0'),
                      Text('0'),
                      Text('0'),
                      Text('0'),
                      Text('0'),

                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Row(  
                          children: [
                            const Text('2'),
                            const SizedBox(width: 10),
                            const Image(
                              image: NetworkImage('https://ssl.gstatic.com/onebox/media/sports/logos/AKqvkBpIyr-iLOK7Ig7-yQ_48x48.png'),
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 10),
                            const Text('Ecuador')

                          ],
                        ),
                      ),
                      Text('0'),
                      Text('0'),
                      Text('0'),
                      Text('0'),
                      Text('0'),
                      Text('0'),

                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Row(  
                          children: [
                            const Text('3'),
                            const SizedBox(width: 10),
                            const Image(
                              image: NetworkImage('https://ssl.gstatic.com/onebox/media/sports/logos/zw3ac5sIbH4DS6zP5auOkQ_48x48.png'),
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 10),
                            const Text('Sénégal')

                          ],
                        ),
                      ),
                      Text('0'),
                      Text('0'),
                      Text('0'),
                      Text('0'),
                      Text('0'),
                      Text('0'),

                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Row(  
                          children: [
                            const Text('4'),
                            const SizedBox(width: 10),
                            const Image(
                              image: NetworkImage('https://ssl.gstatic.com/onebox/media/sports/logos/8GEqzfLegwFFpe6X2BODTg_48x48.png'),
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 10),
                            const Text('Hà Lan')

                          ],
                        ),
                      ),
                      Text('0'),
                      Text('0'),
                      Text('0'),
                      Text('0'),
                      Text('0'),
                      Text('0'),

                    ],
                  ),
                ],
                
              ),
            )
          )
        ),
      ),
    );
  }
}