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
        child: SafeArea(
          child: Material(
            color: Theme.of(context).primaryColor,
            child: Column(
              children: <Widget>[
                _mainInfo
              ]
            ),
          ),
        ),
      ),
    ],
  );

  Widget get _detailsCard => Card(
    margin: const EdgeInsets.all(30.0),
    child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          _temperature,
          _temperatureDetails,
          _pressure,
          _sunriseSunset
        ],
      ),
    ),
  );

  Widget get _cityName => Text(_weather.name + ', ');

  Widget get _mainInfo => Text(
      _weather.weather.first.icon + _weather.weather.first.description
  );

  Widget get _temperature => Text(
      'Temperature: ' + _weather.main.temperature.toString() + '\u00b0C',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)
  );

  Widget get _temperatureDetails => Text(
      'Sensed temperature: ' + _weather.main.feelsLike.toString() + '\u00b0C'
      +'\nMinimum temperature: ' + _weather.main.tempMin.toString() + '\u00b0C'
      +'\nMaximum temperature: ' + _weather.main.tempMin.toString() + '\u00b0C',
    style: TextStyle(fontSize: 18)
  );

  Widget get _pressure => Text(
      'Pressure: ' + _weather.main.pressure.toString() + ' hPa',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
  );

  Widget get _sunriseSunset => Text(
      'Sunrise: '+ _weather.sun.formattedSunrise +
      '\nSunset: '+_weather.sun.formattedSunset,
      style: TextStyle(fontSize: 18)
  );

  //todo kraj, niebieska czesc (ikona + opis + styl), dolna (styl + czas);

}
