part of 'get_sub_banners_bloc.dart';

sealed class GetSubBannersEvent extends Equatable {
  const GetSubBannersEvent();

  @override
  List<Object> get props => [];
}

class GetSubBannersEventData extends GetSubBannersEvent{}