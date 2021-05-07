import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Padding(
         padding: const EdgeInsets.fromLTRB(30, 10, 10, 30),
         child: Image(
           image: AssetImage("assets/Spotify_Logo_RGB_Green.png"),
         ),
       ),
       Padding(padding: EdgeInsets.all(40),
          child: Text("Titulo de la canción",
           style: TextStyle(fontSize: 40))
         
       ),
       Column(
         children: [
           Text("Titulo del album",
           style: TextStyle(fontSize: 30))
         ],
       ),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           Text("Duracion: "),
           Text("Pista 4")
         ],
       ),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           Text("Fecha: "),
           Text("Contenido")
         ],
       ),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           Text("Popularidad "),
           RatingBar.builder(
            initialRating: 2,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          )

         ],
       ),
       Column(
         children: [
           Container(
              width: 250,
              height: 60,
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text(
                  "Reproducir", 
                  style: TextStyle(fontSize: 35),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                onPressed: () {
                  
                },
              ),
            ),
         ],
       )
      ],
    );
  }
}
