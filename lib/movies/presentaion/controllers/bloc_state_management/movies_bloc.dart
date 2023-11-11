import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn/core/use_case/base_use_case.dart';
import 'package:popcorn/core/utils/enums.dart';
import 'package:popcorn/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:popcorn/movies/presentaion/controllers/bloc_state_management/movies_event.dart';
import 'package:popcorn/movies/presentaion/controllers/bloc_state_management/movies_state.dart';

import '../../../domain/usecases/get_popular_movies_usecase.dart';
import '../../../domain/usecases/get_top_rated_movies_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRated);
  }


  Future<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    emit(const MoviesState(nowPlayingState: RequestState.loaded));
    result.fold(
        (crash) => emit(
              state.copyWith(
                  nowPlayingState: RequestState.error,
                  nowPlayingMessage: crash.message),
            ),
        (response) => emit(state.copyWith(
            nowPlayingMovies: response, nowPlayingState: RequestState.loaded)));
    print(result);
  }

  Future<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async{
    final popularResult = await getPopularMoviesUseCase(const NoParameters());
    popularResult.fold(
            (crash) => emit(
              state.copyWith(
            popularState: RequestState.error,
            popularMessage: crash.message,
          ),
        ),
            (response) => emit( state.copyWith(
            popularState: RequestState.loaded, popularMovies: response)));
  }

  Future<void> _getTopRated(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async{

    final topRatedResponse = await getTopRatedMoviesUseCase(const NoParameters());
    topRatedResponse.fold(
            (crash) => emit(state.copyWith(
          topRatedState: RequestState.error,
          topRatedMessage: crash.message,
        )),
            (response) => emit(state.copyWith(
          topRatedMovies: response,
          topRatedState: RequestState.loaded,
        )));
  }

}


