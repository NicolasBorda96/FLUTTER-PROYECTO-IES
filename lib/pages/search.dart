import 'package:buscadorspotify/models/album.model.dart';
import 'package:buscadorspotify/models/artist.model.dart';
import 'package:buscadorspotify/models/track.model.dart';
import 'package:buscadorspotify/provider/search.provider.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final String tipo;

  SearchPage({this.tipo});

  @override
  _SearchPageState createState() => _SearchPageState(tipo: tipo);
}

class _SearchPageState extends State<SearchPage> {
  final String tipo;
  TextEditingController _controller = TextEditingController();
  Widget resultado = Container();

  _SearchPageState({this.tipo});

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
          "Buscar por $tipo",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                height: 60,
                child: TextField(
                  controller: _controller,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: tipo == "canción"
                        ? "Titulo de la canción"
                        : (tipo == "álbum"
                            ? "Titulo del álbum"
                            : "Nombre del artista"),
                  ),
                  onSubmitted: (String value) {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      _buscar(value);
                    });
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              height: 60,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  setState(() {
                    _buscar(_controller.text);
                  });
                },
                child: Text(
                  "Buscar",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: resultado,
        ),
      ],
    );
  }

  void _buscar(String search) {
    SearchProvider trackProvider = SearchProvider();
    if (tipo == "canción") {
      resultado = FutureBuilder(
          future: trackProvider.searchTrack(search),
          builder: (BuildContext context, AsyncSnapshot<List<Track>> snapshot) {
            if (snapshot.hasData) {
              final List<Track> datos = snapshot.data;
              List<Text> list = [];
              datos.forEach((item) {
                list.add(Text(item.name));
              });
              return ListView(children: list);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    } else if (tipo == "álbum") {
      resultado = FutureBuilder(
          future: trackProvider.searchAlbum(search),
          builder: (BuildContext context, AsyncSnapshot<List<Album>> snapshot) {
            if (snapshot.hasData) {
              final List<Album> datos = snapshot.data;
              List<Text> list = [];
              datos.forEach((item) {
                list.add(Text(item.name));
              });
              return ListView(children: list);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    } else {
      resultado = FutureBuilder(
          future: trackProvider.searchArtist(search),
          builder:
              (BuildContext context, AsyncSnapshot<List<Artist>> snapshot) {
            if (snapshot.hasData) {
              final List<Artist> datos = snapshot.data;
              List<Text> list = [];
              datos.forEach((item) {
                list.add(Text(item.name));
              });
              return ListView(children: list);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }
  }
}
