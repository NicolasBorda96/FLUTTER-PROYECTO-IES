import 'package:buscadorspotify/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

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
          child: GestureDetector(
            onTap: () {
              SystemNavigator.pop();
            },
            child: Icon(
              Icons.cancel_outlined,
              size: 40,
              color: Colors.red,
            ),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: SearchPage(
                        tipo: "canción",
                      ),
                      type: PageTransitionType.rightToLeft,
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: 250,
              height: 60,
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text(
                  "Álbum",
                  style: TextStyle(fontSize: 35),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: SearchPage(
                        tipo: "álbum",
                      ),
                      type: PageTransitionType.rightToLeft,
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                },
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
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: SearchPage(
                        tipo: "artista",
                      ),
                      type: PageTransitionType.rightToLeft,
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            "AppsLand",
            style: GoogleFonts.courgette(
              textStyle: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
