import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('xyz'),
            accountEmail: Text('@xyz'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('xyz'),
            ),
          ),
          ListTile(
            title: Text('Perfil'),
            leading: Icon(Icons.account_box_rounded),
          ),
          ListTile(
            title: Text('Listas'),
            leading: Icon(Icons.list),
          ),
          ListTile(
            title: Text('Temas'),
            leading: Icon(Icons.bubble_chart),
          ),
          ListTile(
            title: Text('Elementos Guardados'),
            leading: Icon(Icons.save),
          ),
          ListTile(
            title: Text('Momentos'),
            leading: Icon(Icons.animation),
          ),
          Divider(height: 0.1),
          ListTile(
            title: Text('Confifuracion de privacidad'),
          ),
          ListTile(
            title: Text('Centro de ayuda'),
          ),
          Divider(height: 0.5),
          ListTile(
            leading: Icon(Icons.highlight),
            trailing: Icon(Icons.qr_code_rounded),
          )
        ],
      ),
    );
  }
}
