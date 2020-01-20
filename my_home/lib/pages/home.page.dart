import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Container(
        child: Text(
          "Bem Vindo !!!",
          style: TextStyle(
            fontSize: 40,
            color: Colors.green,
          ),
        ),
      ),
    );
  }

}