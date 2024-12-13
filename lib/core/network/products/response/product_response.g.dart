// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

GetProductsResponse _$GetProductsResponseFromJson(Map<String, dynamic> json) =>
    GetProductsResponse(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductFromNetwork.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ProductFromNetwork _$ProductFromNetworkFromJson(Map<String, dynamic> json) =>
    ProductFromNetwork(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      thumbnail: json['thumbnail'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
