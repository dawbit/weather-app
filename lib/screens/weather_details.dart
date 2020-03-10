import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_response.dart';

class WeatherDetailsScreen extends StatelessWidget {

  final WeatherResponse _weather;

  WeatherDetailsScreen(this._weather);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _cityName
      ),
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
        height: MediaQuery.of(context).size.longestSide * 0.3,
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
          ),
        ),
      ),
      Center(
          child: _icon
      ),
      Center(
        child: _description
      ),
    ],
  );

  Widget get _detailsCard => Card(
    margin: const EdgeInsets.all(16.0),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          _temperature,
          _pressure,
          _sunriseSunset
        ],
      ),
    ),
  );

  Widget get _cityName => Text(_weather.name);
  Widget get _icon => Text(_weather.weather.first.icon);
  Widget get _description => Text(_weather.weather.first.description);
  Widget get _temperature => Text(_weather.main.temperature.toString());
  Widget get _pressure => Text(_weather.main.pressure.toString());

  Widget get _sunriseSunset => Text(
      ('Wschód słońca: '+ _weather.sun.formattedSunrise +
      '\nZachód słońca: '+_weather.sun.formattedSunset)
  );

}
