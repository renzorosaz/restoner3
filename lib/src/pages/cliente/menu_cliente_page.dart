
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:restoner3/src/pages/cliente/mapa_page.dart';
import 'package:restoner3/src/pages/cliente/restaurantes_page.dart';
import 'package:restoner3/src/utils/DirectionsProvider.dart';
/* import 'package:restoner3/src/models/place.dart'; */

/* import 'package:restoner3/src/services/geolocator_service.dart';
import 'package:restoner3/src/services/places_service.dart'; */




class MenuClientePage extends StatefulWidget {


     
  @override
  _MenuClientePageState createState() => _MenuClientePageState();
}

class _MenuClientePageState extends State<MenuClientePage> with SingleTickerProviderStateMixin{

  TabController _tabController;

    

    @override
    void initState(){
      super.initState();
        _tabController = TabController(
           vsync: this ,
           initialIndex:1,
           length: 2
         );
      
  }

  @override
  Widget build(BuildContext context) {  

 
   

    return Scaffold(
       appBar: AppBar(
         title: Text('Flutter Chat'),
         bottom: TabBar(
           labelPadding: EdgeInsets.symmetric(horizontal: 5.0),
           controller: _tabController,
           
           tabs: <Widget>[/* 
             Tab(icon: Icon(Icons.camera_alt)), */
             Row(
                children: <Widget>[
                 Icon(Icons.fastfood,size: 40,),
                 Tab(
                   text: "Inicio", 
                  ),
               ],
             ),
            Row(
              children: <Widget>[
                Icon(Icons.explore, size: 40,),
                Tab(
                  text: "Mapa"
                ),
              ],
            ),
           ]
        ),
       ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(), // deshabilita 
          controller: _tabController,
          children: <Widget>[
          RestaurantesPage(),
          //INICIO  agrear icon
          ChangeNotifierProvider(
            create: (_) => DirectionProvider(),
            child: MapaPage()
          )

         ]
      ),
       floatingActionButton: FloatingActionButton(

          onPressed: () {
            // Add your onPressed code here!
          },
          child: Icon(
            Icons.tune,
            color: Colors.white
 
          ),
          backgroundColor: Color.fromRGBO(27, 56, 71, 1.0),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
    
  }
}