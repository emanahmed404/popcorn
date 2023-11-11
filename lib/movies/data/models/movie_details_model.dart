import 'package:popcorn/movies/data/models/genres_model.dart';
import 'package:popcorn/movies/domain/entities/movie_details_entity.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.backDropPath,
      required super.id,
      required super.genres,
      required super.overView,
      required super.releaseDate,
      required super.runTime,
      required super.title,
      required super.voteAverage});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
          backDropPath: json['backdrop_path']?? "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg",
          id: json['id'],
          genres: List<GenresModel>.from(json['genres'].map((x)=>GenresModel.fromJson(x))),
          overView: json['overview'],
          releaseDate: json['release_date'],
          runTime: json['runtime'],
          title: json['title'],
          voteAverage: json['vote_average'].toDouble());
}
