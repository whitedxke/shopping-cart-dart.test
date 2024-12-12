part of 'products_screen.dart';

Widget _buildProductsErrorStateWidget({
  required String message,
}) {
  return BaseStateWidget(
    message: message,
    icon: Icons.error_outline,
  );
}
