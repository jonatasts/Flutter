import 'package:flutter/material.dart';

import 'edit_profile.dart';
import 'models/usuario.dart';

class Profile extends StatelessWidget {
  Usuario _usuario = Usuario.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[

          iconUser(),
          SizedBox(
            height: 30,
          ),
          _listTile("Nome", _usuario.name),
          SizedBox(
            height: 5,
          ),
          Divider(),
          _listTile("E-mail", _usuario.email),
          SizedBox(
            height: 5,
          ),
          Divider(),
          _listTile("Data de Aniversário", _usuario.birthday),
          SizedBox(
            height: 5,
          ),
          Divider(),
          _listTile("Gênero", _usuario.genre),
          SizedBox(
            height: 5,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.edit),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditProfile(),
            ),
          );
        },
      ),
    );
  }

  //Imagem de fundo do topo da tela
  iconUser() {
    return
    Container(
      width: 200,
      height: 200,
      alignment: Alignment(0.0, 0.13),
      decoration: BoxDecoration(
        image: new DecorationImage(
          image: AssetImage("assets/bg_profile.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child : CircleAvatar(
        radius: 40,
        backgroundColor:  Color(0xffffffff),
        child: Text(_usuario.name[0],
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        )
      ),
    );
  }

  _listTile(String titulo, String text){
    return  ListTile(
      title: Text(
        titulo,
        style:_style(),
      ),
      subtitle: Text(
        text == null ? 'Não informado' : text,
        style:TextStyle(
          fontSize: 18,
          color: Colors.black54
        ),
      ),
    );
  }

  TextStyle _style(){
    return TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
  }

}
