import 'package:flutter/foundation.dart';
import '../../models/nation.dart';



class NationManager with ChangeNotifier {
  List<Nation> _nation = [];


  int get itemCount {
    return nations.length;
  }

  List<Nation> get nations {
    return [
      Nation(name: 'Qatar', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/h0FNA5YxLzWChHS5K0o4gw_96x96.png'),
      Nation(name: 'Ecuador', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/AKqvkBpIyr-iLOK7Ig7-yQ_96x96.png'),
      Nation(name: 'Anh', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/DTqIL8Ba3KIuxGkpXw5ayA_96x96.png'),
      Nation(name: 'Iran', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/1oq8Fy7ETpBpZNaCA22ArQ_96x96.png'),
      Nation(name: 'Sénéganl', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/zw3ac5sIbH4DS6zP5auOkQ_96x96.png'),
      Nation(name: 'Hà Lan', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/8GEqzfLegwFFpe6X2BODTg_96x96.png'),
      Nation(name: 'Hoa kỳ', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/wj9uZvn_vZrelLFGH8fnPA_96x96.png'),
      Nation(name: 'Wales', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/1JjnDm6Es30LryHzbudyEw_96x96.png'),
      Nation(name: 'Argentina', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/1xBWyjjkA6vEWopPK3lIPA_96x96.png'),
      Nation(name: 'Ả rập xê út', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/QoAJxO46fHid3_T-7nRZ0Q_96x96.png'),
      Nation(name: 'Đan mạch', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/LaOvu-pyRqRso6uzff55XA_96x96.png'),
      Nation(name: 'Tunisia', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/Xs33c9XVUJBX0IkeFn_bIw_96x96.png'),
      Nation(name: 'Mexico', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/yJF9xqmUGenD8108FJbg9A_96x96.png'),
      Nation(name: 'Ba Lan', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/yTS_Piy3M1wUBnqU0n5aAw_96x96.png'),
      Nation(name: 'Pháp', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/z3JEQB3coEAGLCJBEUzQ2A_96x96.png'),
      Nation(name: 'Úc', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/jSgw5z0EPOLzdUi-Aomq7Q_96x96.png'),
      Nation(name: 'Maroc', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/I3gt2Ew39ux3GGdZ-4JE3g_96x96.png'),
      Nation(name: 'Croatia', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/9toerdOg8xW4CRhDaZxsyw_96x96.png'),
      Nation(name: 'Đức', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/h1FhPLmDg9AHXzhygqvVPg_96x96.png'),
      Nation(name: 'Nhật Bản', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/by4OltvtZz7taxuQtkiP3A_96x96.png'),
      Nation(name: 'Đức', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/h1FhPLmDg9AHXzhygqvVPg_96x96.png'),
      Nation(name: 'Tây Ban Nha', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/5hLkf7KFHhmpaiOJQv8LmA_96x96.png'),
      Nation(name: 'Costa Rica', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/ixZiM5pj2IvvYc15k-zfeQ_96x96.png'),
      Nation(name: 'Bỉ', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/6SF7yEoB60bU5knw-M7R5Q_96x96.png'),
      Nation(name: 'Canada', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/H23oIEP6qK-zNc3O8abnIA_96x96.png'),
      Nation(name: 'Thụy Sĩ', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/1hy9ek4dOIffYULM6k1fqg_96x96.png'),
      Nation(name: 'Cameroon', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/fmHyTSbJ-cYbY6WJzvqaZQ_96x96.png'),
      Nation(name: 'Canada', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/fmHyTSbJ-cYbY6WJzvqaZQ_96x96.png'),
      Nation(name: 'Canada', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/H23oIEP6qK-zNc3O8abnIA_96x96.png'),
      Nation(name: 'Canada', imgURL: 'https://ssl.gstatic.com/onebox/media/sports/logos/H23oIEP6qK-zNc3O8abnIA_96x96.png'),



    ];
  }

  Nation findById(String name){
    return nations.firstWhere((prod) => prod.name == name);
  }
}