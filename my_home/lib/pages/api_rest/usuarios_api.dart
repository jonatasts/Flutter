import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_home/pages/models/usuario.dart';

class UsuariosAPI {
  static Future<Usuario> getUsuarios() async {
    Usuario _usuario = Usuario.getInstance();

    var url = 'https://api.myhome.well.eti.br/users';

    var header = {
      "Content-Type": "application/json",
      "x-access-token": _usuario.token
    };

    var response = await http.get(url, headers: header);
    Map mapResponse = json.decode(response.body);


    if (response.statusCode == 200) {
      int count = mapResponse['count'];
      print("Usuários: $count");
    } else {
      print("ERRO");
    }

    return _usuario;
  }
}
