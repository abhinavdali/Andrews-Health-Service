// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  List<News> news;

  NewsModel({
    required this.news,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    news: List<News>.from(json["news"].map((x) => News.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "news": List<dynamic>.from(news.map((x) => x.toJson())),
  };
}

class News {
  String id;
  String title;
  String link;
  String date;
  int v;

  News({
    required this.id,
    required this.title,
    required this.link,
    required this.date,
    required this.v,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
    id: json["_id"],
    title: json["title"],
    link: json["link"],
    date: json["date"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "link": link,
    "date": date,
    "__v": v,
  };
}
