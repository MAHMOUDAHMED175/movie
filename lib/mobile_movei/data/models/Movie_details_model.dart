import 'package:movei_api/mobile_movei/data/models/generes_model.dart';
import 'package:movei_api/mobile_movei/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      { required super.backbropPath,
      required super.id,
      required super.overview,
        required super.releaseData,
      required super.runtime,
      required super.title,
      required super.voteAverage,
      required super.genres});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        backbropPath: json["backdrop_path"],
        genres: List<GenresModel>.from(
            json["genres"].map((x) => GenresModel.fromJson(x))),
        id: json["id"],
        overview: json["overview"],
        releaseData: json["release_date"],
        runtime: json["runtime"],
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
      );
}
