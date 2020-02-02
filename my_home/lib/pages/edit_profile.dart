import "dart:async";
import 'package:toast/toast.dart';
import 'package:flutter/material.dart';

import 'package:grouped_buttons/grouped_buttons.dart';

import 'api_rest/edit_profile_api.dart';
import 'profile.dart';

class EditProfile extends StatelessWidget {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  String _genre;
  String _planId;


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
              buildTextFormFieldSenha(),
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
                buildFlatButtonCadastrar(context),
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
    buildTextFormFieldSenha() {
      return TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          labelText: "Senha",
          hintText: "Informe sua senha",
          labelStyle: TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        controller: _senhaController,
        validator: (value) {
          if (value.isEmpty) {
            return "Informe sua Senha";
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
    buildFlatButtonCadastrar(BuildContext context) {
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
            onPressed: () async {
              if (_formCadKey.currentState.validate()) {
                String email = _emailController.text;
                String senha = _senhaController.text;
                String nome = _nomeController.text;
                int planId = int.parse(_planId);

                var response =
                await EditProfileAPI.editProfile(email, "name", "genre", "birthday");

                if (response) {
                  Toast.show("Usuário cadastrado com sucesso !!!", context, duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
                  await new Future.delayed(const Duration(seconds : 2));
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => Profile(),
                    ),
                  );
                } else {
                  Toast.show("Erro ao cadastrar usuário !!!", context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                }
              }
            },
            child: Text(
              "Cadastrar",
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
