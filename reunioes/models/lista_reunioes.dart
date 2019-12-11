import 'reuniao.dart';

class ListaReunioes {
  final List<Reuniao> _reunioes;

  ListaReunioes(this._reunioes);

  List<Reuniao> get reunioes => _reunioes;

  void addReuniao(Reuniao reuniao) {
    this._reunioes.add(reuniao);
  }

  bool removerReuniao(int id) {
    this._reunioes.removeWhere((reuniao) => reuniao.id == id);
    return searchReuniaoById(id) ? false : true;
  }

  bool searchReuniaoById(int id) {
    bool ok = false;
    for (var reuniao in this._reunioes) {
      if (reuniao.id == id) {
        ok = true;
      }
    }
    return ok;
  }

  factory ListaReunioes.fromJson(List<dynamic> parsedJson) {
    List<Reuniao> reunioes = new List<Reuniao>();
    reunioes = parsedJson.map((i) => Reuniao.fromJson(i)).toList();
    return new ListaReunioes(reunioes);
  }
  
  Set<List<Reuniao>> toJson() => {_reunioes};
}