import 'dart:convert' as convert;
import 'package:buscadorspotify/models/util.model.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class TokenProvider {
  Token token;

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
      token = Token.fromJson(jsonResponse);
    }
  }
}
