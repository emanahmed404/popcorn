part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}


class GetMovieDetailEvent extends MovieDetailsEvent {
  final int id;

  const GetMovieDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}



class GetMovieRecommendationsEvent extends MovieDetailsEvent {
  final int id;

  const GetMovieRecommendationsEvent(this.id);

  @override
  List<Object> get props => [id];
}
