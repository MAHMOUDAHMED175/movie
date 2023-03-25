import 'package:movei_api/mobile_movei/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    super.backdrobpath,
    required super.id,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        id: json["id"],
        backdrobpath:
        json["backdrop_path"] ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg',
      );
}