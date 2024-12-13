import '../../../utils/extensions/double_extension.dart';
import '../../../utils/extensions/int_extension.dart';
import '../../../utils/extensions/list_extension.dart';
import '../../../utils/extensions/string_extension.dart';
import '../../network/products/response/product_response.dart';

class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final String thumbnail;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.thumbnail,
    required this.images,
  });

  static Product fromNetwork(
    ProductFromNetwork? productFromNetwork,
  ) {
    return Product(
      id: (productFromNetwork?.id).orEmpty(),
      title: (productFromNetwork?.title).orEmpty(),
      description: (productFromNetwork?.description).orEmpty(),
      category: (productFromNetwork?.category).orEmpty(),
      price: (productFromNetwork?.price).orEmpty(),
      thumbnail: (productFromNetwork?.thumbnail).orEmpty(),
      images: (productFromNetwork?.images).orEmpty(),
    );
  }
}
