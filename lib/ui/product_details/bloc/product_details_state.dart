part of 'product_details_bloc.dart';

abstract class ProductDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState {
  final Product _product;

  ProductDetailsLoaded({
    required Product product,
  }) : _product = product;

  @override
  List<Object?> get props => [
        _product,
      ];

  Product get product => _product;
}
