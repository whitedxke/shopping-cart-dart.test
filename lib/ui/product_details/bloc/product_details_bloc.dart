import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/product/product.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(ProductDetailsInitial()) {
    on<GetProductDetails>(
      _getProductDetails,
    );
  }

  void _getProductDetails(
    GetProductDetails event,
    Emitter<ProductDetailsState> emit,
  ) {
    emit(
      ProductDetailsLoaded(
        product: event.product,
      ),
    );
  }
}
