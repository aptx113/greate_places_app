import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places_app/helpers/db_helper.dart';
import 'package:great_places_app/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: pickedTitle,
        location: null,
        image: pickedImage);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', newPlace);
  }

  Future<void> fetchPlaces() async {
    final dataList = await DBHelper.getData(DBHelper.placesTable);
    _items = dataList;
    notifyListeners();
  }
}
