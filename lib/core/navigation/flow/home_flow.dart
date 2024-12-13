import 'package:auto_route/auto_route.dart';

import '../application_router.dart';

class HomeFlowHelper {
  static List<AutoRoute> routes = [
    AutoRoute(
      page: ProductsRoute.page,
      path: '',
    ),
    AutoRoute(
      page: ProductDetailsRoute.page,
      maintainState: false,
    ),
  ];
}

@RoutePage()
class HomeFlowScreen extends AutoRouter {
  const HomeFlowScreen({super.key});
}
