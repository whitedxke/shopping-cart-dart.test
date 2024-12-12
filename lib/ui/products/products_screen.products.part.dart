part of 'products_screen.dart';

Widget _buildProductsWidget({
  required List<Product> products,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _buildProductsHeaderWidget(),
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
                      return ProductItemWidget(
                        image: products[index].thumbnail,
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

Widget _buildProductsHeaderWidget() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: EdgeInsets.only(
          top: 16.h,
        ),
        child: Text(
          'PRODUCTS',
          style: TextStyle(
            fontSize: 24.h,
            height: 1.2,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          top: 4.h,
        ),
        child: Divider(
          thickness: 1.h,
          height: 1.h,
          color: Colors.black,
        ),
      ),
    ],
  );
}
