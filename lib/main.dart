import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:world_cup_2022/ui/managers/match_manager.dart';
import 'ui/screens.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthManager(),
        ),
        ChangeNotifierProxyProvider<AuthManager, MatchManager>(
          create: (ctx) => MatchManager(),
          update: (ctx, authManager, matchsmanager){
            matchsmanager!.authToken = authManager.authToken;
            return matchsmanager;
          }
        ),
        ChangeNotifierProvider(create: (ctx) => MatchManager()),
      ],
      child: Consumer<AuthManager>(  
        builder: (context, authManager, child) { 
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              fontFamily: 'Lato',
              primarySwatch: Colors.green,
            ),
            debugShowCheckedModeBanner: false,
            home: authManager.isAuth ?
            const MyHomePage(title: 'Lich Thi Dau'):
            FutureBuilder(
              future: authManager.tryAutoLogin(),
              builder: (ctx, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? const SplashScreen()
                    : const AuthScreen();
              },
            ),
            routes: {
              ListNation.routeName: (context) =>  ListNation(),
              AdminMatch.routeName: (context) =>  AdminMatch(),
            },
            onGenerateRoute: (settings) {
              if (settings.name == DetailMatch.routeName) {
                final matchId = settings.arguments as String;
                return MaterialPageRoute(
                  builder: (ctx) {
                    return DetailMatch(
                      ctx.read<MatchManager>().findById(matchId),
                    );
                  },
                );
              }
              if (settings.name == EditMatch.routeName) {
                final matchId = settings.arguments as String?;
                return MaterialPageRoute(
                  builder: (ctx) {
                    return EditMatch(
                      matchId != null
                      ? ctx.read<MatchManager>().findById(matchId)
                      : null,
                    );
                  },
                );
              }
            }
          );
        }
      )
    );
  }
}

