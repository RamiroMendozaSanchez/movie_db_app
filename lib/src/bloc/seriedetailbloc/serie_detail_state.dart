import 'package:equatable/equatable.dart';
import 'package:movie_db_app/src/model/serieDetail.dart';

abstract class SerieDetailState extends Equatable {
  const SerieDetailState();

  @override
  List<Object> get props => [];
}

class SerieDetailLoading extends SerieDetailState {}

class SerieDetailError extends SerieDetailState {}

class SerieDetailLoaded extends SerieDetailState {
  final SerieDetails detail;
  const SerieDetailLoaded(this.detail);

  @override
  List<Object> get props => [detail];
}
