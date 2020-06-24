// To parse this JSON data, do
//
//     final restaurante = restauranteFromMap(jsonString);

import 'dart:convert';



class Restaurantes{

  List <Restaurante> items= new List();

  Restaurantes();

  Restaurantes.fromJsonList(List<dynamic> jsonList){

    if(jsonList==null) return;

    for(var item in jsonList){

      final restaurante = new Restaurante.fromJson(item);
      items.add(restaurante);

    }
  }
  
}

List<Restaurante> restauranteFromJson(String str) => List<Restaurante>.from(json.decode(str).map((x) => Restaurante.fromJson(x)));

String restauranteToJson(List<Restaurante> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Restaurante {
    Restaurante({
        this.idRestaurante,
        this.nombre,
        this.latitud,
        this.longitud,
    });

    String idRestaurante;
    String nombre;
    String latitud;
    String longitud;

    factory Restaurante.fromJson(Map<String, dynamic> json) => Restaurante(
        idRestaurante: json["idRestaurante"],
        nombre: json["nombre"],
        latitud: json["latitud"],
        longitud: json["longitud"],
    );

    Map<String, dynamic> toJson() => {
        "idRestaurante": idRestaurante,
        "nombre": nombre,
        "latitud": latitud,
        "longitud": longitud,
    };
}
