part of 'products_screen.dart';

Widget _buildProductsWidget({
  required List<Product> products,
  required void Function(Product) onProductDetailsTap,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const HeaderWidget(
        title: 'PRODUCTS',
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(
            top: 24.h,
          ),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(
                  bottom: 24.h,
                  left: 16.w,
                  right: 16.w,
                ),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 12.h,
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.w,
                    childAspectRatio: 1.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    childCount: products.length,
                    (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          onProductDetailsTap(
                            product,
                          );
                        },
                        child: ProductItemWidget(
                          image: product.thumbnail,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
