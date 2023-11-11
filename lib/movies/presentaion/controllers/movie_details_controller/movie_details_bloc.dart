import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn/core/utils/enums.dart';
import 'package:popcorn/movies/domain/entities/movie_details_entity.dart';
import 'package:popcorn/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:popcorn/movies/domain/usecases/get_recommendations_usecase.dart';

import '../../../domain/entities/recommendations_entity.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailUseCase ,this.getRecommendationsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailEvent>(_getMovieDetails);
    on<GetMovieRecommendationsEvent>(_getMovieRecommendations);
  }

  final GetMovieDetailUseCase getMovieDetailUseCase;
  final GetRecommendationsUseCase getRecommendationsUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailEvent event, Emitter<MovieDetailsState> emit) async {
    final response =
        await getMovieDetailUseCase(MovieDetailsParameters(event.id));
    print(response);
    response.fold((crash) => emit(
      state.copyWth(
        movieDetailsState: RequestState.error,
        movieDetailsMessage: crash.message
      )
    ), (response) => emit(
      state.copyWth(
        movieDetailsState: RequestState.loaded,
        movieDetails: response,
      )
    ));
  }

  FutureOr<void> _getMovieRecommendations(GetMovieRecommendationsEvent event, Emitter<MovieDetailsState> emit) async{

    final response =
    await getRecommendationsUseCase(RecommendationsParameters(event.id));

    response.fold((crash) => emit(
        state.copyWth(
            recommendationState: RequestState.error,
            recommendationMessage: crash.message
        )
    ), (response) => emit(
        state.copyWth(
          recommendationState: RequestState.loaded,
          recommendations: response,
        )
    ));
  }
}
