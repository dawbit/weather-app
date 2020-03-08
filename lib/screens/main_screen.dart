import 'package:flutter/material.dart';

import 'package:weatherapp/screens/main_content.dart';
import 'package:weatherapp/screens/weather_details.dart';

import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:weatherapp/blocks/weather_block.dart';
import 'package:weatherapp/models/weather_response.dart';

import 'package:weatherapp/screens/main_screen.dart';
import 'package:weatherapp/screens/weather_details.dart';

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