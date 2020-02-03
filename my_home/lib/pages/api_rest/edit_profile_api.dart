import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_home/pages/models/usuario.dart';

class EditProfileAPI {
  static Future<bool> editUser(email, idUser, token) async {
    var url = "https://api.myhome.well.eti.br/users/$idUser";

    var header = {
      "Content-Type": "application/json",
      "x-access-token": token
    };

    Map params = {"email": email};

    var _body = json.encode(params);

    var response = await http.put(url, headers: header, body: _body);

    if (response.statusCode == 200)
      return true;

    return false;
  }

  static Future<bool> editPerson(atributo, keyUser, personId, token) async {
    var url = "https://api.myhome.well.eti.br/persons/$personId";

    var header = {
      "Content-Type": "application/json",
      "x-access-token": token
    };

    Map params = {
      "$keyUser": atributo
    };

    var _body = json.encode(params);

    var response = await http.put(url, headers: header, body: _body);

    print("");
    print("");
    print("******************************************************");
    print("******************************************************");
    print("Responde: $response");
    print("");
    print("");
    print("******************************************************");
    print("******************************************************");
    print("");


    if (response.statusCode == 200)
      return true;

    return false;
  }
}
