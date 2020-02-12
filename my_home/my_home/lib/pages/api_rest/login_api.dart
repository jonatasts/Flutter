import 'dart:convert';
import "dart:async";

import 'package:http/http.dart' as http;
import 'package:my_home/pages/models/usuario.dart';

import 'save_usuario_api.dart';

class LoginApi {
  static Future<Usuario> login(String email, String password) async {
    Usuario _usuario = Usuario.getInstance();

    var url = "https://api.myhome.well.eti.br/login";

    var header = {"Content-Type": "application/json"};
    Map params = {"username": email, "password": password};

    var _body = json.encode(params);

    var response = await http.post(url, headers: header, body: _body);
    Map mapResponse = json.decode(response.body);

    if (response.statusCode == 200) {
      _usuario.email = email;
      _usuario.token = mapResponse['token'];
      UsuarioAPI.save(_usuario);
    } else {
      _usuario = null;
    }

    await new Future.delayed(const Duration(seconds : 2));

    return _usuario;

  }
}
