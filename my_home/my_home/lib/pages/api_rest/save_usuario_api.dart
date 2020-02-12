import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_home/pages/models/usuario.dart';

class UsuarioAPI {
  static save(Usuario usuario) async {
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
          usuario.idUser = user['id'];
          usuario.personId = user['personId'];
        }
      }
    }

    _updateDataUser(usuario);
  }

  static _updateDataUser(Usuario usuario) async {


    var url = "https://api.myhome.well.eti.br/persons/${usuario.personId}";

    var header = {
      "Content-Type": "application/json",
      "x-access-token": usuario.token
    };

    var response = await http.get(url, headers: header);
    Map mapResponse = json.decode(response.body);

    if (response.statusCode == 200) {
      usuario.name = mapResponse['name'];
      usuario.genre = mapResponse['genre'];

      if(mapResponse['birthday'] == null)
      usuario.birthday = "";
      else
      usuario.birthday = mapResponse['birthday'];

    }
  }
}
