part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final List<Recommendations> recommendations;
  final RequestState recommendationState;
  final String recommendationMessage;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.recommendations = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = '',
  });

  MovieDetailsState copyWth({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<Recommendations>? recommendations,
    RequestState? recommendationState,
    String? recommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendations: recommendations ?? this.recommendations,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage: recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  List<Object?> get props =>
      [movieDetails, movieDetailsState, movieDetailsMessage,recommendations,recommendationState,recommendationMessage];
}
