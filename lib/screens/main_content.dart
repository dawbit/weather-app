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

  Widget get _content => StreamBuilder<List<String>>(
      //stream: _citiesBloc.citiesObservable,
      builder: (context, snapshot) {
        return CustomScrollView(
          slivers: <Widget>[
            //_header,
            //_getCitiesList(snapshot)
          ],
        );
      }
  );

  Widget get _loader => StreamBuilder<bool>(
    stream: _weatherBloc.loadingWeatherObservable,
    initialData: false,
    builder: (context, snapshot) {
      if(snapshot.data) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey.withAlpha(100),
          ),
          child: CircularProgressIndicator(),
        );
      } else {
        return Container();
      }
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
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
                    hintText: 'City name',
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
