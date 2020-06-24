import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class OpcionesSesionPage extends StatelessWidget {
  
 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      body: Stack(
        children: <Widget>[
          _fondoPantalla(),//fondo de pantalla
           _botonesContainer(context),
          /* _crerBRegistrar() */
          /* _crearBIniciar()  */
          //siguientes widgets

          /*  */
        ],
      ),
    );
  }

  Widget _fondoPantalla(){

    return  Container(
       width: double.infinity,
       height: double.infinity,
       decoration: BoxDecoration( 
         image: DecorationImage(
           image: AssetImage('assets/fondo2.png'),
           fit: BoxFit.cover,
           colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
           
        )
       ),
      );
  }

  Widget _botonesContainer(BuildContext context){

    final size = MediaQuery.of(context).size;
    
      return SingleChildScrollView(
      child: Column(
        children: <Widget>[
        /*   _Container1()
          _Container2() */

          SafeArea(
            child: Container(
               width: size.width * 0.95,
               margin: EdgeInsets.symmetric(vertical: 30.0),
              padding: EdgeInsets.symmetric( vertical: 55.0 ),              
              
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                        SvgPicture.asset('assets/logo.svg'),
                        Text('Restoner',style:TextStyle(   fontFamily: 'SemiBold',     fontSize: 59,     color: const Color(0xffffffff),     fontWeight: FontWeight.w700, ))
                    ],
                  ),
                  
                     Container(
                      padding: EdgeInsets.symmetric( vertical: 40.0 ),
                      child: Text('Los restaurantes están más cerca de lo que crees',textAlign: TextAlign.center,
                        style:TextStyle(
                        fontFamily: 'SemiBold',
                         fontSize: 25,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                ],
              ),
            ),

          ),
          
          Column(
                  children: <Widget>[
                    _ingresarFB(context),
                    SizedBox(height: 40,),
                    _crearRegistrate(context),
                     SizedBox(height: 20,),
                   /*  _terminos(), */
                  ],
                ),
           
        ],
      ),
    );
  }

  Widget _ingresarFB(BuildContext context){

    final size = MediaQuery.of(context).size;

      return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'faceapi');
              },
              child: Container(
                width: size.width * 0.80,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: <BoxShadow>[
                    BoxShadow( 
                      color: Colors.indigoAccent[400],
                      offset: Offset(0.2,5)
                    )
                  ]
                ),

                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SvgPicture.asset('assets/fblogo.svg'),
                      Text('Ingresar con Facebook',
                              style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            );

  }

Widget _crearRegistrate(BuildContext context){


   return SafeArea(
        child: Container( 
           child: Column(
             children: <Widget>[
                    GestureDetector(
                      onTap: (){
                          Navigator.pushNamed(context, 'registro'); 
                      },
                        child: Text('REGÍSTRATE',
                             style: TextStyle(
                            fontFamily: 'SemiBold',
                            fontSize: 18,
                            color: const Color(0xfffc181b),
                            fontWeight: FontWeight.w600,
                          ),
                     ),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('¿Tienes una cuenta?',style: TextStyle(
                          fontFamily: 'Regular',
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          ),
                        ),

                        GestureDetector(
                             onTap: (){
                               Navigator.pushNamed(context, 'menu'); 
                              },
                          child: Text('Iniciar Sesión',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                  fontFamily: 'SemiBold',
                                  fontSize: 18,
                                  color: const Color(0xfffc181b),
                                  fontWeight: FontWeight.w600,
                                  ),
                          ),
                        ),
                      
                      ],
                    ),

/* 
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: <Widget>[
                     Text('¿Tienes una cuenta?',style: TextStyle(
                      fontFamily: 'Regular',
                      fontSize: 18,
                      color: Colors.white,
                       fontWeight: FontWeight.w600,
                      ),
                     ),
                          Text('Iniciar Sesión',
                         textAlign: TextAlign.justify,
                         style: TextStyle(
                         fontFamily: 'SemiBold',
                         fontSize: 18,
                         color: const Color(0xfffc181b),
                         fontWeight: FontWeight.w600,
                      ),
                     ),

                    ],
                  ) */

         ],
       ),

     ),
   );
}





}