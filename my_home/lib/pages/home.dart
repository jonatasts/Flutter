import 'package:flutter/material.dart';

import 'models/usuario.dart';
import 'profile.dart';
import 'login.dart';

class Home extends StatefulWidget {
  final selectDrawerItem;

  const Home(this.selectDrawerItem);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Usuario _usuario = Usuario.getInstance();
  int _selectDrawerItem = -1;

  _getPageDrawerItem(int pos) {
    switch (pos) {
      case 0:
      return _buildBackgroundImage();
      break;

      case 1:
      return Profile();
      break;

      case 2:
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

  @override
  Widget build(BuildContext context) {
    if(_selectDrawerItem == -1){
      _selectDrawerItem = widget.selectDrawerItem;
    }
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
              accountName: Text(_usuario.name),
              accountEmail: Text(_usuario.email),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white70,
                child: Text(
                  _usuario.name[0],
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              selected: (0 == _selectDrawerItem),
              onTap: () {
                _onSelectedItem(0);
              },
            ),
            ListTile(
              title: Text("Perfil"),
              leading: Icon(Icons.account_circle),
              selected: (1 == _selectDrawerItem),
              onTap: () {
                _onSelectedItem(1);
              },
            ),
            ListTile(
              title: Text("Sobre"),
              leading: Icon(Icons.info),
              selected: (2 == _selectDrawerItem),
              onTap: () {
                _onSelectedItem(2);
              },
            ),
            Divider(),
            ListTile(
              title: Text("Sair"),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => Login(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body:
      _getPageDrawerItem(_selectDrawerItem),
    );
  }

  _buildBackgroundImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/bg_home.jpg'),
        ),
      ),
    );
  }

  _sobre() {
    return Center(
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top:40, left:15, right: 15),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "What is My Home?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:40, left:15, right: 15),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black45,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
