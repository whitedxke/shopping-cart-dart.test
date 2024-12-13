import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../ui/product_details/product_details_screen.dart';
import '../../ui/products/products_screen.dart';
import '../models/product/product.dart';
import 'flow/home_flow.dart';

part 'application_router.gr.dart';

@AutoRouterConfig()
class ApplicationRouter extends RootStackRouter {
  static const _initialFlowPath = '/';

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  final List<AutoRoute> routes = [
    CustomRoute(
      path: _initialFlowPath,
      page: HomeFlowRoute.page,
      children: HomeFlowHelper.routes,
      barrierDismissible: false,
    ),
  ];
}
