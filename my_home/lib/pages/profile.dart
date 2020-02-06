import 'package:flutter/material.dart';

import 'models/usuario.dart';
import 'widget/ListTileWidget.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController genreController = TextEditingController();
  var letraUser;

  @override
  void initState() {
    super.initState();
    _dataUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      ListView(
        children: <Widget>[

          iconUser(),
          SizedBox(
            height: 30,
          ),
          ListTileWidget(title: "Nome", subTitle:nameController.text, controller: nameController, keyUser: "name"),

          Divider(),
          ListTileWidget(title: "E-mail", subTitle:emailController.text, controller: emailController, keyUser: "email"),

          Divider(),
          ListTileWidget(title: "Data de aniversário", subTitle:birthdayController.text, controller: birthdayController, keyUser: "birthday"),

          Divider(),
          ListTileWidget(title: "Sexo", subTitle:genreController.text, controller: genreController, keyUser: "genre"),
        ],
      ),
    );
  }

  //Imagem de fundo do topo da tela
  Container iconUser() {
    return
    Container(
      width: 200,
      height: 220,
      alignment: Alignment(0.0, 0.13),
      decoration: BoxDecoration(
        image: new DecorationImage(
          image: AssetImage("assets/bg_profile.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Icon(
        Icons.account_circle,
        size: 80,
        color: Colors.white,
      ),
    );
  }

  Future<void> _dataUser() async{
    Usuario _usuario = Usuario.getInstance();
    nameController.text = _usuario.name;
    emailController.text = _usuario.email;
    birthdayController.text = _usuario.birthday;
    genreController.text =_usuario.genre;
    letraUser = nameController.text[0];
  }

}
