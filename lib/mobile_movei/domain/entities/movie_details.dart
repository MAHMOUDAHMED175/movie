import 'package:equatable/equatable.dart';
import 'package:movei_api/mobile_movei/domain/entities/generes.dart';

class MovieDetails extends Equatable {

  final String backbropPath;
  final List<Genres> genres;
  final int id;
  final String overview;
  final String releaseData;
  final int runtime;
  final String title;
  final double voteAverage;

  const MovieDetails(
      {required this.backbropPath,
      required this.id,
      required this.overview,
      required this.releaseData,
      required this.runtime,
      required this.title,
      required this.voteAverage,
      required this.genres});

  @override
  List<Object> get props => [
        backbropPath,
        id,
        overview,
        genres,
        releaseData,
        runtime,
        title,
        voteAverage,
      ];
}
