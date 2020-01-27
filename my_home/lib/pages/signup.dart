import 'package:flutter/material.dart';

import 'package:grouped_buttons/grouped_buttons.dart';

import 'api_rest/register_api.dart';
import 'login.dart';

class Signup extends StatelessWidget {
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
              Text(
                "Plano",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black38),
              ),
              //Checkbox Plano
              buildCheckboxGroupPlano(),
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
        "M",
        "F",
      ],
      disabled: [],
      onSelected: (String label) => _genre = label,
    );
  }

//Checkbox Plano
  buildCheckboxGroupPlano() {
    return RadioButtonGroup(
      labels: <String>[
        "1",
        "2",
      ],
      disabled: [],
      onSelected: (String label) => _planId = label,
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
                  await RegisterApi.register(email, senha, nome, _genre, planId);

              if (response) {
                return showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // retorna um objeto do tipo Dialog
                    return AlertDialog(
                      //Título da caixa de diálogo
                      title: new Text("Sucesso"),
                      titleTextStyle:
                          TextStyle(fontSize: 20, color: Colors.green),
                      //Texto do Body da caixa de diálogo
                      content: new Text("Usuário cadastrado com sucesso !!!"),
                      contentTextStyle: TextStyle(color: Colors.black),
                      actions: <Widget>[
                        //Define os botões na base do dialogo
                        new FlatButton(
                          //Texto do botão
                          child: new Text(
                            "Ok",
                          ),
                          textColor: Colors.green,
                          onPressed: () {
                            //Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
                /*
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
                */
              } else {
                return showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // retorna um objeto do tipo Dialog
                    return AlertDialog(
                      title: new Text("Erro"),
                      titleTextStyle:
                          TextStyle(fontSize: 20, color: Colors.red),
                      content: new Text("Erro ao cadastrar usuário !!!"),
                      contentTextStyle: TextStyle(color: Colors.black),
                      actions: <Widget>[
                        // define os botões na base do dialogo
                        new FlatButton(
                          child: new Text(
                            "Fechar",
                          ),
                          textColor: Colors.black,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
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

//FlatButton add(+) sobreposto - fica embaixo do BoxDecoration da imagem de fundo do topo da tela
  buildFlatButtonCancelarAddImageFundo() {
/*
child: Container(
  height: 56,
  width: 56,
  alignment: Alignment.center,
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.3, 1.0],
      colors: [
        Color(0xFF87CEFA),
      Color(0xFF4682B4),
      ],
    ),
    border: Border.all(
      width: 4.0,
      color: const Color(0xFFFFFFFF),
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(56),
    ),
  ),
  child: SizedBox.expand(
    child: FlatButton(
      padding: EdgeInsets.all(0),
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {},
    ),
  ),
),*/
  }
} // Fim da classe SignUp
