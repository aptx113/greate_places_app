import 'package:flutter/material.dart';
import 'package:great_places_app/helpers/location_helper.dart';
import 'package:location/location.dart';

class LocationInputWidget extends StatefulWidget {
  const LocationInputWidget({Key? key}) : super(key: key);

  @override
  State<LocationInputWidget> createState() => _LocationInputWidgetState();
}

class _LocationInputWidgetState extends State<LocationInputWidget> {
  String? _previewImageUrl;

  Future<void> _getcurrentUserLocation() async {
    final locationData = await Location().getLocation();
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
        latitude: locationData.latitude ?? 0.0,
        longitude: locationData.longitude ?? 0.0);
    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _previewImageUrl == null
              ? const Text(
                  'No Location Chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl ?? '',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getcurrentUserLocation,
              icon: const Icon(Icons.location_on),
              label: const Text('Current Location'),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map),
              label: const Text('Select on Map'),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
