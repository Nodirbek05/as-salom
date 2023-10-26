part of 'get_all_banners_bloc.dart';

sealed class GetAllBannersEvent extends Equatable {
  const GetAllBannersEvent();

  @override
  List<Object> get props => [];
}

class GetBannersDataEvent extends GetAllBannersEvent {}
