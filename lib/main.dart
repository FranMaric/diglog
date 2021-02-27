import 'package:flutter/material.dart';
import 'package:diglog/app.dart';

//Provider
import 'package:provider/provider.dart';
import 'package:diglog/appState.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => AppState(),
        child: MaterialApp(
          title: 'DigLog',
          debugShowCheckedModeBanner: false,
          home: App(),
        ),
      ),
    );
