import 'package:flutter/material.dart';

import 'api_rest/usuarios_api.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            "EDITAR PERFIL",
            style: TextStyle(
              fontSize: 40,
              color: Colors.green,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.edit),
        onPressed: () {
          showUsers();
        },
      ),
    );
  }

  showUsers() {
    UsuariosAPI.getUsuarios();
  }
}
