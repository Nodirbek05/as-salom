part of 'get_all_banners_bloc.dart';

sealed class GetAllBannersState extends Equatable {
  const GetAllBannersState();

  @override
  List<Object> get props => [];
}

class GetAllBannersInitial extends GetAllBannersState {}

class GetAllBannersLoading extends GetAllBannersState {}

class GetAllBannersFailed extends GetAllBannersState {
  final String errorMessage;
  const GetAllBannersFailed({
    required this.errorMessage,
  });
}

class GetAllBannersSucces extends GetAllBannersState {
  final GetAllBanners allBanners;
  const GetAllBannersSucces({
    required this.allBanners,
  });
}
