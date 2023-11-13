part of 'get_product_with_slug_bloc.dart';

sealed class GetProductWithSlugState extends Equatable {
  const GetProductWithSlugState();

  @override
  List<Object> get props => [];
}

final class GetProductWithSlugInitial extends GetProductWithSlugState {}

class GetProductWithSlugFailed extends GetProductWithSlugState {
  final String errorMessage;
  const GetProductWithSlugFailed({
    required this.errorMessage,
  });
}

class GetProductWithSlugSuccess extends GetProductWithSlugState {
  final GetProWithSlugModel dataModel;
  const GetProductWithSlugSuccess({
    required this.dataModel,
  });
}
