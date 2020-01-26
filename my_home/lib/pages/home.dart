import 'package:flutter/material.dart';

import 'editar_perfil.dart';
import 'login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectDrawerItem = 1;

  _getPageDrawerItem(int pos) {
    switch (pos) {
      case 0:
        return EditProfile();
        break;
      case 1:
        return _sobre();
        break;
    }
  }

  _onSelectedItem(int pos) {
    Navigator.of(context).pop();
    setState(() {
      _selectDrawerItem = pos;
    });
  }

  _sobre() {
    return Center(
      child: Container(
        child: Text(
          "Bem Vindo ao\n My Home ! \n\n O app que gerencia seu condiminio !!!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            color: Colors.green,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Home",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              accountName: Text("Usuario"),
              accountEmail: Text("novo.usuario@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white70,
                child: Text(
                  "N",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text("Perfil"),
              leading: Icon(Icons.account_circle),
              selected: (0 == _selectDrawerItem),
              onTap: () {
                _onSelectedItem(0);
              },
            ),
            ListTile(
              title: Text("Sobre"),
              leading: Icon(Icons.info),
              selected: (1 == _selectDrawerItem),
              onTap: () {
                _onSelectedItem(1);
              },
            ),
            Divider(),
            ListTile(
              title: Text("Sair"),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
              },
            ),
          ],
        ),
      ),
      body: _getPageDrawerItem(_selectDrawerItem),
    );
  }
}
