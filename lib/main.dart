import 'package:flutter/material.dart';
import 'package:restoner3/src/login_sesion_page.dart';

import 'package:restoner3/src/pages/cliente/menu_cliente_page.dart';
import 'package:restoner3/src/pages/cliente/opciones_sesion.dart';
import 'package:restoner3/src/pages/cliente/registro_page.dart';
import 'package:restoner3/src/pages/cliente/restaurantes_page.dart';
import 'package:restoner3/src/pages/cliente/sesion_api_fb_page.dart';
import 'package:restoner3/src/pages/cliente/splash_screen.dart';


import 'package:restoner3/src/widgets/search.dart';





void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

      return MaterialApp(
        theme: ThemeData(
        primaryColor: Color.fromRGBO(255, 87, 79, 1.0),
        accentColor: Colors.white
      ),
        debugShowCheckedModeBanner: false,
        title: 'Restoner',
        initialRoute: 'splash',
        routes: {
          'splash' : (BuildContext context) => SplashScreen(),
          'opcsesiones' : (BuildContext context) => OpcionesSesionPage(),
          'faceapi' : (BuildContext context) => SesionFbPage(),
          'registro' : (BuildContext context) => RegistroPage(),
          'iniciarse' :(BuildContext context) => LoginPage(),
          'menu' : (BuildContext context) => MenuClientePage(),
          'mapa' : (BuildContext context) => SearchPage(),
          'listares' : (BuildContext context) => RestaurantesPage(),
          
        },
      );
  }
}

