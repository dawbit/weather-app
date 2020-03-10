import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:weatherapp/blocks/weather_block.dart';
import 'package:weatherapp/models/weather_response.dart';
import 'package:weatherapp/screens/weather_details.dart';

class MainContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainContentState();
}

class MainContentState extends State<MainContent> {
  TextEditingController _searchController;
  WeatherBloc _weatherBloc;
  StreamSubscription _weatherSubscription;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _weatherBloc = BlocProvider.getBloc();
    _weatherSubscription = _weatherBloc.weatherObservable.listen(_navigateToDetails);
  }

  @override
  void dispose() {
    super.dispose();
    _weatherSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather app'),
      ),
      body: Form(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: TextFormField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search by city...',
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                _weatherBloc.getWeatherForCity(_searchController.text);
              },
            )
          ],
        ),
      ),
    );
  }

  void _navigateToDetails(WeatherResponse weather) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => WeatherDetailsScreen(weather)));
  }
}
