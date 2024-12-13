// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'application_router.dart';

/// generated route for:
/// [HomeFlowScreen].
class HomeFlowRoute extends PageRouteInfo<void> {
  const HomeFlowRoute({List<PageRouteInfo>? children})
      : super(
          HomeFlowRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeFlowRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeFlowScreen();
    },
  );
}

/// generated route for:
/// [ProductDetailsScreen].
class ProductDetailsRoute extends PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    Key? key,
    required Product product,
    List<PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsRouteArgs>();
      return ProductDetailsScreen(
        key: args.key,
        product: args.product,
      );
    },
  );
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    this.key,
    required this.product,
  });

  final Key? key;

  final Product product;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for:
/// [ProductsScreen].
class ProductsRoute extends PageRouteInfo<void> {
  const ProductsRoute({List<PageRouteInfo>? children})
      : super(
          ProductsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProductsScreen();
    },
  );
}
