import 'dart:io';

import 'package:reunioes/reunioes.dart';

Future<void> main() async {
  int fim = 0;
  var reuniao = Reuniao(1,'Assembleia Geral Ordinária', 2,2);
  
  while(fim != 1){
  menu();
  String opcao = stdin.readLineSync();

    switch(opcao) {
      case '1':
        await ControlerReuniao.listarReunioes();
        break;
      
      case '2':
        await ControlerReuniao.addReuniaoToJson();
        break;
      
      case '3':
        await ControlerReuniao.removerReuniaoFromJson();
        break;
      
      case '4':
        fim = 1;
        break;
      
      default:
        print('Opção Invalida !');
      }
  }

  
}

void menu() {
  print('Escolha uma opcao:\n');
  print('1 - Listar Reuniões');
  print('2 - Adicionar Reunião');
  print('3 - Remover Reunião');
  print('4 - SAIR\n');
}
