import 'package:equatable/equatable.dart';
import 'package:movie_db_app/src/model/serie.dart';

abstract class SerieState extends Equatable {
  const SerieState();

  @override
  List<Object> get props => [];
}

class SerieLoading extends SerieState {}

class SerieLoaded extends SerieState {
  final List<Serie> serieList;
  const SerieLoaded(this.serieList);

  @override
  List<Object> get props => [serieList];
}

class SerieError extends SerieState {}
