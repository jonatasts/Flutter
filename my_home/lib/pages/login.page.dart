import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Container da pagina
      body: Container(
        padding: EdgeInsets.only(
          top: 110,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            //Tamanho da Logo
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
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              //Tamanho da fonte do texto digitado no input
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            //Espaçamento
            SizedBox(
              height: 10,
            ),
            //Campo da Senha
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              //Tamanho da fonte do texto digitado no input
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            //Botão Recuperar Senha
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
            ),
            //Espaçamento
            SizedBox(
              height: 40,
            ),
            Container(
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
                  onPressed: () {},
                ),
              ),
            ),
            //Espaçamento
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              child: FlatButton(
                child: Text(
                  "Cadastre-se",
                  textAlign: TextAlign.center,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
