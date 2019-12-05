import 'package:flutter/material.dart';

import 'MyApp.dart';

//Corro la aplicacion
void main() => runApp(
        // Esta es la aplicación principal.
        MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      home: MyApp(),
    ));
