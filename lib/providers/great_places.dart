import 'package:flutter/material.dart';
import 'package:great_places_app/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _itens = [];

  List<Place> get items {
    return [..._itens];
  }
}
