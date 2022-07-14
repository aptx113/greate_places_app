import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:great_places_app/screens/place_detail_screen.dart';
import 'package:provider/provider.dart';

import 'infra/logger.dart';
import 'providers/great_places.dart';
import 'screens/add_place_screen.dart';
import 'screens/places_list_screen.dart';

Future<void> main() async {
  await dotenv.load(fileName: "api_key.env");
  Fimber.plantTree(DebugTree(useColors: true));
  initRootLogger();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final theme = ThemeData(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
          .copyWith(secondary: Colors.amber));

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: theme,
        home: const PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName: (context) => const AddPlaceScreen(),
          PlaceDetailScreen.routeName: (context) => const PlaceDetailScreen()
        },
      ),
    );
  }
}
