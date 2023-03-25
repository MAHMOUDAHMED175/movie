import 'package:equatable/equatable.dart';



//بيتأكد ان الداتا متتكررش مرتين
class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> generIds;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.backdropPath,
    required this.generIds,
    required this.overview,
    required this.releaseDate,
  });

  @override
  List<Object> get props =>
      [id, title, backdropPath, generIds, overview, voteAverage,releaseDate];


}
