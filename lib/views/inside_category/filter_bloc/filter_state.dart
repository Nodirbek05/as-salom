part of 'filter_bloc.dart';

sealed class FilterState extends Equatable {
  const FilterState();
  
  @override
  List<Object> get props => [];
}

final class FilterInitial extends FilterState {}

class FilterFailed extends FilterState {
  final String errorMessage;
  const FilterFailed({
    required this.errorMessage,
  });
}

class FilterSuccess extends FilterState {
  final FilterModel filterModel;
  const FilterSuccess({
    required this.filterModel,
  });
}
