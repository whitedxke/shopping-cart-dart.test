part of 'product_details_bloc.dart';

abstract class ProductDetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetProductDetails extends ProductDetailsEvent {
  final Product _product;

  GetProductDetails({
    required Product product,
  }) : _product = product;

  @override
  List<Object?> get props => [
        _product,
      ];

  Product get product => _product;
}
