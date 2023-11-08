part of 'filter_bloc.dart';

sealed class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object> get props => [];
}
class FilterData extends FilterEvent {
  final int id;
  const FilterData({
    required this.id,
  });
}
