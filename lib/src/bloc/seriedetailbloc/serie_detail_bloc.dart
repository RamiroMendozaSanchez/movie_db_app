import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/src/bloc/seriedetailbloc/serie_detail_event.dart';
import 'package:movie_db_app/src/bloc/seriedetailbloc/serie_detail_state.dart';
import 'package:movie_db_app/src/service/api_service.dart';

class SerieDetailBloc extends Bloc<SerieDetailEvent, SerieDetailState> {
  SerieDetailBloc() : super(SerieDetailLoading());

  @override
  Stream<SerieDetailState> mapEventToState(SerieDetailEvent event) async* {
    if (event is SerieDetailEventStated) {
      yield* _mapSerieEventStartedToState(event.url);
    }
  }

  Stream<SerieDetailState> _mapSerieEventStartedToState(String url) async* {
    final apiRepository = ApiService();
    yield SerieDetailLoading();
    try {
      final serieDetails = await apiRepository.getSerieDetail(url);

      yield SerieDetailLoaded(serieDetails);
    } on Exception catch (e) {
      print(e);
      yield SerieDetailError();
    }
  }
}
