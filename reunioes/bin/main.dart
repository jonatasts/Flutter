import 'package:reunioes/reunioes.dart';

void main() {
  //print('Hello world: ${reunioes.calculate()}!');
  var reuniao = Reuniao(1,'Assembleia Geral Ordinária', 2,2);
  print(reuniao.id);
  print(reuniao.descricao);
  print(reuniao.condominio);
  print(reuniao.tipo);
}
