import 'package:get_it/get_it.dart';

import '../../models/product/product.dart';
import '../network.dart';
import 'response/product_response.dart';

class ProductsApi {
  final _network = GetIt.instance.get<Network>();

  Future<List<Product>> getProducts() async {
    try {
      final response = await _network.getResponse(
        endpoint: '/products',
      );
      final getProductsResponse = GetProductsResponse.fromJson(
        response,
      );
      final List<ProductFromNetwork> productsFromNetwork =
          getProductsResponse.products ?? List.empty();

      return productsFromNetwork.map((productFromNetwork) {
        return Product.fromNetwork(
          productFromNetwork,
        );
      }).toList();
    } catch (exception) {
      throw Exception(
        'Error getting products: $exception.',
      );
    }
  }
}
