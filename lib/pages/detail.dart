import 'package:buscadorspotify/models/album.model.dart';
import 'package:buscadorspotify/models/track.model.dart';
import 'package:buscadorspotify/provider/detail.provider.dart';
import 'package:flutter/material.dart';
import 'package:buscadorspotify/widgets/card.widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  String id;
  String tipo;

  DetailPage({this.tipo, this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 38),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Detalle",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    if (tipo == "canción") {
      return getDetailTrack();
    }else if (tipo == "álbum") {
      return getDetailAlbum();
    }else{
      return Container();
    } 
  }

  Widget getDetailTrack() {
    DetailProvider detailProvider = DetailProvider();
    CardWidget card = CardWidget();
    return FutureBuilder(
        future: detailProvider.getTrack(id),
        builder: (BuildContext context, AsyncSnapshot<Track> snapshot) {
          if (snapshot.hasData) {
            Track track = snapshot.data;
            return Column(
              children: [
                Container(
                  width: 300,
                  height: 300,
                  padding: EdgeInsets.all(20),
                  child: card.getImage(track.album.images),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    track.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    'Álbum: ${track.album.name}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                          "Duracion: ${card.millisToMinutesAndSeconds(track.durationMs)}"),
                      Text("Fecha: ${track.album.releaseDate}"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Popularidad: "),
                      card.getRating(track.popularity),
                    ],
                  ),
                ),
                Container(
                  width: 250,
                  height: 60,
                  margin: EdgeInsets.all(20),
                  child: ElevatedButton(
                    child: Text(
                      "Reproducir",
                      style: TextStyle(fontSize: 35),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: () {
                      launch(track.externalUrls.spotify);
                    },
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        });
  }

   Widget getDetailAlbum() {
    DetailProvider detailProvider = DetailProvider();
    CardWidget card = CardWidget();
    return FutureBuilder(
        future: detailProvider.getAlbum(id),
        builder: (BuildContext context, AsyncSnapshot<Album> snapshot) {
          if (snapshot.hasData) {
            Album album = snapshot.data;
            return Column(
              children: [
                Container(
                  width: 300,
                  height: 300,
                  padding: EdgeInsets.all(20),
                  child: card.getImage(album.images),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    album.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    'Artista: ${album.artists.first.name}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Tipo: ${album.type}"),
                      Text("Fecha: ${album.releaseDate}"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Popularidad: "),
                      card.getRating(album.popularity),
                    ],
                  ),
                ),
                Container(
                  width: 250,
                  height: 60,
                  margin: EdgeInsets.all(20),
                  child: ElevatedButton(
                    child: Text(
                      "Reproducir",
                      style: TextStyle(fontSize: 35),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: () {
                      launch(album.externalUrls.spotify);
                    },
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        });
  }
  
}