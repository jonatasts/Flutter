import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String user, String password) async {
    var url = 'https://api.myhome.well.eti.br/login';

    var header = {"Content-Type": "application/json"};
    Map params = {"username": user, "password": password};

    var _body = json.encode(params);

    var response = await http.post(url, headers: header, body: _body);

    Map mapResponse = json.decode(response.body);

      bool auth = mapResponse['auth'];
      //String token = mapResponse['token'];
      
      /*print("Response status: ${response.statusCode}");
      print("Valido: $auth");
      print("Token: $token");*/

      return auth;
  }
}
