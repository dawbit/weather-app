import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:weatherapp/screens/main_content.dart';

import 'package:weatherapp/blocks/weather_block.dart';
import 'package:weatherapp/repositories/weather_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: _blocs,
      dependencies: _dependencies,
      child: MaterialApp(
        title: 'Weather-App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainContent(),
      ),
    );
  }

  List<Bloc> get _blocs => [
    Bloc((i) => WeatherBloc(i.get()))
  ]; // Block

  List<Dependency> get _dependencies => [
    Dependency((_) => WeatherRepository())
  ]; // Dependency
}
