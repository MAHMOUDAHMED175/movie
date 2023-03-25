import 'package:movei_api/mobile_movei/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({required super.id,
    required super.title,
    required super.voteAverage,
    required super.backdropPath,
    required super.generIds,
    required super.overview,
    required super.releaseDate});


  factory MovieModel.fromJson(Map<String, dynamic> json)=>
      MovieModel(
        id: json["id"],
        title: json["title"],
        backdropPath: json["backdrop_path"],
        generIds: List<int>.from(json["genre_ids"].map((e) => e)),
        overview: json["overview"],
        voteAverage: json["vote_average"].toDouble(),
        releaseDate: json["release_date"],
        );
}



