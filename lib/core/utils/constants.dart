//https://api.themoviedb.org/3/movie/now_playing?api_key=c3435cfe40aeb079689227d82bf921d3
class AppConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apyKey = "3b840fae854b60b858d9bba1451b48d7";

  static const String nowPlayingPath =
      "$baseUrl/movie/now_playing?api_key=$apyKey";
  static const String popularPath = "$baseUrl/movie/popular?api_key=$apyKey";
  static const String topRatedPath = "$baseUrl/movie/top_rated?api_key=$apyKey";

  static String getMovieDetails(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apyKey";



  static String getRecommend(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apyKey";
  static const String baseUrlNowPaying = 'https://image.tmdb.org/t/p/w500';

  static String urlImage({required String path}) => '$baseUrlNowPaying$path';
}
