
import 'dart:async';
import 'dart:convert';

import 'package:restoner3/src/models/restaurantes.dart';
import 'package:http/http.dart' as http;

Future<List<Restaurante>> getRestaurantes() async {
  String url ="http://192.168.1.3:82//restaurantes.php";
  final response = await http.get(url);
  return restauranteFromJson(response.body);

}


class RestaurantesProvider{

  String _url = 'http://192.168.1.3:82//restaurantes.php';
 

  final _popularesStreamController = StreamController<List<Restaurante>>.broadcast();
Function(List<Restaurante>)  get popularesSink => _popularesStreamController.sink.add;

  Stream<List<Restaurante>> get popularesStream => _popularesStreamController.stream;

  void disposeStreams(){
    _popularesStreamController?.close();
  }

  Future<List<Restaurante>> _procesarRespuesta(Uri url) async{

    final resp = await http.get(url);//retornar respuesta
    final decodedData= json.decode(resp.body);

    final restaurantes= new Restaurantes.fromJsonList(decodedData['results']);

    return restaurantes.items;

  }
  /* Future<List<Restaurante>> getRestaurantes() async {

    final url= Uri.https(_url, '3/search/movie', {

        });
     return await _procesarRespuesta(url);

  } */
}