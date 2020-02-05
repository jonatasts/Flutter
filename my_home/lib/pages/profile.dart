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
  GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
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
      RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _dataUser,
        child: ListView(
          children: <Widget>[

            iconUser(),
            SizedBox(
              height: 30,
            ),
            ListTileWidget(title: "Nome", subTitle:nameController.text, refreshIndicatorKey: _refreshIndicatorKey, controller: nameController, keyUser: "name"),

            Divider(),
            ListTileWidget(title: "E-mail", subTitle:emailController.text, refreshIndicatorKey: _refreshIndicatorKey, controller: emailController, keyUser: "email"),

            Divider(),
            ListTileWidget(title: "Data de Aniversário", subTitle:birthdayController.text, refreshIndicatorKey: _refreshIndicatorKey, controller: birthdayController, keyUser: "birthday"),

            Divider(),
            ListTileWidget(title: "Sexo", subTitle:genreController.text, refreshIndicatorKey: _refreshIndicatorKey, controller: genreController, keyUser: "genre"),
          ],
        ),
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

  ListTile _listTile(String titulo, String text){
    return  ListTile(
      title: Text(
        titulo,
        style:_style(),
      ),
      subtitle: Text(
        text == "" ? 'Não informado' : text,
        style:TextStyle(
          fontSize: 18,
          color: Colors.black54
        ),
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.edit,
        ),
        onPressed:() async{
          //keySP == "birthday"? dataPicker(context): displayDialog(context);
        },
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

  Future<void> _dataUser() async{
    Usuario _usuario = Usuario.getInstance();
    nameController.text = _usuario.name;
    emailController.text = _usuario.email;
    birthdayController.text = _usuario.birthday;
    genreController.text =_usuario.genre;
    letraUser = nameController.text[0];
  }
  /*
  CircleAvatar(
  radius: 40,
  backgroundColor:  Color(0xffffffff),
  child: Text(_usuario.name[0],
  style: TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
  color: Colors.black,
),
)
);
*/

}
