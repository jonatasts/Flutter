class Reuniao {
  int _id;
  String _descricao;
  int _condominio;
  int _tipo;

  Reuniao(
    this._id,
    this._descricao,
    this._condominio,
    this._tipo
  );

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['descricao'] = this._descricao;
    data['condominio'] = this._condominio;
    data['tipo'] = this._tipo;
    return data;
  }
}
