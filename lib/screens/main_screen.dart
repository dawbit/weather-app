import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final city = await Navigator.push(
                context,
                MaterialPageRoute(
                  //builder: (context) => CitySelection(),
                ),
              );
              if (city != null) {
//                BlocProvider.of<WeatherBloc>(context)
//                    .add(FetchWeather(city: city));
              }
            },
          )
        ],
      ),
      body: Listener(
      ),
    );
  }
}