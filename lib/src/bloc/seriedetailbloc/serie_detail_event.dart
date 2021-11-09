import 'package:equatable/equatable.dart';

abstract class SerieDetailEvent extends Equatable {
  const SerieDetailEvent();
}

class SerieDetailEventStated extends SerieDetailEvent {
  final String url;

  SerieDetailEventStated(this.url);

  @override
  List<Object> get props => [];
}
