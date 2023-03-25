part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final List<Recommendation>? movieRecommendation;
  final RequestState movieRecomendationState;
  final String movieRecommendationMessage;

  const MovieDetailsState({
    this.movieRecommendation = const[],
    this.movieRecomendationState = RequestState.loading,
    this.movieRecommendationMessage = "",
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = "",
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,


    List<Recommendation>? movieRecommendation,
    RequestState? movieRecomendationState,
    String? movieRecommendationMessage,


  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,


      movieRecomendationState: movieRecomendationState ??
          this.movieRecomendationState,
      movieRecommendation: movieRecommendation ?? this.movieRecommendation,
      movieRecommendationMessage: movieRecommendationMessage ??
          this.movieRecommendationMessage,
    );
  }


  @override
  List<Object?> get props =>
      [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
        movieRecommendation,
        movieRecomendationState,
        movieRecommendationMessage,
      ];
}


