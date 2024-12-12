import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/models/product/product.dart';
import '../../../core/network/network.dart';
import '../../../core/repositories/products/products_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository _productsRepository =
      ProductsRepository.getInstance();

  ProductsBloc() : super(ProductsInitial()) {
    on<GetProducts>(
      _getProducts,
    );
  }

  Future<void> _getProducts(
    GetProducts event,
    Emitter<ProductsState> emit,
  ) async {
    emit(
      ProductsLoading(),
    );
    try {
      final products = await _productsRepository.getProducts();
      emit(
        ProductsLoaded(
          products: products,
        ),
      );
    } catch (error) {
      _handleErrorMessage(
        error: error,
      );
    }
  }

  String _handleErrorMessage({
    required dynamic error,
  }) {
    if (error is NetworkException) {
      return error.message;
    } else if (error is ServerException) {
      return 'Server error: ${error.statusCode}.';
    } else {
      return 'An unknown error occurred: $error.';
    }
  }
}
