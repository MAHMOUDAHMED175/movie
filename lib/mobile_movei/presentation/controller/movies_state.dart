import 'package:equatable/equatable.dart';

import '../../../core/utils/enums.dart';
import '../../domain/entities/movie.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  final List<Movie> popularMovie;
  final RequestState popularState;
  final String popularMessage;

  final List<Movie> topRatedMovie;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MovieState({
    this.topRatedMovie = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = 'Error',
    this.popularMovie = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = 'Error',
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = 'Error',
  });

  MovieState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movie>? popularMovie,
    RequestState? popularState,
    String? popularMessage,
    List<Movie>? topRatedMovie,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) {
    return MovieState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovie: popularMovie ?? this.popularMovie,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovie: topRatedMovie ?? this.topRatedMovie,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        popularMovie,
        popularState,
        popularMessage,
        topRatedMovie,
        topRatedState,
        topRatedMessage,
      ];
}


