import 'package:flutter/material.dart';
import 'package:diglog/app.dart';
import 'package:url_strategy/url_strategy.dart';

//Provider
import 'package:provider/provider.dart';
import 'package:diglog/services/appState.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'DigLog',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => App(),
        },
      ),
    ),
  );
}
