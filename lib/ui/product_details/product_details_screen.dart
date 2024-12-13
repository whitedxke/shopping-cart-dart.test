import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/models/product/product.dart';
import '../widgets/header_widget.dart';
import 'bloc/product_details_bloc.dart';

part 'product_details_screen.description.part.dart';

@RoutePage()
class ProductDetailsScreen extends StatefulWidget {
  final Product _product;

  const ProductDetailsScreen({super.key, required Product product})
      : _product = product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    context.read<ProductDetailsBloc>().add(
      GetProductDetails(
        product: widget._product,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsLoaded) {
              return _buildProductDetailsDescriptionWidget(
                product: widget._product,
                onBackTap: () {
                  context.maybePop();
                },
                addToBasketTap: () {
                  // TODO: Need to add logic for Basket Screen.
                },
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
