import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/models/product/product.dart';
import '../../core/navigation/application_router.dart';
import '../widgets/header_widget.dart';
import 'bloc/products_bloc.dart';
import 'widgets/base_state_widget.dart';
import 'widgets/product_item_widget.dart';

part 'products_screen.empty_state.part.dart';
part 'products_screen.error_state.part.dart';
part 'products_screen.loading_state.part.dart';
part 'products_screen.products.part.dart';

@RoutePage()
class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return _buildProductsLoadingStateWidget();
            } else if (state is ProductsLoaded) {
              return _buildProductsWidget(
                products: state.products,
                onProductDetailsTap: _toNavigateProductDetails,
              );
            } else if (state is ProductsError) {
              return _buildProductsErrorStateWidget(
                message: state.message,
              );
            }
            return _buildProductsEmptyStateWidget();
          },
        ),
      ),
    );
  }

  void _toNavigateProductDetails(
    Product product,
  ) {
    context.pushRoute(
      ProductDetailsRoute(product: product),
    );
  }
}
