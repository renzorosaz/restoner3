import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    
    super.initState();
    Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, "opcsesiones"));
  }

  

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          //fondo pantalla
          //icono
          //letras
          _fondo(),
          _letras()

        ],
      ),
    );
  }

  Widget _fondo(){

      return  Container(
       width: double.infinity,
       height: double.infinity,
       decoration: BoxDecoration( 
         image: DecorationImage(
           image: AssetImage('assets/fondo1.png'),
           fit: BoxFit.cover,
           colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
           
        )
       ),
      );
      

  }
  Widget _letras(){

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container( 
          alignment: Alignment.bottomLeft,
                margin:EdgeInsets.only(left: 85.0) ,
                child: SvgPicture.asset('assets/logo.svg'),
        ),
        Text(
              'Restoner',
              style:TextStyle(
                    fontFamily: 'SemiBold',
                    fontSize: 70,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
              ),
        )
      ]
    );

  }
}
