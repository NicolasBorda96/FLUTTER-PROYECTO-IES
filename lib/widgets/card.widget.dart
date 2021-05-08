import 'package:buscadorspotify/models/album.model.dart';
import 'package:buscadorspotify/models/artist.model.dart';
import 'package:buscadorspotify/models/track.model.dart';
import 'package:buscadorspotify/models/util.model.dart' as util;
import 'package:buscadorspotify/pages/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:page_transition/page_transition.dart';

class CardWidget extends StatelessWidget {
  final String tipo;
  final Track track;
  final Album album;
  final Artist artist;

  CardWidget({this.tipo, this.track, this.album, this.artist});

  @override
  Widget build(BuildContext context) {
    if (tipo == "canción") {
      return getCardTrack(context);
    } else if (tipo == "álbum") {
      return getCardAlbum(context);
    } else {
      return getCardArtist(context);
    }
  }

  Widget getCardTrack(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              child: DetailPage(tipo: "canción", id: track.id),
              type: PageTransitionType.rightToLeft,
              duration: Duration(milliseconds: 300),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(5),
          color: Colors.black26,
          child: Row(
            children: [
              Container(
                height: 130,
                width: 130,
                padding: EdgeInsets.all(5),
                child: getImage(track.album.images),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        track.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        track.artists.first.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Duración: ${millisToMinutesAndSeconds(track.durationMs)}',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    getRating(track.popularity),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCardAlbum(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              child: DetailPage(tipo: "álbum", id: album.id),
              type: PageTransitionType.rightToLeft,
              duration: Duration(milliseconds: 300),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(5),
          color: Colors.black26,
          child: Row(
            children: [
              Container(
                height: 130,
                width: 130,
                padding: EdgeInsets.all(5),
                child: getImage(album.images),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        album.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        album.artists.first.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Fecha: ${album.releaseDate}',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    getRating(album.popularity),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCardArtist(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              child: DetailPage(tipo: 'artista', id: artist.id),
              type: PageTransitionType.rightToLeft,
              duration: Duration(milliseconds: 300),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(5),
          color: Colors.black26,
          child: Row(
            children: [
              Container(
                height: 130,
                width: 130,
                padding: EdgeInsets.all(5),
                child: getImage(artist.images),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        artist.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "Generos: ${listToString(artist.genres)}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    getRating(artist.popularity),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String millisToMinutesAndSeconds(int millis) {
    int minutes = (millis / 60000).floor();
    int seconds = int.parse(((millis % 60000) / 1000).toStringAsFixed(0));
    return '${(minutes < 10 ? "0" : "")}$minutes:${(seconds < 10 ? "0" : "")}$seconds';
  }

  String listToString(List list) {
    String text = list.toString();
    text = text.substring(1, text.length - 1);
    return text == "" ? "Sin información" : text;
  }

  Widget getImage(List<util.Image> images) {
    return images == null
        ? Image(
            image: AssetImage('assets/images/image-not-available.png'),
          )
        : FadeInImage(
            placeholder: AssetImage('assets/images/loading-animation.gif'),
            image: NetworkImage(images[1].url));
  }

  RatingBar getRating(int popularity) {
    return RatingBar.builder(
      initialRating: popularity / 20,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 1),
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}