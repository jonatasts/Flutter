import 'package:flutter/material.dart';
import 'package:my_home/pages/api_rest/edit_profile_api.dart';
import 'package:my_home/pages/models/usuario.dart';
import 'package:toast/toast.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

import '../profile.dart';

class ListTileWidget extends StatelessWidget{
  final String title;
  final String subTitle;
  final String keyUser;
  final TextEditingController controller;
  String genre;

  DateTime _dateTime;
  DateTimePickerLocale _locale = DateTimePickerLocale.pt_br;

  ListTileWidget({@required this.title, @required this.subTitle, @required this.controller, @required this.keyUser});

  TextStyle _style(){
    return TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title.isEmpty? 'Null' : title, style: _style(),),
      subtitle: Text(subTitle.isEmpty? 'Não informado':subTitle, style:TextStyle(fontSize: 18, color: Colors.black54) ,),
      trailing: IconButton(
        icon: Icon(
          Icons.edit,
        ),
        onPressed:() async{
          keyUser == "birthday"? dataPicker(context): displayDialog(context);
        },
      ),
    );
  }

  displayDialog(BuildContext context){
    AlertDialog alertDialog= AlertDialog(
      title: Text(title.isEmpty? 'Null':title),
      content: keyUser == "genre"? genreChoose():TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: title,
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Salvar'),
          onPressed:(){
            udpateData(context);
            if(keyUser!="birthday")
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('Cancelar'),
          onPressed: (){
            Navigator.of(context).pop();
          },
        )
      ],
    );

    showDialog(
      context: context, builder: (BuildContext context) => alertDialog);
    }

    Widget genreChoose(){

      return SingleChildScrollView(
        child:ListTileTheme(
          contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
          child: RadioButtonGroup(
            labels:<String>[
              "Feminino",
              "Masculino"
            ],
            disabled: [],
            onSelected: (String label) {
              if(label == "Feminino")
              genre = "F";
              else
              genre= "M";
            },
          ),
        ),
      );
    }

    dataPicker(BuildContext context){
      _dateTime= controller.text == "Null"? DateTime.now(): DateTime.parse(controller.text);
      DatePicker.showDatePicker(
        context,
        pickerTheme: DateTimePickerTheme(
          backgroundColor: Colors.white,
          confirm: Text("Salvar", style: TextStyle(color: Colors.cyan)),
          cancel: Text("Cancelar", style: TextStyle(color: Colors.red)),
        ),
        minDateTime: DateTime.parse("1950-01-01"),
        maxDateTime: DateTime.now(),
        initialDateTime: controller.text == "Null"? DateTime.now(): DateTime.parse(controller.text),
        dateFormat: 'yyyy-MMMM-dd',
        locale: _locale,
        onChange: (dateTime, selectedIndex){
          _dateTime = dateTime;
        },
        onConfirm: (dateTime, selectedIndex){
          _dateTime = dateTime;
          controller.text = _dateTime.toString().split(" ")[0];
          udpateData(context);
        },
        onCancel: (){}
      );
    }

    udpateData(BuildContext context) async {
      Usuario _usuario = Usuario.getInstance();
      var valido;

      if(keyUser == 'email')
      EditProfileAPI.editUser(controller.text, _usuario.idUser, _usuario.token);
      else {
        switch(keyUser){
          case 'name':{
            _usuario.email = controller.text;
            valido = EditProfileAPI.editPerson(controller.text, keyUser, _usuario.personId, _usuario.token);
          }
          break;

          case 'birthday': {
            _usuario.birthday = controller.text;
            valido = EditProfileAPI.editPerson(controller.text, keyUser, _usuario.personId, _usuario.token);
          }
          break;

          case 'genre': {
            controller.text = genre;
            _usuario.genre = controller.text;
            valido = EditProfileAPI.editPerson(controller.text, keyUser, _usuario.personId, _usuario.token);
          }
          break;
        }
      }

      valido.then((onValue){
        if(onValue == true){
          if(keyUser == 'birthday')
          Toast.show("$title atualizada com sucesso!!", context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
          else
          Toast.show("$title atualizado com sucesso!!", context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);

          /*Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Profile())
          );*/
        }
        else
        Toast.show("Erro ao atualizar os dados!!", context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
      });
    }
  }
