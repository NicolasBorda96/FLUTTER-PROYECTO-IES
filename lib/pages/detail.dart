import 'package:buscadorspotify/models/track.model.dart';
import 'package:buscadorspotify/provider/detail.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:buscadorspotify/widgets/card.widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  String id;

  DetailPage({this.id});

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
    DetailProvider detailProvider = DetailProvider();
    CardWidget card = CardWidget();
    return FutureBuilder(
        future: detailProvider.getTrack(id),
        builder: (BuildContext context, AsyncSnapshot<Track> snapshot) {
          if (snapshot.hasData) {
            Track track = snapshot.data;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 10, 30),
                  child: card.getImage(track.album.images),
                ),
                Padding(
                    padding: EdgeInsets.all(40),
                    child: Text(track.name, style: TextStyle(fontSize: 40))),
                Column(
                  children: [
                    Text(track.album.name, style: TextStyle(fontSize: 30))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Duracion: "),
                    Text(card.millisToMinutesAndSeconds(track.durationMs)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text("Fecha: "), Text(track.album.releaseDate)],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Popularidad: "),
                    RatingBar.builder(
                      initialRating: track.popularity / 20,
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
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                        ),
                        onPressed: () {
                          launch(track.externalUrls.spotify);
                        },
                      ),
                    ),
                  ],
                )
              ],
            );
          } else {
            return Container();
          }
        });
  }
}
