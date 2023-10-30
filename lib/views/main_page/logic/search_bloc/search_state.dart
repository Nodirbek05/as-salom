part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchFail extends SearchState {
  final ErrorModel errorData;

  const SearchFail({required this.errorData});
}

final class SearchSuccess extends SearchState {
  final SearchModel data;

  const SearchSuccess({required this.data});
}
