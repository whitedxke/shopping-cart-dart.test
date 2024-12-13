import 'package:json_annotation/json_annotation.dart';

part 'product_response.g.dart';

@JsonSerializable(createToJson: false)
class GetProductsResponse {
  @JsonKey(name: "products")
  final List<ProductFromNetwork>? products;

  GetProductsResponse({
    required this.products,
  });

  @override
  String toString() {
    return 'GetProductsResponse{products: $products}';
  }

  factory GetProductsResponse.fromJson(Map<String, Object?> json) =>
      _$GetProductsResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class ProductFromNetwork {
  @JsonKey(name: "id")
  final int? id;

  @JsonKey(name: "title")
  final String? title;

  @JsonKey(name: "description")
  final String? description;

  @JsonKey(name: "category")
  final String? category;

  @JsonKey(name: "price")
  final double? price;

  @JsonKey(name: "thumbnail")
  final String? thumbnail;

  @JsonKey(name: "images")
  final List<String>? images;

  ProductFromNetwork({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.thumbnail,
    this.images,
  });

  @override
  String toString() {
    return 'ProductFromNetwork{id: $id, title: $title, description: $description, category: $category, price: $price, thumbnail: $thumbnail, images: $images}';
  }

  factory ProductFromNetwork.fromJson(Map<String, Object?> json) =>
      _$ProductFromNetworkFromJson(json);
}
