import 'dart:convert';
import 'dart:io';

import '../models/reuniao.dart';
import '../models/lista_reunioes.dart';
import '../services/servicos_reuniao.dart';

class ReuniaoControler {
  static void listarReunioes() async {
    ListaReunioes lista_reunioes = await getListaReunioes();
    lista_reunioes.reunioes.forEach((reuniao) => reuniao.listarReunioes());
  }

  static void addReuniaoToJson() async {
    ListaReunioes lista_reunioes = await getListaReunioes();
    Reuniao reuniao = newReuniao();
    lista_reunioes.addReuniao(reuniao);
    writeOnJson(lista_reunioes);
  }

  static void editar() async {
    ListaReunioes lista_reunioes = await getListaReunioes();
    String descricao_reuniao;
    print("Reuniões Disponiveis:");
    for (var i = 0; i < lista_reunioes.reunioes.length; i++) {
      print(lista_reunioes.reunioes[i].id);
    }

    print("Escolha a Reunião");
    descricao_reuniao = stdin.readLineSync();

    
  }

  static void removerReuniaoFromJson() async {
    int id;
    ListaReunioes lista_reunioes = await getListaReunioes();
    
    print('Insira o ID da Reunião a ser removida:');
    id = int.parse(stdin.readLineSync());
    if (lista_reunioes.removerReuniao(id))
      print('Reunião removida com sucesso ou ID não encontrado');
    else
      print('Reunião não removida !');
    writeOnJson(lista_reunioes);
  }

  static Reuniao newReuniao() {
    int id_reuniao, id_condominio, id_tipo;
    String descricao;

    print('\nInsira os dados da Reunião:\n');
    print('Insira o ID da Reunião');
    id_reuniao = int.parse(stdin.readLineSync());

    print('Insira a descrição da Reunião');
    descricao = stdin.readLineSync();

    print('Insira o ID do tipo da Reunião');
    id_tipo = int.parse(stdin.readLineSync());

    print('Insira o ID do Condominio');
    id_condominio = int.parse(stdin.readLineSync());

    return new Reuniao(id_reuniao,descricao,id_tipo,id_condominio);
  }

  static Future<ListaReunioes> getListaReunioes() async {
    Future<ListaReunioes> lista_reunioes = ServicosReuniao.readReunioesFromJson();
    ListaReunioes reunioes;
    await lista_reunioes.then((result) => reunioes = new ListaReunioes(result.reunioes));
    return reunioes;
  }

  static void writeOnJson(ListaReunioes lista) {
    var dados = json.encode(lista.reunioes);
    File file = new File("../assets/lista_reunioes.json");
    file.writeAsStringSync(dados);
  }


}