part of 'get_product_with_slug_bloc.dart';

sealed class GetProductWithSlugEvent extends Equatable {
  const GetProductWithSlugEvent();

  @override
  List<Object> get props => [];
}

class GetProductWithSlugData extends GetProductWithSlugEvent {
  final String slug;
  const GetProductWithSlugData({
    required this.slug,
  });
}
