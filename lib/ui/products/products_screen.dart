import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/products_bloc.dart';

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
              return const Center(
                child: Text(
                  'PRODUCTS LOADING!',
                ),
              );
            } else if (state is ProductsLoaded) {
              return const Center(
                child: Text(
                  'PRODUCTS LOADED!',
                ),
              );
            } else if (state is ProductsError) {
              return const Center(
                child: Text(
                  'PRODUCTS ERROR!',
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
