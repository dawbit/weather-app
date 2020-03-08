import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_response.dart';

class WeatherDetailsScreen extends StatelessWidget {

  final WeatherResponse _weather;

  WeatherDetailsScreen(this._weather);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _getTopContainer(context),
          _detailsCard
        ],
      ),
    );
  }

  Widget _getTopContainer(context) => Stack(
    children: <Widget>[
      Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.longestSide * 0.4,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor
        ),
      ),
      Positioned(
        top: 8,
        left: 8,
        child: SafeArea(
          child: Material(
            color: Theme.of(context).primaryColor,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: Navigator.of(context).pop,
            ),
          ),
        ),
      )
    ],
  );

  Widget get _detailsCard => Card(
    margin: const EdgeInsets.all(16.0),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          _cityName,
          SizedBox(height: 16,)
        ],
      ),
    ),
  );

  Widget get _cityName => Text(_weather.name);

}
