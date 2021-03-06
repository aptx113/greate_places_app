import 'dart:io';

class Place {
  Place(
      {required this.id,
      required this.title,
      required this.location,
      required this.image});
  final String id;
  final String title;
  final PlaceLocation? location;
  final File image;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image.path,
      'loc_lat': location?.latitude,
      'loc_lng': location?.longitude,
      'address': location?.address,
    };
  }

  @override
  String toString() {
    return 'Place(id: $id, title: $title, image: ${image.path})';
  }
}

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String? address;

  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    this.address,
  });
}
