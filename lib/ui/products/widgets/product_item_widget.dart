import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItemWidget extends StatelessWidget {
  final String _image;

  const ProductItemWidget({
    super.key,
    required String image,
  }) : _image = image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2.w,
        ),
        borderRadius: BorderRadius.circular(
          16.r,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        child: Image.network(
          _image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
