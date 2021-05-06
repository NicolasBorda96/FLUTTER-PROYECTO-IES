import 'package:buscadorspotify/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Buscador de Spotify',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
