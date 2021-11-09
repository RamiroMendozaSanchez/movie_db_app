
class SerieImage {
  final String iconUrl;
  final String mediumUrl;
  final String screenUrl;
  final String smallUrl;

  SerieImage({
    this.iconUrl,
    this.mediumUrl,
    this.screenUrl,
    this.smallUrl,
  });

  factory SerieImage.fromJson(dynamic json) {
    if (json == null) {
      return SerieImage();
    }

    return SerieImage(
      iconUrl: json['icon_url'],
      mediumUrl: json['medium_url'],
      screenUrl: json['screen_url'],
      smallUrl: json['small_url'],
    );
  }
  @override
  List<Object> get props =>
      [iconUrl, mediumUrl, screenUrl, smallUrl];
}
