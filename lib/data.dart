class Data{
  String _name='';
  String _email='';
  String _password='';

  Data(this._email,this._name,this._password);


  String get name=>_name;
  String get email=> this._email;
  String get password=>_password;
  


  set name(String name){
    this.name=name;
  }
  set email(String email){
    this.email=email;
  }
  set password(String password){
    this.password=password;
  }

  Map<String,dynamic> fromDataToMap() {
    var map= Map<String, dynamic>();
    map['email']=this._email;
    map['name']=this.name;
    map['password']=this._password;
    return map;
  } 

  fromMapToData(Map<String,dynamic> map){
    this._email=map['email'];
    this._name=map['name'];
    this._password=map['password'];
  }
}