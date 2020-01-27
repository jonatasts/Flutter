import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_home/pages/models/usuario.dart';

class UsuarioAPI {
  static save(Usuario usuario) async {
    int id_usuario;
    var url = "https://api.myhome.well.eti.br/users";

    var header = {
      "Content-Type": "application/json",
      "x-access-token": usuario.token
    };

    var response = await http.get(url, headers: header);
    Map mapResponse = json.decode(response.body);

    if (response.statusCode == 200) {
      for (var user in mapResponse['rows']) {
        if (user['email'] == usuario.email) {
          id_usuario = user['personId'];
        }
      }
    }

    _updateDataUser(id_usuario, usuario);
  }

  static _updateDataUser(int id_usuario, Usuario usuario) async {
    print("Id_usuario = $id_usuario");
    var url = "https://api.myhome.well.eti.br/persons/$id_usuario";

    var header = {
      "Content-Type": "application/json",
      "x-access-token": usuario.token
    };

    var response = await http.get(url, headers: header);
    Map mapResponse = json.decode(response.body);

    if (response.statusCode == 200) {
      usuario.name = mapResponse['name'];
      usuario.birthday = mapResponse['birthday'];
      usuario.genre = mapResponse['genre'];
      print("${usuario.email}");
      print("${usuario.name}");
      print("${usuario.token}");
      print("${usuario.birthday}");
      print("${usuario.genre}");
    }
  }
}
