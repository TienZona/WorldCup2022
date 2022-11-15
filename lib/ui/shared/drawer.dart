import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_cup_2022/ui/screens/edit_match.dart';
import 'package:world_cup_2022/ui/screens/list_nation.dart';
import '../screens.dart';
import '../screens/list_match.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('World Cup 2022'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.list_alt_sharp),
            title: const Text('Lịch thi đấu'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.flag_outlined),
            title: const Text('Đội tuyển'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ListNation.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Quản lý trận đấu'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(AdminMatch.routeName);
            },
          ),
          const Divider(),
          ListTile(  
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap:  () {
              Navigator.of(context)
                ..pop()
                ..pushReplacementNamed('/');
              context.read<AuthManager>().logout();
            },
          ),
        ],
      ),
    );
  }
}
