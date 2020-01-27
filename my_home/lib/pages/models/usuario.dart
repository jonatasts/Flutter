class Usuario {
  String _email;
  String _token;
  String _name;
  Null _birthday;
  String _genre;
  static Usuario _usuario = null;

  Usuario._();

  static Usuario getInstance() {
    if(_usuario == null)
      _usuario = new Usuario._();
    
    return _usuario;
  }

  String get email => _email;
  set email(String email) => _email = email;
  String get token => _token;
  set token(String token) => _token = token;
  String get name => _name;
  set name(String name) => _name = name;
  Null get birthday => _birthday;
  set birthday(Null birthday) => _birthday = birthday;
  String get genre => _genre;
  set genre(String genre) => _genre = genre;

  Usuario.fromJson(Map<String, dynamic> json) {
    _email = json['email'];
    _token = json['token'];
    _name = json['name'];
    _birthday = json['birthday'];
    _genre = json['genre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this._email;
    data['token'] = this._token;
    data['name'] = this._name;
    data['birthday'] = this._birthday;
    data['genre'] = this._genre;
    return data;
  }
}

