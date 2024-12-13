import 'package:get_it/get_it.dart';

import '../../models/product/product.dart';
import '../../network/products/products_api.dart';
import '../base_repository.dart';

class ProductsRepository extends BaseRepository {
  late final ProductsApi _productsApi;

  static ProductsRepository getInstance() {
    return GetIt.instance.get<ProductsRepository>();
  }

  Future<List<Product>> getProducts() async {
    try {
      return await _productsApi.getProducts();
    } catch (exception) {
      throw Exception(
        'Error getting products: $exception.',
      );
    }
  }

  @override
  Future<void> initialDependencies() async {
    _productsApi = GetIt.instance.get<ProductsApi>();
  }

  @override
  void registration({
    required GetIt getIt,
  }) {
    getIt.registerSingleton(this);
  }
}
