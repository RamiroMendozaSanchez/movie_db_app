class FirstEpisode {
  String apiDetailUrl;
  int id;
  String name;
  String siteDetailUrl;
  String count;
  String episodeNumber;

  FirstEpisode({
    this.apiDetailUrl,
    this.id,
    this.name,
    this.siteDetailUrl,
    this.count,
    this.episodeNumber,
  });

  factory FirstEpisode.fromJson(dynamic json) {
    if (json == null) {
      return FirstEpisode();
    }

    return FirstEpisode(
        apiDetailUrl: json['api_detail_url'],
        id: json['id'],
        name: json['name'],
        siteDetailUrl: json['site_detail_url'],
        count: json['count'],
        episodeNumber: json['episode_number'],
        );
  }

  @override
  List<Object> get props =>
      [apiDetailUrl, id, name, siteDetailUrl, count, episodeNumber];
}