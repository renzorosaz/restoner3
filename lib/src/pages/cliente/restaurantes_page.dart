import 'package:flutter/material.dart';
 
 class RestaurantesPage extends StatefulWidget {
 
  @override
  _RestaurantesPageState createState() => _RestaurantesPageState();
}

class _RestaurantesPageState extends State<RestaurantesPage> with AutomaticKeepAliveClientMixin {
  
   @override
   Widget build(BuildContext context) {

     return Container(
       child: Text('Restaunrates'),
     );

   }

  @override
  bool get wantKeepAlive => true;
}