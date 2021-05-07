class ExternalUrls {
  ExternalUrls({
    this.spotify,
  });

  String spotify;

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
      );

  Map<String, dynamic> toJson() => {
        "spotify": spotify,
      };
}

class Image {
  Image({
    this.height,
    this.url,
    this.width,
  });

  int height;
  String url;
  int width;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        height: json["height"],
        url: json["url"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
      };
}

class Token {
  Token({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  String accessToken;
  String tokenType;
  int expiresIn;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
      };
}
