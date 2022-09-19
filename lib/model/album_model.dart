import 'dart:convert';

class AlbumModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;
  AlbumModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });
  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
        title: json['title'],
        url: json['url'],
        thumbnailUrl: json['thumbnailUrl'],
        id: json['id'],
        albumId: json['albumId']);
  }
}
