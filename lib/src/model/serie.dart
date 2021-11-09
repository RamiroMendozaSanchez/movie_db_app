// To parse this JSON data, do
//
//     final serie = serieFromJson(jsonString);

import 'dart:convert';

Serie serieFromJson(String str) => Serie.fromJson(json.decode(str));

String serieToJson(Serie data) => json.encode(data.toJson());


class Serie {
    Serie({
        this.aliases,
        this.apiDetailUrl,
        this.countOfEpisodes,
        this.dateAdded,
        this.dateLastUpdated,
        this.deck,
        this.description,
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
    int countOfEpisodes;
    DateTime dateAdded;
    DateTime dateLastUpdated;
    String deck;
    String description;
    FirstEpisode firstEpisode;
    int id;
    Image image;
    FirstEpisode lastEpisode;
    String name;
    FirstEpisode publisher;
    String siteDetailUrl;
    String startYear;

    factory Serie.fromJson(Map<String, dynamic> json) => Serie(
        aliases: json["aliases"] == null ? null : json["aliases"],
        apiDetailUrl: json["api_detail_url"],
        countOfEpisodes: json["count_of_episodes"],
        dateAdded: DateTime.parse(json["date_added"]),
        dateLastUpdated: DateTime.parse(json["date_last_updated"]),
        deck: json["deck"] == null ? null : json["deck"],
        description: json["description"] == null ? null : json["description"],
        firstEpisode: FirstEpisode.fromJson(json["first_episode"]),
        id: json["id"],
        image: Image.fromJson(json["image"]),
        lastEpisode: FirstEpisode.fromJson(json["last_episode"]),
        name: json["name"],
        publisher: json["publisher"] == null ? null : FirstEpisode.fromJson(json["publisher"]),
        siteDetailUrl: json["site_detail_url"],
        startYear: json["start_year"],
    );

    Map<String, dynamic> toJson() => {
        "aliases": aliases == null ? null : aliases,
        "api_detail_url": apiDetailUrl,
        "count_of_episodes": countOfEpisodes,
        "date_added": dateAdded.toIso8601String(),
        "date_last_updated": dateLastUpdated.toIso8601String(),
        "deck": deck == null ? null : deck,
        "description": description == null ? null : description,
        "first_episode": firstEpisode.toJson(),
        "id": id,
        "image": image.toJson(),
        "last_episode": lastEpisode.toJson(),
        "name": name,
        "publisher": publisher == null ? null : publisher.toJson(),
        "site_detail_url": siteDetailUrl,
        "start_year": startYear,
    };
}

class FirstEpisode {
    FirstEpisode({
        this.apiDetailUrl,
        this.id,
        this.name,
        this.episodeNumber,
    });

    String apiDetailUrl;
    int id;
    String name;
    String episodeNumber;

    factory FirstEpisode.fromJson(Map<String, dynamic> json) => FirstEpisode(
        apiDetailUrl: json["api_detail_url"],
        id: json["id"],
        name: json["name"],
        episodeNumber: json["episode_number"] == null ? null : json["episode_number"],
    );

    Map<String, dynamic> toJson() => {
        "api_detail_url": apiDetailUrl,
        "id": id,
        "name": name,
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
    ImageTags imageTags;

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
        imageTags: imageTagsValues.map[json["image_tags"]],
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
        "image_tags": imageTagsValues.reverse[imageTags],
    };
}

enum ImageTags { ALL_IMAGES, ALL_IMAGES_WIKI_X_MEN_EVOLUTION_TITLE_CARDS, ALL_IMAGES_WIKI, ALL_IMAGES_STAR_WARS, ALL_IMAGES_THE_FAMILY, ALL_IMAGES_OTHERS, ALL_IMAGES_SILVER_SURFER_ANIMATED_1998, ALL_IMAGES_OFFICIAL_SERIES_ART }

final imageTagsValues = EnumValues({
    "All Images": ImageTags.ALL_IMAGES,
    "All Images,Official Series Art": ImageTags.ALL_IMAGES_OFFICIAL_SERIES_ART,
    "All Images,Others": ImageTags.ALL_IMAGES_OTHERS,
    "All Images,Silver Surfer Animated (1998)": ImageTags.ALL_IMAGES_SILVER_SURFER_ANIMATED_1998,
    "All Images,Star Wars": ImageTags.ALL_IMAGES_STAR_WARS,
    "All Images,The Family": ImageTags.ALL_IMAGES_THE_FAMILY,
    "All Images,Wiki": ImageTags.ALL_IMAGES_WIKI,
    "All Images,Wiki - X-Men Evolution Title Cards": ImageTags.ALL_IMAGES_WIKI_X_MEN_EVOLUTION_TITLE_CARDS
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
