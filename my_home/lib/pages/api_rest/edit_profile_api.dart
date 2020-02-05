import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class EditProfileAPI {
  static Future<bool> editUser(email, idUser, token) async {
    var url = "https://api.myhome.well.eti.br/users/$idUser";

    Map params = {"email": email};

    var _body = json.encode(params);

    var response = await http.put(url,
        headers: {
          HttpHeaders.contentTypeHeader:'application/json',
          'x-access-token': token,
        },
        body:_body
     );

    if (response.statusCode == 201)
      return true;

    return false;
  }

  static Future<bool> editPerson(atributo, keyUser, personId, token) async {
    var url = "https://api.myhome.well.eti.br/persons/$personId";

    Map params = {
      keyUser : atributo
    };

    var _body = json.encode(params);

    var response = await http.put(url,
        headers: {
          HttpHeaders.contentTypeHeader:'application/json',
          'x-access-token': token,
        },
        body:_body
     );

    if (response.statusCode == 201)
      return true;

    return false;
  }
}
