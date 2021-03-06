import 'package:my_home/pages/api_rest/login_api.dart';
import 'package:my_home/pages/signup.dart';
import 'package:my_home/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Login extends StatelessWidget {
  final _loginController = TextEditingController();
  final _senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Container da pagina
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.only(
            top: 110,
            left: 40,
            right: 40,
          ),
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              //Logo
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset("assets/logo.jpg"),
              ),
              //Espaçamento
              SizedBox(
                height: 30,
              ),
              //Campo do E-mail
              buildTextFormFieldEmail(),
              //Espaçamento
              SizedBox(
                height: 10,
              ),
              //Campo da Senha
              buildTextFormFieldSenha(),
              //Botão Recuperar Senha
              //buildContainerButtonRecuperarSenha(context),
              //Espaçamento
              SizedBox(
                height: 40,
              ),
              //Container do Botão de Login
              buildContainerButtonLogin(context),
              //Espaçamento
              SizedBox(
                height: 10,
              ),
              //Container no botão cadastre-se
              buildContainerButtonCadastreSe(context),
            ],
          ),
        ),
      ),
    );
  }

//Campo Email
  buildTextFormFieldEmail() {
    return TextFormField(
      //autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "E-mail",
        hintText: "Digite seu e-mail",
        labelStyle: TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
      ),
      controller: _loginController,
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
        hintText: "Digite sua senha",
        labelStyle: TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
      ),
      controller: _senhaController,
      validator: (value) {
        if (value.isEmpty) {
          return "Informe sua senha";
        }
        return null;
      },
      //Tamanho da fonte do texto digitado no input
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  //Container do Botão de Login
  buildContainerButtonLogin(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.2, 1],
          colors: [
            Color(0xFF87CEFA),
            Color(0xFF4682B4),
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      //Botão de Login
      child: SizedBox.expand(
        child: FlatButton(
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              String login = _loginController.text;
              String senha = _senhaController.text;

              var usuario = await LoginApi.login(login, senha);
              if (usuario != null) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home(0)));
              } else {
                Toast.show("Usuário ou senha inválidos !", context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
              }
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
              //Icone de Login
              Container(
                child: SizedBox(
                  child: Image.asset("assets/icon_login.png"),
                  height: 28,
                  width: 28,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Container no botão cadastre-se
  buildContainerButtonCadastreSe(BuildContext context) {
    return Container(
      height: 40,
      child: FlatButton(
        child: Text(
          "Cadastre-se",
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Signup(),
            ),
          );
        },
      ),
    );
  }

  //Botão Recuperar Senha
  buildContainerButtonRecuperarSenha(BuildContext context) {
    /*
    Container(
      height: 40,
      alignment: Alignment.centerRight,
      child: FlatButton(
        child: Text(
          "Recuperar Senha",
          textAlign: TextAlign.right,
        ),
        onPressed: () {},
      ),
    );*/
  }
} //Fim da Classe login.page
