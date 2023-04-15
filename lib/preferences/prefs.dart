
/*
import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences ?_preferences;

  static const rol = 'rol';
  static const idexp = 'idexp';
  static const idpat = 'idpat';
  static const email = 'email';
  static const pass = 'pass';
  static const path = 'path';
  static const token = 'token';
  static const url = 'url';


  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setidpat(String setidpat) async =>
      await _preferences?.setString(idpat, setidpat);

  static String? getidpat() => _preferences!.getString(idpat);

  static Future setidexp(String setidpat) async =>
      await _preferences?.setString(idexp, setidpat);

  static String? getidexp() => _preferences!.getString(idexp);

  static Future setrol(String setrol) async =>
      await _preferences?.setString(rol, setrol);

  static String? getrol() => _preferences!.getString(rol);

  static Future setemail(String setemail) async =>
      await _preferences?.setString(email, setemail);

  static String? getemail() => _preferences!.getString(email);


  static Future setpass(String setpass) async =>
      await _preferences?.setString(pass, setpass);

  static String? getpass() => _preferences!.getString(pass);

  static Future setpath(String setpath) async =>
      await _preferences?.setString(path, setpath);

  static String? getpath() => _preferences!.getString(path);

  static Future settoken(String settoken) async =>
      await _preferences?.setString(path, settoken);

  static String? gettoken() => _preferences!.getString(token);

  static Future seturl(String seturl) async =>
      await _preferences?.setString(path, seturl);

  static String? geturl() =>  _preferences!.getString('url') ??
  "https://melanomia.herokuapp.com/";
 // static Future setPets(List<String> pets) async =>
 //     await _preferences!.setStringList(idexp, pets);

 // static List<String>? getPets() => _preferences!.getStringList(_keyPets);


  }


    static Future setBirthday(DateTime dateOfBirth) async {
    final birthday = dateOfBirth.toIso8601String();

    return await _preferences!.setString(_keyBirthday, birthday);

  static DateTime getBirthday() {
    final birthday = _preferences!.getString(_keyBirthday);

    return birthday == null ? null : DateTime.tryParse(birthday);


}}*/

import 'package:shared_preferences/shared_preferences.dart';



class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =  new PreferenciasUsuario._internal();


  factory PreferenciasUsuario() {
    return _instancia;
  }
  SharedPreferences? _prefs;
  PreferenciasUsuario._internal();



  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get geturl {
    //return _prefs.getString('urlPetcare') ?? "https://10.0.2.2:5001/api";
    return _prefs?.getString('url') ??
        "https://melanomia.herokuapp.com/";
    // "http://192.168.0.2:3006/";
  }

  set seturl(String value) {
    _prefs?.setString('urlPetcare', value);
  }

  // GET y SET del nombre
  get gettoken {
    return _prefs?.getString('token');
  }

  set settoken(String value) {
    _prefs?.setString('token', value);
  }
  get getpath {
    return _prefs?.getString('path');
  }

  set setpath(String value) {
    _prefs?.setString('path', value);
  }
  set setname(String value) {
    _prefs?.setString('name', value);
  }
  get getname {
    return _prefs?.getString('name');
  }
  get getNpath {
    return _prefs?.getString('Npath');
  }

  set setNpath(String value) {
    _prefs?.setString('Npath', value);
  }
  get getpathl {
    return _prefs?.getStringList('paths');
  }

  set setpathl( List<String> value) {
    _prefs?.setStringList('paths', value);
  }
  get getidpat {
    return _prefs?.getString('iduser') ?? '';
  }

  set setidpat(String value) {
    _prefs?.setString('iduser', value);
  }

//?? ___ : el id usuario veterinario que quieras probar
  get getidexp {
    return _prefs?.getString('idvet') ?? '';
  }

  set setidexp(String value) {
    _prefs?.setString('idvet', value);
  }

  get getpass {
    return _prefs?.getString('pass') ?? '';
  }

  set setpass(String value) {
    _prefs?.setString('pass', value);
  }
  get getemail {
    return _prefs?.getString('email') ?? '';
  }

  set setemail(String value) {
    _prefs?.setString('email', value);
  }
  get getrol {
    return _prefs?.getString('rol') ?? '';
  }

  set setrol(String value) {
    _prefs?.setString('rol', value);
  }
  get getrolid {
    return _prefs?.getString('rolId') ?? '';
  }

  set setrolid(String value) {
    _prefs?.setString('rolId', value);
  }
  setString(String s, String path) {}

// GET y SET de la última página
/* get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'login';
  }

  set ultimaPagina( String value ) {
    _prefs.setString('ultimaPagina', value);
  } */

}
