import 'package:flutter/material.dart';

import 'package:weatherapp/screens/main_content.dart';

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
                  builder: (context) => MainContent(),
                ),
              );
              if (city != null && city.length > 0) {
                // todo...
                print(city.length);
                print(city);
              }
            }
          )
        ],
      ),
      body: Listener(
      ),
    );
  }
}