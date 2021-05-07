import 'dart:convert' as convert;
import 'package:buscadorspotify/models/album.model.dart';
import 'package:buscadorspotify/models/artist.model.dart';
import 'package:buscadorspotify/models/track.model.dart';
import 'package:buscadorspotify/provider/token.provider.dart';
import 'package:http/http.dart' as http;

class SearchProvider {
  Future<List<Track>> searchTrack(String search) async {
    TokenProvider tokenProvider = TokenProvider();
    await tokenProvider.getToken();
    String tokenType = tokenProvider.token.tokenType;
    String accessToken = tokenProvider.token.accessToken;
    print('$tokenType $accessToken');
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
    TokenProvider tokenProvider = TokenProvider();
    await tokenProvider.getToken();
    String tokenType = tokenProvider.token.tokenType;
    String accessToken = tokenProvider.token.accessToken;
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
    TokenProvider tokenProvider = TokenProvider();
    await tokenProvider.getToken();
    String tokenType = tokenProvider.token.tokenType;
    String accessToken = tokenProvider.token.accessToken;
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
}
