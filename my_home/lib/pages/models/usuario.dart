class Usuario {
  String _email;
  String _token;
  static Usuario _usuario;

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

  Usuario.fromJson(Map<String, dynamic> json) {
    _email = json['email'];
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this._email;
    data['token'] = this._token;
    return data;
  }
}
