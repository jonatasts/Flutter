class Reuniao {
  int _id;
  String _descricao;
  int _condominio;
  int _tipo;

  Reuniao(this._id, this._descricao, this._condominio, this._tipo);

  int get id => _id;
  set id(int id) => _id = id;
  String get descricao => _descricao;
  set descricao(String descricao) => _descricao = descricao;
  int get condominio => _condominio;
  set condominio(int condominio) => _condominio = condominio;
  int get tipo => _tipo;
  set tipo(int tipo) => _tipo = tipo;

  Reuniao.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _descricao = json['descricao'];
    _condominio = json['condominio'];
    _tipo = json['tipo'];
  }

  Map<String, dynamic> toJson() => {
        'id': _id,
        'descricao': _descricao,
        'condominio': _condominio,
        'tipo': _tipo,
      };

  void listarReunioes() {
    print('ID: $_id');
    print('Descricao: $descricao:\n');
    print('Id Condominio: $condominio\n');
    print('Id Tipo: $tipo\n');
  }
}
