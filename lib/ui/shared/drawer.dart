import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthManager>();
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('World Cup 2022'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Trang chủ'),
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
          auth.isAdmin
          ? 
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Quản lý trận đấu'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(AdminMatch.routeName);
            },
          )
          : Text(
            auth.email.toString(),
            style: TextStyle(  
              fontSize: 16
            ),
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
