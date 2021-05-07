import 'dart:convert' as convert;
import 'package:buscadorspotify/models/album.model.dart';
import 'package:buscadorspotify/models/artist.model.dart';
import 'package:buscadorspotify/models/track.model.dart';
import 'package:buscadorspotify/models/util.model.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class SearchProvider {
  String tokenType;
  String accessToken;

  Future<List<Track>> searchTrack(String search) async {
    await getToken();
    List<Track> listTrack = [];
    Map<String, String> queryParameters = {
      'q': search,
      'type': 'track',
    };
    Map<String, String> headerParameters = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': '$tokenType $accessToken',
    };
    var url = Uri.https('api.spotify.com', '/v1/search', queryParameters);
    var response = await http.get(url, headers: headerParameters);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      jsonResponse['tracks']['items']
          .forEach((item) => {listTrack.add(Track.fromJson(item))});
      return listTrack;
    } else {
      return [];
    }
  }

  Future<List<Album>> searchAlbum(String search) async {
    await getToken();
    List<Album> listAlbum = [];
    Map<String, String> queryParameters = {
      'q': search,
      'type': 'album',
    };
    Map<String, String> headerParameters = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': '$tokenType $accessToken',
    };
    var url = Uri.https('api.spotify.com', '/v1/search', queryParameters);
    var response = await http.get(url, headers: headerParameters);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      jsonResponse['albums']['items']
          .forEach((item) => {listAlbum.add(Album.fromJson(item))});
      return listAlbum;
    } else {
      return [];
    }
  }

  Future<List<Artist>> searchArtist(String search) async {
    await getToken();
    List<Artist> listArtist = [];
    Map<String, String> queryParameters = {
      'q': search,
      'type': 'artist',
    };
    Map<String, String> headerParameters = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': '$tokenType $accessToken',
    };
    var url = Uri.https('api.spotify.com', '/v1/search', queryParameters);
    var response = await http.get(url, headers: headerParameters);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      jsonResponse['artists']['items']
          .forEach((item) => {listArtist.add(Artist.fromJson(item))});
      return listArtist;
    } else {
      return [];
    }
  }

  Future<void> getToken() async {
    var jsonConfing = await rootBundle.loadString("assets/configs/config.json");
    Map<String, dynamic> data =
        convert.json.decode(jsonConfing) as Map<String, dynamic>;
    data = data['clientData'];
    String clave = convert.base64.encode(
        convert.utf8.encode('${data['clientId']}:${data['clientSecret']}'));
    Map<String, String> queryParameters = {
      'grant_type': 'client_credentials',
    };
    Map<String, String> headerParameters = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Basic $clave',
    };
    var url = Uri.https('accounts.spotify.com', '/api/token', queryParameters);
    var response = await http.post(url, headers: headerParameters);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      Token token = Token.fromJson(jsonResponse);
      tokenType = token.tokenType;
      accessToken = token.accessToken;
    } else {
      print(response.statusCode);
      print(response.body);
    }
  }
}
