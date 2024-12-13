part of 'product_details_screen.dart';

Widget _buildProductDetailsDescriptionWidget({
  required Product product,
  required void Function() addToBasketTap,
  required void Function() onBackTap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      HeaderWidget(
        title: 'PRODUCTS DETAILS',
        onBackTap: () {},
      ),
      Padding(
        padding: EdgeInsets.only(
          top: 16.h,
        ),
        child: Image.network(
          product.thumbnail,
          width: double.infinity,
          height: 250.h,
          fit: BoxFit.fill,
        ),
      ),
      Expanded(
        child: _buildProductDetailsWidget(
          title: product.title,
          description: product.description,
          category: product.category,
        ),
      ),
      _buildAddToBasketButtonWidget(
        addToBasketTap: addToBasketTap,
      ),
    ],
  );
}

Widget _buildProductDetailsWidget({
  required String title,
  required String description,
  required String category,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 16.w,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 12.h,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24.sp,
              color: Colors.black,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 4.h,
          ),
          child: Text(
            category,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: Colors.black,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 10.h,
          ),
          child: Text(
            description,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildAddToBasketButtonWidget({
  required void Function() addToBasketTap,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 16.w,
      vertical: 24.h,
    ),
    child: GestureDetector(
      onTap: () {
        addToBasketTap();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12.r,
          ),
          color: Colors.black,
        ),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
          ),
          child: Text(
            'Add to basket',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24.sp,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );
}
