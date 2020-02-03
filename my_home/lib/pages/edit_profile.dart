import "dart:async";
import 'package:toast/toast.dart';
import 'package:flutter/material.dart';

import 'package:grouped_buttons/grouped_buttons.dart';

import 'api_rest/edit_profile_api.dart';
import 'profile.dart';


class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController  _birthdayController = TextEditingController();
  String _genre;




  final _formCadKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formCadKey,
        child: Container(
          padding: EdgeInsets.only(top: 30, left: 40, right: 40),
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              //Imagem de fundo do topo da tela
              buildAssetImageFundo(),
              SizedBox(
                height: 30,
              ),
              //Campo nome
              buildTextFormFieldNome(),
              SizedBox(
                height: 10,
              ),
              //Campo E-mail
              buildTextFormFieldEmail(),
              SizedBox(
                height: 10,
              ),
              //Campo Senha
              buildTextFormFieldBirthday(),
              SizedBox(
                height: 10,
              ),
              Text(
                "Gênero",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black38),
                ),
                //Checkbox Gênero
                buildCheckboxGroupGenre(),
                SizedBox(
                  height: 10,
                ),
                //Botão Cadastrar
                buildFlatButtonAlterar(context),
                SizedBox(
                  height: 10,
                ),
                //Botão Cancelar
                buildFlatButtonCancelar(context),
              ],
            ),
          ),
        ),
      );
    }

    //Imagem de fundo do topo da tela
    buildAssetImageFundo() {
      return Container(
        width: 170,
        height: 170,
        alignment: Alignment(0.0, 1.15),
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: AssetImage("assets/user-icon.png"),
            fit: BoxFit.fitHeight,
          ),
        ),
      );
    }

    //Campo nome
    buildTextFormFieldNome() {
      return TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "Nome",
          hintText: "Informe seu nome",
          labelStyle: TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        controller: _nomeController,
        validator: (value) {
          if (value.isEmpty) {
            return "Informe seu Nome";
          }
          return null;
        },
        //Tamanho da fonte do texto digitado no input
        style: TextStyle(
          fontSize: 20,
        ),
      );
    }

    //Campo E-mail
    buildTextFormFieldEmail() {
      return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "E-mail",
          hintText: "Informe seu e-mail",
          labelStyle: TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        controller: _emailController,
        validator: (value) {
          if (value.isEmpty) {
            return "Informe seu E-mail";
          }
          return null;
        },
        //Tamanho da fonte do texto digitado no input
        style: TextStyle(
          fontSize: 20,
        ),
      );
    }

    //Campo Senha
    buildTextFormFieldBirthday() {
      return TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "Data de aniversário",
          hintText: "Informe seu aniversário",
          labelStyle: TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        controller: _birthdayController,
        //_birthdayController.text = "",
        validator: (value) {
          if (value.isEmpty) {
            return "Informe seu aniversário";
          }
          return null;
        },
        //Tamanho da fonte do texto digitado no input
        style: TextStyle(
          fontSize: 20,
        ),
      );
    }

    //Checkbox Gênero
    buildCheckboxGroupGenre() {
      return RadioButtonGroup(
        labels: <String>[
          "Masculino",
          "Feminino",
        ],
        disabled: [],
        onSelected: (String label) {
          if(label == "Feminino")
          _genre = "F";
          else
          _genre= "M";
        },
      );
    }

    //Botão Cadastrar
    buildFlatButtonAlterar(BuildContext context) {
      return Container(
        height: 60,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [
              Color(0xFF87CEFA),
              Color(0xFF4682B4),
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: SizedBox.expand(
          child: FlatButton(
            //Ação ao clicar no botão cadastrar
            onPressed: () async {},
            child: Text(
              "Alterar",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    //Botão Cancelar
    buildFlatButtonCancelar(context) {
      return Container(
        height: 40,
        alignment: Alignment.center,
        child: FlatButton(
          child: Text(
            "Cancelar",
            textAlign: TextAlign.center,
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
      );
    }

  } // Fim da classe SignUp
