import 'package:buscadorspotify/models/artist.model.dart';
import 'package:buscadorspotify/models/util.model.dart';

class Album {
  Album({
    this.artists,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.popularity,
    this.releaseDate,
    this.releaseDatePrecision,
    this.type,
    this.uri,
  });

  List<Artist> artists;
  ExternalUrls externalUrls;
  String href;
  String id;
  List<Image> images;
  String name;
  int popularity;
  String releaseDate;
  String releaseDatePrecision;
  String type;
  String uri;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        artists:
            List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"],
        popularity: json["popularity"] != null ? json["popularity"] : 0,
        releaseDate: json["release_date"],
        releaseDatePrecision: json["release_date_precision"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "name": name,
        "popularity": popularity,
        "release_date": releaseDate,
        "release_date_precision": releaseDatePrecision,
        "type": type,
        "uri": uri,
      };
}
