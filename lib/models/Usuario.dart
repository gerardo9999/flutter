class Usuario{
  
  String id;
  String name;
  String email;
  String password;
  String rol;

  Usuario({
    this.id,
    this.name,
    this.email,
    this.password,
    this.rol,
  });

  factory Usuario.fromJson(Map<String , dynamic> json){
    return Usuario(
      id       : json['id'],
      name     : json['name'],
      email    : json['email'],
      password : json['password'],
      rol      : json['rol'],
    );
  }

  Map<String,dynamic> toMap(){
    return {
        'id'        : id,
        'name'      : name,
        'email'     : email,
        'password'  : password,
        'rol'       : rol
    };
  }
}
