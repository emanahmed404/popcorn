import 'package:popcorn/movies/domain/entities/recommendations_entity.dart';

class RecommendationsModel extends Recommendations {
  const RecommendationsModel({super.backDropPath, required super.id});

  factory RecommendationsModel.fromJson(Map<String, dynamic> json) =>
      RecommendationsModel(backDropPath: json['backdrop_path'] ?? "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: json['id']);
}
