import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/src/bloc/seriebloc/serie_event.dart';
import 'package:movie_db_app/src/bloc/seriebloc/serie_state.dart';
import 'package:movie_db_app/src/model/serie.dart';
import 'package:movie_db_app/src/service/api_service.dart';

class SerieBloc extends Bloc<SerieEvent, SerieState> {
  SerieBloc() : super(SerieLoading());

  @override
  Stream<SerieState> mapEventToState(SerieEvent event) async* {
    if (event is SerieEventStarted) {
      yield* _mapSerieEventStateToState(event.serieId, event.query);
    }
  }

  Stream<SerieState> _mapSerieEventStateToState(
      int serieId, String query) async* {
    final service = ApiService();
    yield SerieLoading();
    try {
      List<Serie> serieList;
      if (serieId == 0) {
        serieList = await service.getSeries();
      }

      yield SerieLoaded(serieList);
    } on Exception catch (e) {
      print(e);
      yield SerieError();
    }
  }
}
