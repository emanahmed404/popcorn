import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetails extends Equatable {
  final String backDropPath;
  final List<Genres> genres;
  final int id;
  final String overView;
  final String releaseDate;
  final int runTime;
  final String title;
  final double voteAverage;

  const MovieDetails(
      {required this.backDropPath,
      required this.id,
      required this.genres,
      required this.overView,
      required this.releaseDate,
      required this.runTime,
      required this.title,
      required this.voteAverage});

  @override
  List<Object> get props => [
        backDropPath,
        genres,
        id,
        overView,
        releaseDate,
        runTime,
        title,
        voteAverage,
      ];
}
