import 'dart:convert';

import 'package:http/http.dart' as http;

class RegisterApi {
  static Future<bool> register(email, password, name, genre, planId) async {
    var url = 'https://api.myhome.well.eti.br/createAccount';
    
    var header = {"Content-Type": "application/json"};
    Map params = {"email": email, "pass": password, "name": name, "genre": genre, "plan_id": planId};

    var _body = json.encode(params);

    var response = await http.post(url, headers: header, body: _body);

    Map mapResponse = json.decode(response.body);

      var ativo = mapResponse['active'];
      
      print("email: $email");
      print("password: $password");
      print("name: $name");
      print("genre: $genre");
      print("planId: $planId");
      print("\n\n");
      
      print("Response status: ${response.statusCode}");
      print("Ativo: $ativo");
      

      return ativo;
  }
}