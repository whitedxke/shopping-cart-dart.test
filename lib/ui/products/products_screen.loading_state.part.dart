part of 'products_screen.dart';

Widget _buildProductsLoadingStateWidget() {
  return Center(
    child: CircularProgressIndicator(
      backgroundColor: Colors.white,
      strokeWidth: 6.r,
      valueColor: const AlwaysStoppedAnimation<Color>(
        Colors.black,
      ),
    ),
  );
}
