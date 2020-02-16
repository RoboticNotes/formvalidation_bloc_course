import 'package:flutter/material.dart';
import 'src/pages/registro_page.dart';
import 'src/preferences/preferences_usuario.dart';
import 'src/pages/producto_page.dart';
import 'src/blocs/provider.dart';
import 'src/pages/home_page.dart';
import 'src/pages/login_page.dart';
 
void main() async {
  //Antes de inicializar data
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  //final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    //print(prefs.token);

    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'registro',
        routes: {
          'login': (BuildContext context)=> LoginPage(),
          'home': (BuildContext context)=> HomePage(),
          'producto': (BuildContext context)=> ProductoPage(),
          'registro': (BuildContext context)=> RegistroPage(),
        },
        theme: ThemeData(primaryColor: Colors.deepPurple),
      ),
    );
  }
}