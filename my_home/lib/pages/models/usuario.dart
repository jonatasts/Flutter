class Usuario {
  String _email;
  String _pass;
  String _name;
  String _genre;
  int _planId;

  Usuario({String email, String pass, String name, String genre, int planId}) {
    this._email = email;
    this._pass = pass;
    this._name = name;
    this._genre = genre;
    this._planId = planId;
  }

  String get email => _email;
  set email(String email) => _email = email;
  String get pass => _pass;
  set pass(String pass) => _pass = pass;
  String get name => _name;
  set name(String name) => _name = name;
  String get genre => _genre;
  set genre(String genre) => _genre = genre;
  int get planId => _planId;
  set planId(int planId) => _planId = planId;

  Usuario.fromJson(Map<String, dynamic> json) {
    _email = json['email'];
    _pass = json['pass'];
    _name = json['name'];
    _genre = json['genre'];
    _planId = json['plan_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this._email;
    data['pass'] = this._pass;
    data['name'] = this._name;
    data['genre'] = this._genre;
    data['plan_id'] = this._planId;
    return data;
  }
}
