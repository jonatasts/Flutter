class Reuniao {
  int _id;
  String _descricao;
  int _condominio;
  int _tipo;

  Reuniao(
    this._id, 
    this._descricao,
    this._tipo, 
    this._condominio 
  );

  int get id => _id;
  String get descricao => _descricao;
  int get condominio => _condominio;
  int get tipo => _tipo;
  set id(int id) => _id = id;
  set descricao(String descricao) => _descricao = descricao;
  set condominio(int condominio) => _condominio = condominio;
  set tipo(int tipo) => _tipo = tipo;

  Reuniao.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _descricao = json['descricao'];
    _tipo = json['tipo'];
    _condominio = json['condominio'];
  }

  Map<String, dynamic> toJson() => {
        'id': _id,
        'descricao': _descricao,
        'tipo': _tipo,
        'condominio': _condominio,
      };

  void listarReunioes() {
    print('\n\nID: $_id\n');
    print('Descricao: $descricao:\n');
    print('Id Tipo: $tipo\n');
    print('Id Condominio: $condominio\n');
  }
}
