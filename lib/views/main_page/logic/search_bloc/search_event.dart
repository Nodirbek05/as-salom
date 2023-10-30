part of 'search_bloc.dart';

class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchProduct extends SearchEvent {
  final String query;

  const SearchProduct({required this.query});
}
