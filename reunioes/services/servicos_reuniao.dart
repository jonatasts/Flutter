import 'dart:async';

import 'dart:convert';
import 'dart:io';

import '../models/lista_reunioes.dart';

class ServicosReuniao {
  static Future<ListaReunioes> readReunioesFromJson() async {
    String jsonString = await loadJsonAsset();
    final jsonResponse = json.decode(jsonString);
    ListaReunioes reunioes = new ListaReunioes.fromJson(jsonResponse);
    return reunioes;
  }

  static Future<String> loadJsonAsset() async {
    return await new File('../assets/lista_reunioes.json').readAsString();
  }
}