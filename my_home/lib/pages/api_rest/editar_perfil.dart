import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "EDITAR PERFIL",
          style: TextStyle(
            fontSize: 40,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
