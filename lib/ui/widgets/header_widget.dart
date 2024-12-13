import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderWidget extends StatelessWidget {
  final String _title;
  final void Function()? _onBackTap;

  const HeaderWidget({
    super.key,
    required String title,
    void Function()? onBackTap,
  })  : _title = title,
        _onBackTap = onBackTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 16.h,
            right: _onBackTap != null ? 16.w : 0.w,
          ),
          child: Row(
            mainAxisAlignment: _onBackTap != null
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Visibility(
                visible: _onBackTap != null,
                child: IconButton(
                  onPressed: () {
                    if (_onBackTap != null) {
                      _onBackTap();
                    }
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 16.h,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                _title,
                style: TextStyle(
                  fontSize: 24.sp,
                  height: 1.2,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
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
}
