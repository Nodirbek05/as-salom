part of 'get_sub_banners_bloc.dart';

sealed class GetSubBannersState extends Equatable {
  const GetSubBannersState();
  
  @override
  List<Object> get props => [];
}

 class GetSubBannersInitial extends GetSubBannersState {}

class GetSubBannersFail extends GetSubBannersState {
  final String errorMessage;
 const GetSubBannersFail({
    required this.errorMessage,
  });
 }

class GetSubBannersSuccess extends GetSubBannersState {
  final GetSubBannersModel subBanners;
  const GetSubBannersSuccess({
    required this.subBanners,
  });
 }


