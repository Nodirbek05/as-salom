part of 'inside_cat_first_bloc.dart';

sealed class InsideCatFirstEvent extends Equatable {
  const InsideCatFirstEvent();

  @override
  List<Object> get props => [];
}

class InsideCatFirstData extends InsideCatFirstEvent {
  final int id;
 const InsideCatFirstData({
    required this.id,
  });
}
