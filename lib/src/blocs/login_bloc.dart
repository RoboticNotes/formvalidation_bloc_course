import 'package:rxdart/rxdart.dart';


import 'dart:async';
import 'validators.dart';

class LoginBloc with Validators{
  final _emailController = BehaviorSubject<String>(); //StreamController<String>.broadcast() es lo mismo
  final _passwordController = BehaviorSubject<String>(); //StreamController<String>.broadcast() es lo mismo

  //Recupeerar los datos del Stream
  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream =>CombineLatestStream.combine2( emailStream, passwordStream , (e,p)=>true);

  //Insertar valores al Stream
  Function(String) get changeEmail =>_emailController.sink.add;
  Function(String) get changePassword =>_passwordController.sink.add;

  //Obtener el ultimo vaalor inggresado a los Streams
  String get email =>_emailController.value;
  String get password =>_passwordController.value;

  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }

}