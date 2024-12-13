part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object?> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> _products;

  const ProductsLoaded({
    required List<Product> products,
  }) : _products = products;

  @override
  List<Object?> get props => [
        _products,
      ];

  List<Product> get products => _products;
}

class ProductsError extends ProductsState {
  final String _message;

  const ProductsError({
    required String message,
  }) : _message = message;

  @override
  List<Object?> get props => [
        _message,
      ];

  String get message => _message;
}
