part of 'products_screen.dart';

Widget _buildProductsEmptyStateWidget() {
  return const BaseStateWidget(
    message: "Sorry, the request is not available. Try again later.",
    icon: Icons.warning_outlined,
  );
}
