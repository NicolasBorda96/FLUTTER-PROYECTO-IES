import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final String tipo;

  SearchPage({this.tipo});

  @override
  _SearchPageState createState() => _SearchPageState(tipo: tipo);
}

class _SearchPageState extends State<SearchPage> {
  final String tipo;

  _SearchPageState({this.tipo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Buscar por $tipo",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container();
  }
}
