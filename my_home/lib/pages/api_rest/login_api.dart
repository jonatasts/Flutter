import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_home/pages/models/usuario.dart';

class LoginApi {
  static Future<Usuario> login(String user, String password) async {
    Usuario _usuario = Usuario.getInstance();

    var url = 'https://api.myhome.well.eti.br/login';

    var header = {"Content-Type": "application/json"};
    Map params = {"username": user, "password": password};

    var _body = json.encode(params);

    var response = await http.post(url, headers: header, body: _body);
    Map mapResponse = json.decode(response.body);

    if (response.statusCode == 200) {
      _usuario.email = user;
      _usuario.token = mapResponse['token'];
    } else {
      _usuario = null;
    }

    return _usuario;
  }
}
