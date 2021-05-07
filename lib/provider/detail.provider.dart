import 'dart:convert' as convert;
import 'package:buscadorspotify/models/album.model.dart';
import 'package:buscadorspotify/models/artist.model.dart';
import 'package:buscadorspotify/models/track.model.dart';
import 'package:buscadorspotify/provider/token.provider.dart';
import 'package:http/http.dart' as http;

class DetailProvider {
  Future<Track> getTrack(String id) async {
    TokenProvider tokenProvider = TokenProvider();
    await tokenProvider.getToken();
    String tokenType = tokenProvider.token.tokenType;
    String accessToken = tokenProvider.token.accessToken;
    Map<String, String> queryParameters = {};
    Map<String, String> headerParameters = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': '$tokenType $accessToken',
    };
    var url = Uri.https('api.spotify.com', '/v1/tracks/$id', queryParameters);
    var response = await http.get(url, headers: headerParameters);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      Track track = Track.fromJson(jsonResponse);
      return track;
    } else {
      return Track();
    }
  }

  Future<Album> getAlbum(String id) async {
    TokenProvider tokenProvider = TokenProvider();
    await tokenProvider.getToken();
    String tokenType = tokenProvider.token.tokenType;
    String accessToken = tokenProvider.token.accessToken;
    Map<String, String> queryParameters = {};
    Map<String, String> headerParameters = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': '$tokenType $accessToken',
    };
    var url = Uri.https('api.spotify.com', '/v1/albums/$id', queryParameters);
    var response = await http.get(url, headers: headerParameters);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      Album album = Album.fromJson(jsonResponse);
      return album;
    } else {
      return Album();
    }
  }

  Future<Artist> getArtist(String id) async {
    TokenProvider tokenProvider = TokenProvider();
    await tokenProvider.getToken();
    String tokenType = tokenProvider.token.tokenType;
    String accessToken = tokenProvider.token.accessToken;
    Map<String, String> queryParameters = {};
    Map<String, String> headerParameters = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': '$tokenType $accessToken',
    };
    var url = Uri.https('api.spotify.com', '/v1/artists/$id', queryParameters);
    var response = await http.get(url, headers: headerParameters);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      Artist artist = Artist.fromJson(jsonResponse);
      return artist;
    } else {
      return Artist();
    }
  }
}
