import '../preferences/preferences_usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsuarioProvider{

  final String _firebaseToken = 'AIzaSyBchS8esdZ9Jld1H6t3HB0SK2axcU4Sszk';
  final _prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> login(String email, String password) async{
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
      body: json.encode(authData)
    );

    Map<String, dynamic> decodedRep = json.decode(resp.body);

    if(decodedRep.containsKey('idToken')){
      _prefs.token= decodedRep['idToken'];
      return {'ok': true, 'token':decodedRep['idToken']};
    }else{
      return {'ok': false, 'mensaje':decodedRep['error']['message']};
    }

  }

  Future<Map<String, dynamic>> nuevoUsuario(String email, String password) async{
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
      body: json.encode(authData)
    );

    Map<String, dynamic> decodedRep = json.decode(resp.body);

    if(decodedRep.containsKey('idToken')){
      _prefs.token= decodedRep['idToken'];
      return {'ok': true, 'token':decodedRep['idToken']};
    }else{
      return {'ok': false, 'mensaje':decodedRep['error']['message']};
    }

  }
}