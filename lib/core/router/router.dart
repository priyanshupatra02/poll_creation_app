import 'package:auto_route/auto_route.dart';
import 'package:poll_creation_app/core/router/router.gr.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  late final List<AutoRoute> routes = [
    AdaptiveRoute(
      page: HomeRoute.page,
      path: '/',
      initial: true,
    ),
    AdaptiveRoute(
      page: CounterRoute.page,
      path: '/counter-page',

    ),
  ];
}
