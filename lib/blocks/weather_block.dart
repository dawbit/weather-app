import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:weatherapp/models/weather_response.dart';
import 'package:weatherapp/repositories/weather_repository.dart';

class WeatherBloc extends BlocBase {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository);

  BehaviorSubject<WeatherResponse> _weatherSubject = BehaviorSubject();
  Stream<WeatherResponse> get weatherObservable => _weatherSubject.stream;

  BehaviorSubject<bool> _loadingWeatherSubject = BehaviorSubject();
  Stream<bool> get loadingWeatherObservable => _loadingWeatherSubject.stream;

  Future getWeatherForCity(String city) async {
    _loadingWeatherSubject.add(true);
    _weatherRepository.getWeatherForCity(city)
        .then(_onWeatherSuccess)
        .catchError(_onWeatherError);
  }

  Future _onWeatherSuccess(WeatherResponse weather) async {
    _loadingWeatherSubject.add(false);
    _weatherSubject.add(weather);
  }

  Future _onWeatherError(e) async {
    _loadingWeatherSubject.add(false);
    _weatherSubject.addError(e);
  }

  @override
  void dispose() {
    super.dispose();
    _weatherSubject.close();
    _loadingWeatherSubject.close();
  }
}