part of 'inside_cat_first_bloc.dart';

sealed class InsideCatFirstState extends Equatable {
  const InsideCatFirstState();

  @override
  List<Object> get props => [];
}

final class InsideCatFirstInitial extends InsideCatFirstState {}

class InsideCatFirstFail extends InsideCatFirstState {
  final String errorMessage;
  const InsideCatFirstFail({
    required this.errorMessage,
  });
}

class InsideCatFirstSuccess extends InsideCatFirstState {
  final CategoryInnerModel modelData;
  const InsideCatFirstSuccess({
    required this.modelData,
  });
}
