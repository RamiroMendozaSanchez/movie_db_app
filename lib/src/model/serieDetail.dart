// To parse this JSON data, do
//
//     final serieDetails = serieDetailsFromJson(jsonString);

import 'dart:convert';

SerieDetails serieDetailsFromJson(String str) => SerieDetails.fromJson(json.decode(str));

String serieDetailsToJson(SerieDetails data) => json.encode(data.toJson());


class SerieDetails {
    SerieDetails({
        this.aliases,
        this.apiDetailUrl,
        this.characters,
        this.countOfEpisodes,
        this.dateAdded,
        this.dateLastUpdated,
        this.deck,
        this.description,
        this.episodes,
        this.firstEpisode,
        this.id,
        this.image,
        this.lastEpisode,
        this.name,
        this.publisher,
        this.siteDetailUrl,
        this.startYear,
    });

    String aliases;
    String apiDetailUrl;
    List<FirstEpisode> characters;
    int countOfEpisodes;
    DateTime dateAdded;
    DateTime dateLastUpdated;
    dynamic deck;
    String description;
    List<FirstEpisode> episodes;
    FirstEpisode firstEpisode;
    int id;
    Image image;
    FirstEpisode lastEpisode;
    String name;
    FirstEpisode publisher;
    String siteDetailUrl;
    String startYear;

    factory SerieDetails.fromJson(Map<String, dynamic> json) => SerieDetails(
        aliases: json["aliases"],
        apiDetailUrl: json["api_detail_url"],
        characters: List<FirstEpisode>.from(json["characters"].map((x) => FirstEpisode.fromJson(x))),
        countOfEpisodes: json["count_of_episodes"],
        dateAdded: DateTime.parse(json["date_added"]),
        dateLastUpdated: DateTime.parse(json["date_last_updated"]),
        deck: json["deck"],
        description: json["description"],
        episodes: List<FirstEpisode>.from(json["episodes"].map((x) => FirstEpisode.fromJson(x))),
        firstEpisode: FirstEpisode.fromJson(json["first_episode"]),
        id: json["id"],
        image: Image.fromJson(json["image"]),
        lastEpisode: FirstEpisode.fromJson(json["last_episode"]),
        name: json["name"],
        publisher: FirstEpisode.fromJson(json["publisher"]),
        siteDetailUrl: json["site_detail_url"],
        startYear: json["start_year"],
    );

    Map<String, dynamic> toJson() => {
        "aliases": aliases,
        "api_detail_url": apiDetailUrl,
        "characters": List<dynamic>.from(characters.map((x) => x.toJson())),
        "count_of_episodes": countOfEpisodes,
        "date_added": dateAdded.toIso8601String(),
        "date_last_updated": dateLastUpdated.toIso8601String(),
        "deck": deck,
        "description": description,
        "episodes": List<dynamic>.from(episodes.map((x) => x.toJson())),
        "first_episode": firstEpisode.toJson(),
        "id": id,
        "image": image.toJson(),
        "last_episode": lastEpisode.toJson(),
        "name": name,
        "publisher": publisher.toJson(),
        "site_detail_url": siteDetailUrl,
        "start_year": startYear,
    };
}

class FirstEpisode {
    FirstEpisode({
        this.apiDetailUrl,
        this.id,
        this.name,
        this.siteDetailUrl,
        this.count,
        this.episodeNumber,
    });

    String apiDetailUrl;
    int id;
    String name;
    String siteDetailUrl;
    String count;
    String episodeNumber;

    factory FirstEpisode.fromJson(Map<String, dynamic> json) => FirstEpisode(
        apiDetailUrl: json["api_detail_url"],
        id: json["id"],
        name: json["name"],
        siteDetailUrl: json["site_detail_url"] == null ? null : json["site_detail_url"],
        count: json["count"] == null ? null : json["count"],
        episodeNumber: json["episode_number"] == null ? null : json["episode_number"],
    );

    Map<String, dynamic> toJson() => {
        "api_detail_url": apiDetailUrl,
        "id": id,
        "name": name,
        "site_detail_url": siteDetailUrl == null ? null : siteDetailUrl,
        "count": count == null ? null : count,
        "episode_number": episodeNumber == null ? null : episodeNumber,
    };
}

class Image {
    Image({
        this.iconUrl,
        this.mediumUrl,
        this.screenUrl,
        this.screenLargeUrl,
        this.smallUrl,
        this.superUrl,
        this.thumbUrl,
        this.tinyUrl,
        this.originalUrl,
        this.imageTags,
    });

    String iconUrl;
    String mediumUrl;
    String screenUrl;
    String screenLargeUrl;
    String smallUrl;
    String superUrl;
    String thumbUrl;
    String tinyUrl;
    String originalUrl;
    String imageTags;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        iconUrl: json["icon_url"],
        mediumUrl: json["medium_url"],
        screenUrl: json["screen_url"],
        screenLargeUrl: json["screen_large_url"],
        smallUrl: json["small_url"],
        superUrl: json["super_url"],
        thumbUrl: json["thumb_url"],
        tinyUrl: json["tiny_url"],
        originalUrl: json["original_url"],
        imageTags: json["image_tags"],
    );

    Map<String, dynamic> toJson() => {
        "icon_url": iconUrl,
        "medium_url": mediumUrl,
        "screen_url": screenUrl,
        "screen_large_url": screenLargeUrl,
        "small_url": smallUrl,
        "super_url": superUrl,
        "thumb_url": thumbUrl,
        "tiny_url": tinyUrl,
        "original_url": originalUrl,
        "image_tags": imageTags,
    };
}
