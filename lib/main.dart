import 'package:flutter/material.dart';
import 'package:world_cup_2022/ui/managers/match_manager.dart';
import 'package:world_cup_2022/ui/screens/detail_match.dart';
import 'package:world_cup_2022/ui/screens/edit_match.dart';
import 'package:world_cup_2022/ui/screens/list_nation.dart';
import 'ui/screens.dart';
import 'package:flutter/src/material/dropdown.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2022),
        );
      },
    );
  }
  @override
  
  Widget build(BuildContext context) {
    final match = MatchManager().matchs;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Lich Thi Dau'),
      routes: {
        ListNation.routeName: (context) =>  ListNation(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == DetailMatch.routeName) {
          final matchId = settings.arguments as String;
          return MaterialPageRoute(
            builder: (ctx) {
              return DetailMatch(
                match: MatchManager().findById(matchId),
                title: "App",
              );
            },
          );
        }
        if (settings.name == EditMatch.routeName) {
          // final matchId = settings.arguments as String;
          return MaterialPageRoute(
            builder: (ctx) {
              return EditMatch(
                null
              );
            },
          );
        }
      }
    );
  }
}

