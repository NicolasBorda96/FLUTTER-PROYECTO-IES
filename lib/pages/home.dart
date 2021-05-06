import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(10, 30, 0, 0),
          height: 40,
          child: Icon(
            Icons.cancel_outlined,
            size: 40,
            color: Colors.red,
          ),
        ),
        Column(
          children: [
            Text(
              "Buscador de",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
              child: Image(
                image: AssetImage("assets/Spotify_Logo_RGB_Green.png"),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Busca por",
              style: TextStyle(fontSize: 40),
            ),
            Container(
              width: 250,
              height: 60,
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text(
                  "Canción",
                  style: TextStyle(fontSize: 35),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                onPressed: () {},
              ),
            ),
            Container(
              width: 250,
              height: 60,
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text(
                  "Album",
                  style: TextStyle(fontSize: 35),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                onPressed: () {},
              ),
            ),
            Container(
              width: 250,
              height: 60,
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text(
                  "Artista",
                  style: TextStyle(fontSize: 35),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            "AppsLand",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
