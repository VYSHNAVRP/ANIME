
class Anime {
  List<Data>? data;
  Meta? meta;

  Anime({this.data, this.meta});

  Anime.fromJson(Map<String, dynamic> json) {
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
    if(json["meta"] is Map) {
      meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
    }
  }

  static List<Anime> fromList(List<Map<String, dynamic>> list) {
    return list.map(Anime.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    if(meta != null) {
      _data["meta"] = meta?.toJson();
    }
    return _data;
  }

  Anime copyWith({
    List<Data>? data,
    Meta? meta,
  }) => Anime(
    data: data ?? this.data,
    meta: meta ?? this.meta,
  );
}

class Meta {
  int? page;
  int? size;
  int? totalData;
  int? totalPage;

  Meta({this.page, this.size, this.totalData, this.totalPage});

  Meta.fromJson(Map<String, dynamic> json) {
    if(json["page"] is num) {
      page = (json["page"] as num).toInt();
    }
    if(json["size"] is num) {
      size = (json["size"] as num).toInt();
    }
    if(json["totalData"] is num) {
      totalData = (json["totalData"] as num).toInt();
    }
    if(json["totalPage"] is num) {
      totalPage = (json["totalPage"] as num).toInt();
    }
  }

  static List<Meta> fromList(List<Map<String, dynamic>> list) {
    return list.map(Meta.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["page"] = page;
    _data["size"] = size;
    _data["totalData"] = totalData;
    _data["totalPage"] = totalPage;
    return _data;
  }

  Meta copyWith({
    int? page,
    int? size,
    int? totalData,
    int? totalPage,
  }) => Meta(
    page: page ?? this.page,
    size: size ?? this.size,
    totalData: totalData ?? this.totalData,
    totalPage: totalPage ?? this.totalPage,
  );
}

class Data {
  String? id;
  String? title;
  List<String>? alternativeTitles;
  int? ranking;
  List<String>? genres;
  int? episodes;
  bool? hasEpisode;
  bool? hasRanking;
  String? image;
  String? link;
  String? status;
  String? synopsis;
  String? thumb;
  String? type;

  Data({this.id, this.title, this.alternativeTitles, this.ranking, this.genres, this.episodes, this.hasEpisode, this.hasRanking, this.image, this.link, this.status, this.synopsis, this.thumb, this.type});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["alternativeTitles"] is List) {
      alternativeTitles = json["alternativeTitles"] == null ? null : List<String>.from(json["alternativeTitles"]);
    }
    if(json["ranking"] is num) {
      ranking = (json["ranking"] as num).toInt();
    }
    if(json["genres"] is List) {
      genres = json["genres"] == null ? null : List<String>.from(json["genres"]);
    }
    if(json["episodes"] is num) {
      episodes = (json["episodes"] as num).toInt();
    }
    if(json["hasEpisode"] is bool) {
      hasEpisode = json["hasEpisode"];
    }
    if(json["hasRanking"] is bool) {
      hasRanking = json["hasRanking"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    if(json["link"] is String) {
      link = json["link"];
    }
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["synopsis"] is String) {
      synopsis = json["synopsis"];
    }
    if(json["thumb"] is String) {
      thumb = json["thumb"];
    }
    if(json["type"] is String) {
      type = json["type"];
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["title"] = title;
    if(alternativeTitles != null) {
      _data["alternativeTitles"] = alternativeTitles;
    }
    _data["ranking"] = ranking;
    if(genres != null) {
      _data["genres"] = genres;
    }
    _data["episodes"] = episodes;
    _data["hasEpisode"] = hasEpisode;
    _data["hasRanking"] = hasRanking;
    _data["image"] = image;
    _data["link"] = link;
    _data["status"] = status;
    _data["synopsis"] = synopsis;
    _data["thumb"] = thumb;
    _data["type"] = type;
    return _data;
  }

  Data copyWith({
    String? id,
    String? title,
    List<String>? alternativeTitles,
    int? ranking,
    List<String>? genres,
    int? episodes,
    bool? hasEpisode,
    bool? hasRanking,
    String? image,
    String? link,
    String? status,
    String? synopsis,
    String? thumb,
    String? type,
  }) => Data(
    id: id ?? this.id,
    title: title ?? this.title,
    alternativeTitles: alternativeTitles ?? this.alternativeTitles,
    ranking: ranking ?? this.ranking,
    genres: genres ?? this.genres,
    episodes: episodes ?? this.episodes,
    hasEpisode: hasEpisode ?? this.hasEpisode,
    hasRanking: hasRanking ?? this.hasRanking,
    image: image ?? this.image,
    link: link ?? this.link,
    status: status ?? this.status,
    synopsis: synopsis ?? this.synopsis,
    thumb: thumb ?? this.thumb,
    type: type ?? this.type,
  );
}